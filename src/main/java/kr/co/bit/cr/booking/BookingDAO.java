package kr.co.bit.cr.booking;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.bit.cr.search.SearchVO;
import kr.co.bit.cr.user.UserVO;

@Repository
public class BookingDAO {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	// 예약
	public int book(BookingVO booking) {
		// DB에 추가
		return sqlSessionTemplate.insert("booking.BookingDAO.insertBook", booking);
	}

	// 예약 수정
	public int updateBook(BookingVO booking) {
		return sqlSessionTemplate.update("booking.BookingDAO.updateBook", booking);
	}

	// 예약 취소
	public int cancleBook(int bookingNo) {
		
		//sqlSessionTemplate.insert("booking.BookingDAO.insertBookHistory", bookingNo);
		return sqlSessionTemplate.delete("booking.BookingDAO.deleteBook", bookingNo);
	}
	
	// 지난 예약 내역에 추가
	public int insertBookHistory(BookingVO booking) {
		return sqlSessionTemplate.insert("booking.BookingDAO.insertBookHistory", booking);
	}
	
	// 유저 예약 조회
	public List<BookingVO> selectByUserNo(int userNo){
		System.out.println(userNo);
		return sqlSessionTemplate.selectList("booking.BookingDAO.selectByUserNo",userNo);
	}

	// 사업자 예약 조회
	public List<BookingVO> selectByOwner(int ownerNo) {
		return sqlSessionTemplate.selectList("booking.BookingDAO.selectByOwnerNo", ownerNo);
	}

	// 유저 지난 예약 내역 조회
	public List<BookingVO> selectHistoryByUser(int userNo) {
		return sqlSessionTemplate.selectList("booking.BookingDAO.selectHistoryByUserNo", userNo);
	}
	
	// 사업자 지난 예약 내역 조회
	public List<BookingVO> selectHistoryByOwner(int ownerNo) {
		return sqlSessionTemplate.selectList("booking.BookingDAO.selectHistoryByOwnerNo", ownerNo);
	}

	// 예약번호로 예약 정보 조회
	public BookingVO selectByNo(int bookingNo) {
		return sqlSessionTemplate.selectOne("booking.BookingDAO.selectByNo", bookingNo);
	}

	// 예약번호로 지난 예약 정보 조회
	public BookingVO selectHistoryByNo(int bookingNo) {
		return sqlSessionTemplate.selectOne("booking.BookingDAO.selectHistoryByNo", bookingNo);
	}

	public List<BookingVO> selectHistoryByOwner(Map<String, Integer> map) {
		return sqlSessionTemplate.selectList("booking.BookingDAO.selectHistoryLastMonthByOwnerNo", map);
	}

	// 전체 예약 조회
	public List<BookingVO> selectAll() {
		return sqlSessionTemplate.selectList("booking.BookingDAO.selectAll");
	}

	// n월 전체 예약 조회
	public List<BookingVO> selectHistoryAll(int month) {
		return sqlSessionTemplate.selectList("booking.BookingDAO.selectHistoryAll", month);
	}

	public List<Integer> selectHotelNobyDate(SearchVO search) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("booking.BookingDAO.selectHotelNobyDate", search);
	}
	
	
	
}