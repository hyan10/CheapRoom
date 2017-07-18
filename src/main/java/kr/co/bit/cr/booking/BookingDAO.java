package kr.co.bit.cr.booking;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public int cancleBook(BookingVO booking) {
		
		sqlSessionTemplate.insert("booking.BookingDAO.insertBookHistory", booking);
		return sqlSessionTemplate.delete("booking.BookingDAO.deleteBook", booking.getNo());
	}
	
	// 유저 예약 조회
	public List<BookingVO> selectByUser(int userNo){
		System.out.println(userNo);
		System.out.println(sqlSessionTemplate);
		return sqlSessionTemplate.selectList("booking.BookingDAO.selectByUser",userNo);
	}
}