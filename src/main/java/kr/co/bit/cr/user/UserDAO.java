package kr.co.bit.cr.user;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.bit.cr.booking.BookingVO;

@Repository
public class UserDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public UserVO login(UserVO userVO){
		return sqlSessionTemplate.selectOne("user.dao.UserDAO.userLogin", userVO);
	}
	public void join(UserVO userVO){
		sqlSessionTemplate.insert("user.dao.UserDAO.userInsert", userVO);
	}
	public UserVO info(UserVO userVO){
		return sqlSessionTemplate.selectOne("user.dao.UserDAO.userInfo", userVO);
	}
	public List<BookingVO> bookingList(UserVO userVO){
		return sqlSessionTemplate.selectList("user.dao.UserDAO.userBookingList", userVO);
	}
}
