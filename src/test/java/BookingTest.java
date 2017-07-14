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

	@Test
	public void 유저예약조회() throws Exception{
		List<BookingVO> list = sqlSessionTemplate.selectList("booking.BookingDAO.selectByUser", 3);
		for(BookingVO vo : list){
			System.out.println(vo);
		}
	}

	public void 오너예약현황() throws Exception {
		List<BookingVO> list = sqlSessionTemplate.selectList("booking.BookingDAO.selectByOwner", 3);
		for(BookingVO vo : list){
			System.out.println(vo);
		}
	}

	public void 예약추가() throws Exception {
		sqlSessionTemplate.insert("booking.BookingDAO.insertBook", booking);
	}

	// 예약 수정
	public int 예약수정() {
		return sqlSessionTemplate.update("booking.BookingDAO.updateBook", booking);
	}

	// 예약 취소
	public int 예약취소() {

		sqlSessionTemplate.insert("booking.BookingDAO.insertBookHistory", booking);
		return sqlSessionTemplate.delete("booking.BookingDAO.deleteBook", booking.getNo());
	}
}
