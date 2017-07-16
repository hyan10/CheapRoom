package kr.co.bit.cr.owner;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/owner")
public class OwnerController {
	@Autowired
	private OwnerService service;
	
	
	@RequestMapping("/join.cr")
	public void join(OwnerVO owner){
		
	}
	@RequestMapping("/login.cr")
	public void login(OwnerVO owner){
		
	}
	@RequestMapping("/logout.cr")
	public void logout(){
		
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
