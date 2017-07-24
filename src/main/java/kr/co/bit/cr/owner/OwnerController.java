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
			return "redirect:/";
		} else {
			System.out.println(owner + " 사업자 로그인 성공");
		}
		session.setAttribute("loginUser", owner);
		///model.addAttribute("loginUser", owner);
		return "redirect:/owner/ownerPage.cr";
	}
	@RequestMapping("/ownerPage.cr")
	public String url(){
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
	@RequestMapping("/bookingList.cr")
	public void ownerBookingList(){
	}
	@RequestMapping("/bookingHistory.cr")
	public void ownerBookingHistory(){
		
	}
	@RequestMapping("/review.cr")
	public void ownerReview(){
		
	}
	
	/**
	 * owner의 기본 통계
	 * @param request
	 * @return
	 */
	@RequestMapping("/chart.cr")
	public ModelAndView ownerChart(HttpServletRequest request){
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
			bookingList = bookingService.ownerBookingHistoryList(ownerNo);
		}else {
			// n월의 통계
			Map<String,Integer> map = new HashMap<>();
			
			map.put("no", ownerNo); 
			map.put("month", month);
//			System.out.println(map);
			chartList = chartService.chartLastMonthByOwnerNo(map);
			bookingList = bookingService.ownerBookingHistoryList(map);
		}
		
		if(chartList.isEmpty()){
			chartList = new ArrayList<>();
			ChartVO chart = new ChartVO();
			chart.setHotelName("");  // hotelService.selectHotelNameByOno(ownerNo)
			chart.setCount(0);
			chart.setProfit(0);
			chart.setTotalPerson(0);
			chartList.add(chart);
		}
		
		if(bookingList==null){
			bookingList = new ArrayList<>();
		}
		
		System.out.println(chartList);
		
		mav.addObject("bookingList",bookingList);
		mav.addObject("chartList",chartList);
		mav.setViewName("owner/chart");
		
		return mav;
	}
	
	/**
	 * owner의 전체 통계
	 * @return
	 */
	@RequestMapping("/chartAll.cr")
	public ModelAndView ownerChartAll(){
		ModelAndView mav = new ModelAndView();
		List<ChartVO> chartList = new ArrayList<>();
		
		// 1. ownerNo 가져오기
		int ownerNo = 1;
		OwnerVO owner = (OwnerVO)session.getAttribute("loginUser");
		if(owner!=null){
			ownerNo = owner.getNo();
		}
		
		chartList = chartService.chartAllByOwnerNo(ownerNo);
		
		mav.addObject("chartList",chartList);
		mav.setViewName("owner/chartAll");
		
		return mav;
	}
}
