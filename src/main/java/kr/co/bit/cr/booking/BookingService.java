package kr.co.bit.cr.booking;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bit.cr.review.ReviewDAO;
import kr.co.bit.cr.review.ReviewVO;

@Service
public class BookingService {
	
	@Autowired
	private BookingDAO dao;
	
	@Autowired
	private ReviewDAO rDao;
	
		//예약
		public int book(BookingVO booking){
			return dao.book(booking);
		}
		//예약 수정
		public int updateBook(BookingVO booking){
			return dao.updateBook(booking);
		}
		
		//예약 취소
		public int cancleBook(int bookingNo){
			
			int result = 0;
			
			// 조회
			BookingVO booking = dao.selectByNo(bookingNo);
			
			// 취소일 경우 type="N" 추가해서 history table에 추가
			if(booking!=null) {
				booking.setType("N");
				result = dao.insertBookHistory(booking);
				
				// 추가 후 booking table에서 제거
				if(result==1) {
					result = dao.cancleBook(bookingNo);
				}else {
					result = -2;
				}
			}else {
				result = -1;
			}
			
			return result;  // 0: cancle 실패, -1: select 실패, -2: insert 실패
		}
		
		// 유저 예약 조회
		public List<BookingVO> userBookingList(int userNo) {
			return dao.selectByUserNo(userNo);
		}
		
		// 사업자 예약 조회
		public List<BookingVO> ownerBookingList(int ownerNo){
			return dao.selectByOwner(ownerNo);
		}
		
		// 전체 예약 조회
		public List<BookingVO> bookingList(){
			return dao.selectAll();
		}
		
		// 유저 이전 예약 내역 조회
		public List<BookingVO> userBookingHistoryList(int userNo){
			List<BookingVO> list = dao.selectHistoryByUser(userNo);
			List<ReviewVO> reviews = rDao.selectReviewByUno(userNo);
			
			System.out.println(reviews);
			List<Integer> rList = new ArrayList<>();
			for(ReviewVO r : reviews) {
				rList.add(r.getHotelNo());
			}
			
			System.out.println(rList);
			
			for(BookingVO booking : list) {
				if(rList.contains(booking.getHotelNo())) {
					booking.setType("R");
					System.out.println(booking);
				}
			}
			
			//return dao.selectHistoryByUser(userNo);
			return list;
		}
		
		// 사업자 이전 예약 내역 전체 조회
		public List<BookingVO> ownerBookingHistoryList(int ownerNo){
			return dao.selectHistoryByOwner(ownerNo);
		}
		
		// n월 지난 예약 조회
		public List<BookingVO> bookingHistoryList(int month){
			return dao.selectHistoryAll(month);
		}
		

		// 예약 정보 조회
		public BookingVO detailBooking(int bookingNo) {
			return dao.selectByNo(bookingNo);
		}
		
		// 이전 예약 정보 조회
		public BookingVO detailBookingHistory(int bookingNo) {
			return dao.selectHistoryByNo(bookingNo);
		}
		
		// 사업자 n월 예약 내역 조회
		public List<BookingVO> ownerBookingHistoryList(Map<String, Integer> map) {
			return dao.selectHistoryByOwner(map);
		}
}