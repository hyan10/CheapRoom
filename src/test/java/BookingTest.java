import java.util.List;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.bit.cr.booking.BookingVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/**/*.xml" }) // ** 하위폴더 모두
public class BookingTest {

	@Autowired
	private DataSource ds;

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	BookingVO booking;

	
	public void 유저예약조회() throws Exception{
		List<BookingVO> list = sqlSessionTemplate.selectList("booking.BookingDAO.selectByUser", 1);
		for(BookingVO vo : list){
			System.out.println(vo);
		}
	}

	
	public void 오너예약현황() throws Exception {
		List<BookingVO> list = sqlSessionTemplate.selectList("booking.BookingDAO.selectByOwner", 1);
		for(BookingVO vo : list){
			System.out.println(vo);
		}
	}

	
	public void 예약추가() throws Exception {
		/*
		 * 	BookingVO(Integer userNo, Integer hotelNo, Integer roomNo, String startDate, String endDate,
		 *	Integer totalPerson, Integer totalPrice, String cardType, Integer cardNo, String cardDate, String userName,
		 *	String userEmail, String userPhone)
		 * 
		 */
		booking = new BookingVO(1, 1, 1, "2017-07-20", "2017-07-22", 3, 100000,
								"BC", 12345678, "10/20", "첫테스트", "abc@abc.com", "010-1234-5678");
		sqlSessionTemplate.insert("booking.BookingDAO.insertBook", booking);
	}

	// 예약 수정
	public void 예약수정() throws Exception {
		booking = new BookingVO();
		booking.setNo(8);
//		booking.setUserName("바꾼이름");
		booking.setUserEmail("test@gamil.com");
		booking.setUserPhone("010-2222-1123");
		System.out.println(booking.getUserEmail());
		System.out.println(sqlSessionTemplate.update("booking.BookingDAO.updateBook", booking));
	}

	// 예약 취소
	public void 예약취소() throws Exception{
		booking = new BookingVO(1, 1, 1, "2017-07-20", "2017-07-22", 3, 100000,
				"BC", 12345678, "10/20", "바꾼이름", "test@gamil.com", "010-2222-1123");
		booking.setNo(8);
		booking.setType('N');
		sqlSessionTemplate.insert("booking.BookingDAO.insertBookHistory", booking);
		System.out.println(sqlSessionTemplate.delete("booking.BookingDAO.deleteBook", booking.getNo()));
	}
}
