package kr.co.bit.cr.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bit.cr.booking.BookingVO;

@Controller
@RequestMapping("/user")
@SessionAttributes("user")
public class UserController {
	@Autowired
	private UserService userService;
	
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
		//userService.join(user);
		return "redirect:/";
	}
	
//	@RequestMapping(value="/login.cr", method=RequestMethod.GET)
//	public String loginForm(){
//		return "/user/login.cr";
//	}
	
	@RequestMapping(value="/login.cr", method=RequestMethod.POST)
	public String login(HttpServletRequest request, Model model, HttpSession session){
		String email = (String)request.getParameter("email");
		String password = (String)request.getParameter("password");
		System.out.println("email : " + email + ", password : " + password);
		UserVO user = userService.login(new UserVO(email, password));
		if(user == null){
			model.addAttribute("msg", "아이디 또는 패스워드가 잘못되었습니다.");
			return "redirect:/";
		} 
		System.out.println(user);
		model.addAttribute("loginUser", user);
		return "redirect:/";
	}
	@RequestMapping("/logout.cr")
	public String logout(SessionStatus sessionStatus){
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
		UserVO user = (UserVO) session.getAttribute("loginUser");
		List<BookingVO> bookingList = userService.bookingList(user);
		ModelAndView mav = new ModelAndView("/user/bookingList");
		mav.addObject("bookingList", bookingList);
		return mav;
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
