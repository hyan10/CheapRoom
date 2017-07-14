package kr.co.bit.cr.booking;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BookingService {
	
	@Autowired
	private BookingDAO dao;
	
		//예약
		public int book(BookingVO booking){
			return dao.book(booking);
		}
		//예약 수정
		public int updateBook(BookingVO booking){
			return dao.updateBook(booking);
		}
		//예약 취소
		public int cancleBook(BookingVO booking){
			return dao.cancleBook(booking);
		}
}
