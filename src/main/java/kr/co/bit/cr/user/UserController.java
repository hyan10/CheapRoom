package kr.co.bit.cr.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;
	
	
	@RequestMapping("/join.cr")
	public void join(UserVO user){
		
	}
	@RequestMapping("/login.cr")
	public void login(UserVO user){
		
	}
	@RequestMapping("/logout.cr")
	public void logout(){
		
	}
	@RequestMapping("/info.cr")
	public void userInfo(){
		//세선 받아오기
	}
	@RequestMapping("/bookingList.cr")
	public void userBookingList(){
		//세선 받아오기		
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
