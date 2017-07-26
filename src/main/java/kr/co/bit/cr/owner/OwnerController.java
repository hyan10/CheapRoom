package kr.co.bit.cr.owner;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bit.cr.booking.BookingService;
import kr.co.bit.cr.booking.BookingVO;
import kr.co.bit.cr.chart.ChartService;
import kr.co.bit.cr.chart.ChartVO;
import kr.co.bit.cr.hotel.HotelService;
import kr.co.bit.cr.hotel.HotelVO;
import oracle.net.aso.h;

@Controller
@RequestMapping("/owner")
public class OwnerController {
	@Autowired
	private OwnerService ownerService;
	@Autowired
	private ChartService chartService; 
	@Autowired
	private BookingService bookingService; 
	@Autowired
	private HotelService hotelService;
	
	@Autowired
	private HttpSession session;
	
	
	/*@RequestMapping(value="/join.cr", method=RequestMethod.POST) 
	//public String join(UserVO userVO){
	public String join(HttpServletRequest request){
		//System.out.println("join info ----- > " + userVO);
		String name = (String)request.getParameter("name");
		String email = (String)request.getParameter("email");
		String phone  = (String)request.getParameter("phone");
		String password = (String)request.getParameter("password");
		UserVO user = new UserVO(email, password, "U", name, phone);
		System.out.println("user 가입정보 : " + user);
		//userService.join(user);
		return "redirect:/";
	}*/
	@RequestMapping(value="/join.cr", method=RequestMethod.POST)
	public String join(OwnerVO ownerVO){
		System.out.println("owner 가입정보 : "+ownerVO);
		ownerService.join(ownerVO);
		return "redirect:/";
	}
	@RequestMapping("/login.cr")
	public String login(OwnerVO ownerVO, Model model, HttpSession session){
		OwnerVO owner = ownerService.login(ownerVO);
		if(owner == null){			
			model.addAttribute("msg", "사업자 아이디 또는 패스워드가 잘못되었습니다.");
			System.out.println("사업자 로그인 실패");
			model.addAttribute("url", "");
			return "process/alertProcess";
		} else {
			System.out.println(owner + " 사업자 로그인 성공");
		}
		session.setAttribute("loginUser", owner);
		///model.addAttribute("loginUser", owner);
		return "redirect:/owner/ownerPage.cr";
	}
	//사업자 번호로 호텔리스트 조회(사업자 페이지 출력용)
	@RequestMapping("/ownerPage.cr")
	public String selectHotelListByOwerNo(Model model, HttpSession session){
		OwnerVO owner = (OwnerVO) session.getAttribute("loginUser");
		List<HotelVO> hotelList = hotelService.selectHotelListByOno(owner.getNo());
		model.addAttribute("hotelList", hotelList);
		System.out.println(owner);
		return "ownerPage";
	}
	@RequestMapping("/logout.cr")
	public String logout(HttpSession session, SessionStatus sessionStatus){
		OwnerVO owner = (OwnerVO) session.getAttribute("loginUser");
		System.out.println("로그아웃 정보" + owner);
		session.invalidate();
		//sessionStatus.setComplete();
		return "redirect:/";
	}
	@RequestMapping("/enrollHotel.cr")
	public String ownerEnrollHotel(){
		return "registerHotel";
	}
	@RequestMapping("/hotelRegister.cr")
	public String registerRoomView(){
		return "registerRoom";
	}
	@RequestMapping("/info.cr")
	public void ownerInfo(){
		
	}
	
	/**
	 * owner가 소유한 호텔의 현재 진행중인 예약 내역
	 * @return
	 */
	@RequestMapping("/bookingList.cr")
	public ModelAndView ownerBookingList(){
		ModelAndView mav = new ModelAndView();
		List<BookingVO> bookingList = new ArrayList<>();
		bookingList = bookingService.ownerBookingList(((OwnerVO)session.getAttribute("loginUser")).getNo());
		
		mav.addObject("bookingList", bookingList);
		mav.setViewName("owner/bookingList");
		
		return mav;
	}
	
	/**
	 * owner가 소유한 호텔 예약 지난내역
	 * @return
	 */
	@RequestMapping("/bookingHistoryList.cr")
	public ModelAndView ownerBookingHistory(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		List<ChartVO> chartList = new ArrayList<>();
		List<BookingVO> bookingList = new ArrayList<>();
	
		// 1. 날짜 계산 & 저장
		// 현재 월이 최대 월
		int maxMonth = new Date().getMonth()+1;
		int month = request.getParameter("month")!=null?Integer.parseInt(request.getParameter("month")):maxMonth;
		request.setAttribute("month", month);
		request.setAttribute("maxMonth", maxMonth);
		
		// 2. ownerNo 가져오기
		int ownerNo = 1;
		OwnerVO owner = (OwnerVO)session.getAttribute("loginUser");
		if(owner!=null){
			ownerNo = owner.getNo();
		}
		
		// 이번 달 통계
		 if(maxMonth == month){
	         chartList = chartService.chartThisMonthByOwnerNo(ownerNo);
	         Map<String,Integer> map = new HashMap<>();
	         
	         map.put("no", ownerNo); 
	         map.put("month", month);

	         //bookingList = bookingService.ownerBookingHistoryList(ownerNo);
	         bookingList = bookingService.ownerBookingHistoryList(map);
		}else {
			// n월의 통계
			Map<String,Integer> map = new HashMap<>();
			
			map.put("no", ownerNo); 
			map.put("month", month);
//			System.out.println(map);
			chartList = chartService.chartLastMonthByOwnerNo(map);
			bookingList = bookingService.ownerBookingHistoryList(map);
		}
		
		 // 빈 데이터 추가
			List<ChartVO> cList = new ArrayList<>();
			cList.addAll(chartList);
			for(String hotelName : hotelService.selectHotelNameByOno(ownerNo)){
				for(ChartVO c : chartList){
					if(!c.getHotelName().equals(hotelName)){
						ChartVO chart = new ChartVO();
						chart.setHotelName(hotelName);//hotelService.selectHotelNameByOno(ownerNo).get(0));   
						chart.setCount(0);
						chart.setProfit(0);
						chart.setTotalPerson(0);
						cList.add(chart);						
					}
				}
			}
			
		if(chartList.isEmpty()){
			chartList = new ArrayList<>();
			for(String hotelName : hotelService.selectHotelNameByOno(ownerNo)){
				ChartVO chart = new ChartVO();
				chart.setHotelName(hotelName);//hotelService.selectHotelNameByOno(ownerNo).get(0));   
				chart.setCount(0);
				chart.setProfit(0);
				chart.setTotalPerson(0);
				cList.add(chart);	
			}
		}
		
		if(bookingList==null){
			bookingList = new ArrayList<>();
		}
		
		System.out.println(chartList);
		
		mav.addObject("bookingList",bookingList);
		mav.addObject("chartList",cList);
		mav.setViewName("owner/bookingHistoryList");
		
		return mav;
	}
	@RequestMapping("/review.cr")
	public void ownerReview(){
		
	}
	
	/**
	 * owner의 전체 통계
	 * @return
	 */
	@RequestMapping("/chart.cr")
	public ModelAndView ownerChartAll(){
		ModelAndView mav = new ModelAndView();
		List<ChartVO> chartList = new ArrayList<>();
		int month = new Date().getMonth()+1;
		// 1. ownerNo 가져오기
		int ownerNo = 1;
		OwnerVO owner = (OwnerVO)session.getAttribute("loginUser");
		if(owner!=null){
			ownerNo = owner.getNo();
		}
		
		chartList = chartService.chartAllByOwnerNo(ownerNo);
		if(chartList.isEmpty()){
			chartList = new ArrayList<>();
			ChartVO chart = new ChartVO();
			chart.setHotelName(hotelService.selectHotelNameByOno(ownerNo).get(0));   
			chart.setCount(0);
			chart.setProfit(0);
			chart.setMonth(month);
			chart.setTotalPerson(0);
			chartList.add(chart);
		}
		mav.addObject("chartList",chartList);
		mav.setViewName("owner/chart");
		
		return mav;
	}
}
