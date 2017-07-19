package kr.co.bit.cr.owner;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;

import kr.co.bit.cr.user.UserService;
import kr.co.bit.cr.user.UserVO;

@Controller
@RequestMapping("/owner")
public class OwnerController {
	@Autowired
	private OwnerService ownerService;
	
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
			model.addAttribute("msg", "아이디 또는 패스워드가 잘못되었습니다.");
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
}
