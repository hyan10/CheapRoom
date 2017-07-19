package kr.co.bit.cr.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bit.cr.booking.BookingService;
import kr.co.bit.cr.booking.BookingVO;
import kr.co.bit.cr.owner.OwnerService;
import kr.co.bit.cr.owner.OwnerVO;

@Controller
@RequestMapping("/user")
@SessionAttributes("user")
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private OwnerService ownerService;
	@Autowired
	private BookingService bookingService;
	
	@RequestMapping(value="/join.cr", method=RequestMethod.POST) 
	//public String join(UserVO userVO){
	public String join(HttpServletRequest request){
		//System.out.println("join info ----- > " + userVO);
		String name = (String)request.getParameter("name");
		String email = (String)request.getParameter("email");
		String phone  = (String)request.getParameter("phone");
		String password = (String)request.getParameter("password");
		UserVO user = new UserVO(email, password, "U", name, phone);
		System.out.println("user 가입정보 : " + user);
		userService.join(user);
		return "redirect:/";
	}
	
//	@RequestMapping(value="/login.cr", method=RequestMethod.GET)
//	public String loginForm(){
//		return "/user/login.cr";
//	}
	@RequestMapping(value="/login.cr", method=RequestMethod.POST)
	public String login(UserVO userVO, Model model, HttpSession session){
		UserVO user = userService.login(userVO); 
		if(user == null){
			model.addAttribute("msg", "아이디 또는 패스워드가 잘못되었습니다.");
			System.out.println("아이디 또는 패스워드가 잘못되었습니다.");
			return "redirect:/";
		} else {
			System.out.println("로그인 성공 : " + user);
		}
		model.addAttribute("loginUser", user);
		return "search";
	}
	/*@RequestMapping(value="/login.cr", method=RequestMethod.POST)
	public String login(HttpServletRequest request, UserVO userVO, Model model, HttpSession session){
		String loginType = request.getParameter("loginType");
		System.out.println("로그인 타입 : "+loginType);
		UserVO user = null;
		OwnerVO owner = null;
		String email = userVO.getEmail();
		String password = userVO.getPassword();
		if(loginType != null){
			owner = OwnerService.login(new OwnerVO(email, password));
			model.addAttribute("user", owner);
		} else {
			user = userService.login(userVO); 
			model.addAttribute("user", user);
		}
		if(user == null && owner == null){
			model.addAttribute("msg", "아이디 또는 패스워드가 잘못되었습니다.");
			System.out.println("아이디 또는 패스워드가 잘못되었습니다.");
		} else {
			System.out.println("로그인 성공");
		}
		return "redirect:/";
	}*/
	@RequestMapping("/logout.cr")
	public String logout(HttpSession session, SessionStatus sessionStatus){
		UserVO user = (UserVO) session.getAttribute("user");
		System.out.println("로그아웃 정보" + user);
		sessionStatus.setComplete();
		return "redirect:/";
	}
	@RequestMapping("/info.cr")
	public String userInfo(HttpSession session){
		//세선 받아오기
		UserVO user = (UserVO) session.getAttribute("loginUser");
		System.out.println("로그인 중인 user : " + user);
		user = userService.info(user);
		session.setAttribute("userInfo", user);
		
		return "myPage.jsp";
	}
	@RequestMapping("/bookingList.cr")
	public ModelAndView userBookingList(HttpSession session){
/*		//부킹 서비스로 부르기
		UserVO user = (UserVO) session.getAttribute("loginUser");
		List<BookingVO> bookingList = bookingService.userBookingList(userNo);
		ModelAndView mav = new ModelAndView("/user/bookingList"); //예약 현황 페이
		mav.addObject("bookingList", bookingList);
		return mav;*/
		return null;
	}
	@RequestMapping("/bookingHistory.cr")
	public void userBookingHistory(){
		//세선 받아오기
	}
	@RequestMapping("/review.cr")
	public void userReview(){
		//세선 받아오기
	}
	@RequestMapping("/blind.cr")
	public void userBlind(){
		//세선 받아오기
	}
	  
}
