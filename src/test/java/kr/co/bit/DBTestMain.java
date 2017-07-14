package kr.co.bit;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import kr.co.bit.cr.hotel.HotelDAO;
import kr.co.bit.cr.hotel.HotelVO;
import kr.co.bit.cr.image.ImageDAO;
import kr.co.bit.cr.image.ImageVO;
import kr.co.bit.cr.room.RoomDAO;
import kr.co.bit.cr.room.RoomVO;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:config/**/*.xml"})
public class DBTestMain {
	/*@Autowired
	private DataSource ds;*/
	@Autowired
	private HotelDAO hDao;
	@Autowired
	private RoomDAO rDao;
	@Autowired
	private ImageDAO iDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Transactional
	@Test
	public void 호텔등록테스트() throws Exception{
		
		ImageVO image = new ImageVO(1,1,"urltest");
		List<ImageVO> images = new ArrayList<ImageVO>();
		List<RoomVO> rooms = new ArrayList<RoomVO>();
		images.add(image);
		RoomVO room = new RoomVO(21, 21, "룸이름", 100000, 2, 4,
				10000, "Y", "Y", "Y", images);
		rooms.add(room);
		
		HotelVO hotel = new HotelVO(21, 1, 1, "호텔1", "N", 010000000, "N",
				"N", "N", "N", "N", "블라블라", "15:00", "10:00",
				"부평구", rooms);
		
		
		int cnt = hDao.registerHotel(hotel);
		if(cnt==1){
			List<RoomVO> rooms2 = hotel.getRooms();
			for(RoomVO room2 : rooms){
				cnt = rDao.registerRoom(room2);
				if(cnt==1){
					cnt = iDao.registerImage(room2.getImages());
				}
			}
		}
		
		System.out.println(cnt);
		System.out.println(hotel);
	}
}
