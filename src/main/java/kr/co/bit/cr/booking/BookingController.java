package kr.co.bit.cr.booking;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/booking")
public class BookingController {
	@Autowired
	BookingService service;
	
	//예약
	@RequestMapping("/book.cr")
	public void book(BookingVO booking){
		
	}
	//예약 수정
	@RequestMapping("/update.cr")
	public void updateBook(BookingVO booking){
		
	}
	//예약 취소
	@RequestMapping("/cancle.cr")
	public void cancleBook(){
		
	}
}
