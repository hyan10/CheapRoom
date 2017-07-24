package kr.co.bit.cr.booking;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bit.cr.chart.ChartService;
import kr.co.bit.cr.chart.ChartVO;
import kr.co.bit.cr.hotel.HotelService;
import kr.co.bit.cr.hotel.HotelVO;
import kr.co.bit.cr.owner.OwnerVO;
import kr.co.bit.cr.room.RoomVO;
import kr.co.bit.cr.user.UserVO;

@Controller
@RequestMapping("/booking")
public class BookingController {
	@Autowired
	BookingService service;
	
	@Autowired
	HotelService  hotelService;

	@Autowired
	HttpSession session;
	
	////// owner로 이동
	@Autowired
	ChartService chartService;
	

	// 예약폼
	@RequestMapping(value="/book.cr", method=RequestMethod.GET)
	public ModelAndView book(@RequestParam("roomNo") int roomNo,
								@CookieValue(value="startDate", required=false) Cookie startDate,
								@CookieValue(value="endDate",required=false)Cookie endDate,
								@CookieValue(value="personNo",required=false)Cookie personNo) {
//	public ModelAndView book(@RequestParam("roomNo") int roomNo){
		ModelAndView mav = new ModelAndView();
		
		//////////////////////////// 테스트 호텔, 룸 데이터
		/*roomNo = 1;
		HotelVO hotel = new HotelVO();
		hotel.setNo(1);
		hotel.setName("테스트호텔");
		
		List<RoomVO> rooms = new ArrayList<>();
		RoomVO r = new RoomVO();
		r.setNo(roomNo);
		r.setName("테스트방");
		r.setPrice(30000);
		r.setMinPerson(2);
		r.setAddPrice(10000);
		rooms.add(r);
		hotel.setRooms(rooms);*/
		//////////////////////////// 테스트 호텔, 룸 데이터 끝
		
		HotelVO hotel = hotelService.selectHotelByRno(roomNo);
		
		// 예약하려는 방 찾기
	//	List<RoomVO> roomList = hotel.getRooms();
		RoomVO room = hotel.getRooms().get(0);
		/*for(RoomVO vo : roomList){
			if(vo.getNo()==roomNo){
				room = vo;
				break;
			}
		}*/
		
		// 날짜 계산
		String start = startDate.getValue();
		String end = endDate.getValue();

		////////////////////////////////////////////// 테스트 날짜 데이터
//		String start = "2017-05-30";
//		String end = "2017-06-02";
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date sd, ed;
		int diffDays = 1;
		
		try {
			sd = sdf.parse(start);
			ed = sdf.parse(end);
			
			long diff = ed.getTime() - sd.getTime();
		    diffDays = (int) (diff / (24 * 60 * 60 * 1000));
			
		//	System.out.println(diffDays);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		// 인원 수 추가 계산
		int totalPerson = Integer.parseInt(personNo.getValue()); // 4;
		int addPersonNo = totalPerson - room.getMinPerson();
		
		// 총 가격 (1박가격*일수 + 1인추가요금*추가인원)
		int totalPrice = room.getPrice()*diffDays + room.getAddPrice()*addPersonNo;
		
		/* BookingVO(Integer hotelNo, Integer roomNo,
					String startDate, String endDate,
					Integer totalPerson, Integer totalPrice,
					String hotelName, String roomName)
		*/
		// Integer.parseInt(personNo.getValue())
		BookingVO booking = new BookingVO(hotel.getNo(), room.getNo(),
										start, end,
										totalPerson, totalPrice,
										hotel.getName(), room.getName());
		
		mav.addObject("booking", booking);
		mav.setViewName("booking/booking");
		return mav;
	}

	// 예약
	@RequestMapping(value="/book.cr", method=RequestMethod.POST)
	public ModelAndView book(BookingVO booking) {
		ModelAndView mav = new ModelAndView();
		
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		//booking.setUserNo(loginUser.getNo());
		booking.setUserNo(3);
		
		System.out.println(booking);
		
		int result = service.book(booking);
		
		// 예약 성공
		if (result == 1) {
		//	mav.setViewName("redirect:/booking/test.cr");  // user/booking.cr
			mav.addObject("msg", "예약이 완료되었습니다.");
			mav.addObject("url", "/user/bookingList.cr");
		} else { // 예약 실패
			mav.addObject("msg", "예약 실패\n다시 시도해주세요.");
			mav.addObject("url","/roomList.cr?hotelNo="+booking.getHotelNo());
		}
		mav.setViewName("process/alertProcess");
		
		return mav;
	}
	
	// 예약 수정 폼
	@RequestMapping(value="/update.cr", method=RequestMethod.GET)
	public ModelAndView updateBook(@RequestParam("bookingNo") int bookingNo){
		ModelAndView mav = new ModelAndView();
		BookingVO booking = service.detailBooking(bookingNo);
		mav.addObject("booking",booking);
		mav.setViewName("booking/update");  // booking/update
		return mav;
	}

	// 예약 수정
	@RequestMapping(value="/update.cr", method=RequestMethod.POST)
	public ModelAndView updateBook(BookingVO booking) {
		
		System.out.println(booking);
		
		int result = service.updateBook(booking);
		
		ModelAndView mav = new ModelAndView("/process/alertProcess");
		mav.addObject("url","/booking/test.cr");
		
		// 수정 성공
		if (result == 1) {
			mav.addObject("msg", "수정이 완료되었습니다.");
		} else { // 수정 실패
			mav.addObject("msg", "수정 실패\n다시 시도해주세요.");
		}

		return mav;
	}
	

	// 예약 취소
	@RequestMapping("/cancle.cr")
	public ModelAndView cancleBook(BookingVO booking) {
		int result = service.cancleBook(booking);

		ModelAndView mav = new ModelAndView("/process/alertProcess");
		mav.addObject("url","/booking/test.cr");
		
		// 취소 성공
		if (result == 1) {
			mav.addObject("msg", "취소가 완료되었습니다.");			
		} else { // 취소 실패
			mav.addObject("msg", "취소 처리 실패\n다시 시도해주세요.");
		}

		return mav;
	}
	
	
	// 예약 현황 예약번호로 조회
	@RequestMapping("/detail.cr")
	public ModelAndView selectBookingDetail(@RequestParam("bookingNo") int bookingNo,
											HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		BookingVO booking = service.detailBooking(bookingNo);
		mav.addObject("booking",booking);
		// detail page에서 돌아갈 url (예약리스트)
		mav.addObject("url","bookingList.cr");
//		mav.addObject("url","test.cr");
		mav.setViewName("booking/detail");
		return mav;
	}
	
	// 지난 예약 예약번호로 조회
	@RequestMapping("/historyDetail.cr")
	public ModelAndView selectBookingHistoryDetail(@RequestParam("bookingNo") int bookingNo,
													HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		BookingVO booking = service.detailBookingHistory(bookingNo);
		mav.addObject("booking",booking);
		// detail page에서 돌아갈 url (지난 예약 리스트)
		mav.addObject("url","bookingHistoryList.cr");
//		mav.addObject("url","testHistory.cr");
		mav.setViewName("booking/detail");
		return mav;
	}
	

	// 유저 예약 조회
	/*
	 * @RequestMapping("/bookingList.cr") public ModelAndView userBookingList(){
	 * List<BookingVO> list = service.userBookingList(1);
	 * System.out.println(list); ModelAndView mav = new ModelAndView();
	 * mav.addObject("bookingList",list); mav.setViewName("struct"); return mav;
	 * }
	 */

	@RequestMapping("/test.cr")
	public ModelAndView test() {

		// bookingList
		List<BookingVO> bookingList = service.userBookingList(1);
		System.out.println(bookingList);
		ModelAndView mav = new ModelAndView();
		mav.addObject("bookingList", bookingList);
		mav.setViewName("user/bookingList");

		return mav;
	}

	@RequestMapping("/testHistory.cr")
	public ModelAndView test1() {

		// bookingHistoryList
		List<BookingVO> bookingList = service.userBookingHistoryList(1);
		System.out.println(bookingList);
		ModelAndView mav = new ModelAndView();
		mav.addObject("bookingList", bookingList);
		mav.setViewName("user/bookingHistoryList");

		return mav;
	}
	
	@RequestMapping("/testHotel.cr")
	public String test2(){
		return "hotelList";
	}
	
	@RequestMapping("/testChart.cr")
	public String test3(Model model, HttpServletRequest request){
		// List<ChartVO> chartList = chartService.chartThisMonthByOwnerNo(1);
		// List<ChartVO> chartList = chartService.chartThisMonth();
		
		// 현재 월이 최대 월
		int maxMonth = new Date().getMonth()+1;
		int month = request.getParameter("month")!=null?Integer.parseInt(request.getParameter("month")):maxMonth;
		request.setAttribute("month", month);
		request.setAttribute("maxMonth", maxMonth);
//		System.out.println(month);
//		 List<ChartVO> chartList = chartService.chartLastMonth(month);
		
		Map<String,Integer> map = new HashMap<>();
		int ownerNo = 1;
		OwnerVO owner = (OwnerVO)session.getAttribute("loginUser");
		if(owner!=null){
			ownerNo = owner.getNo();
		}
		map.put("no", ownerNo);
		map.put("month", month);
//		System.out.println(map);
		List<ChartVO> chartList = chartService.chartLastMonthByOwnerNo(map);

//		 List<ChartVO> chartList = chartService.chartAllByOwnerNo(ownerNo);
		 // System.out.println(chartList);
		model.addAttribute("chartList", chartList);
		return "owner/chart";
	}	
}