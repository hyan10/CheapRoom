package kr.co.bit.cr.booking;

import java.util.List;

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
		
		// 유저 예약 조회
		public List<BookingVO> userBookingList(int userNo) {
			return dao.selectByUser(userNo);
		}
		
		// 사업자 예약 조회
		public List<BookingVO> ownerBookingList(int ownerNo){
			return dao.selectByOwner(ownerNo);
		}
		
		// 유저 이전 예약 내역 조회
		public List<BookingVO> userBookingHistoryList(int userNo){
			return dao.selectHistoryByUser(userNo);
		}
		
		// 사업자 이전 예약 내역 조회
		public List<BookingVO> ownerBookingHistoryList(int ownerNo){
			return dao.selectHistoryByOwner(ownerNo);
		}
}