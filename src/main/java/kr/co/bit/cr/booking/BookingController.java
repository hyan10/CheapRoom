package kr.co.bit.cr.booking;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/booking")
public class BookingController {
	@Autowired
	BookingService service;
	
	//예약
	@RequestMapping("/book.cr")
	public ModelAndView book(BookingVO booking){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("booking/booking");
		//	int result = service.book(booking);
		return mav;
	}
	//예약 수정
	@RequestMapping("/update.cr")
	public void updateBook(BookingVO booking){
		int result = service.updateBook(booking);
	}
	//예약 취소
	@RequestMapping("/cancle.cr")
	public void cancleBook(BookingVO booking){
		int result = service.cancleBook(booking);
	}
	
	// 유저 예약 조회
	@RequestMapping("/bookingList.cr")
	public ModelAndView userBookingList(){
		List<BookingVO> list = service.userBookingList(1);
		System.out.println(list);
		ModelAndView mav = new ModelAndView();
		mav.addObject("bookingList",list);
		mav.setViewName("booking/bookingList");
		return mav;
	}

}
