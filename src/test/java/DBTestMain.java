import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.bit.cr.booking.BookingVO;
import kr.co.bit.cr.user.UserVO;

@RunWith(SpringJUnit4ClassRunner.class)
/*@ContextConfiguration(locations={"classpath:config/spring/spring-mvc.xml", 
		"classpath:config/mybatis/sqlMapConfig.xml", 
		"classpath:config/sqlmap/oracle/sqlmap-board.xml"})*/
@ContextConfiguration(locations={"classpath:config/**/*.xml"})
public class DBTestMain {
		
	@Autowired
	private DataSource ds;
	/*@Autowired
	private SqlSessionFactory factory;*/
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Test
	public void DB연결테스트() throws SQLException{
		System.out.println(ds);
		Connection conn = ds.getConnection();
		System.out.println("conn : " + conn);	
		System.out.println(sqlSessionTemplate);
			
	}
	//@Test
	public void 로그인테스트() throws SQLException{
		UserVO user = sqlSessionTemplate.selectOne("user.dao.UserDAO.userLogin", new UserVO("admin", "admin"));
		System.out.println(user);
	}
	//@Test
	public void 사용자예약리스트() throws SQLException {
		List<BookingVO> list = sqlSessionTemplate.selectList("user.dao.UserDAO.userBookingList", new UserVO("admin", "admin"));
		System.out.println(list);
	}
/*//	@Test
	public void 전체조회테스트() throws Exception{
		List<BoardVO> list = sqlSessionTemplate.selectList("board.dao.BoardDAO.selectAllBoard");
		
		for(BoardVO b : list){
			System.out.println(b);
		}
	}
	
	
//	@Test
	public void 제1차테스트() throws Exception{
		BoardVO b = sqlSessionTemplate.selectOne("board.dao.BoardDAO.selectOneByNo", 5);
		System.out.println(b);
	}
	
	//@Test
	public void 제2차테스트() throws Exception {
		BoardVO board = new BoardVO();
		board.setTitle("aaaa");
		board.setWriter("bbb");
		board.setContent("ddd");
		sqlSessionTemplate.insert("board.dao.BoardDAO.insertBoard", board);
	}*/

}
