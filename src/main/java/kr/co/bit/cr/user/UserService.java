package kr.co.bit.cr.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bit.cr.booking.BookingVO;

@Service
public class UserService {
	@Autowired
	private UserDAO dao;
	
	public UserVO login(UserVO userVO){
		return dao.login(userVO);
	}
	
	public void join(UserVO userVO){
		dao.join(userVO);
	}
	public UserVO info(UserVO userVO){
		return dao.info(userVO);
	}
	public List<BookingVO> bookingList(UserVO userVO){
		return dao.bookingList(userVO);
	}
}
