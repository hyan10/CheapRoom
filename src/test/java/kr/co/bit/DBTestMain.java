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
@Autowired
	private DataSource ds;
	@Autowired
	private HotelDAO hDao;
	@Autowired
	private RoomDAO rDao;
	@Autowired
	private ImageDAO iDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Transactional
	//@Test
	public void 호텔등록테스트() throws Exception{
		System.out.println("호텔등록테스트");
		ImageVO image = new ImageVO(1,1,"urltest");
		List<ImageVO> images = new ArrayList<ImageVO>();
		List<RoomVO> rooms = new ArrayList<RoomVO>();
		images.add(image);
		RoomVO room = new RoomVO(41,"룸이름", 100000, 2, 4,
				10000, 'Y', 'Y', 'Y', images);
		rooms.add(room);
		
		HotelVO hotel = new HotelVO(1, 1, "호텔1", 'N', 010000000, 'N',
				'N', 'N', 'N', 'N', "블라블라", "15:00", "10:00",
				"부평구", rooms);
		System.out.println(hotel);
		System.out.println(room);
		System.out.println(image);;
		int cnt = 0;
		cnt = hDao.registerHotel(hotel);
		System.out.println(cnt);

		if(cnt==1){
			List<RoomVO> rooms2 = hotel.getRooms();
			for(RoomVO room2 : rooms2){
				System.out.println("rooms2");
				cnt = rDao.registerRoom(room2);
				System.out.println("방등록");
				System.out.println(cnt);
				if(cnt==1){
					cnt = iDao.registerImage(room2.getImages());
					System.out.println("사진등");
					System.out.println(cnt);
				}
			}
		}
		
		System.out.println(cnt);
		System.out.println(hotel);
	}
	//@Test
	public void 호텔조회테스트() throws Exception{
		System.out.println("호텔조회테스트");
		HotelVO hotel = new HotelVO();
		List<RoomVO> rooms = new ArrayList<RoomVO>();
		
		hotel.setNo(41);
		hotel = hDao.selectHotelByNo(hotel);		//41 47,44
		rooms = rDao.selectRoomByHno(hotel.getNo());
		List<ImageVO> images = new ArrayList<ImageVO>();
		for(RoomVO room: rooms){
			images=iDao.selectImageByRno(room.getNo());
			room.setImages(images);
		}
		hotel.setRooms(rooms);
		System.out.println(hotel);
	}
	
	//@Transactional
	//@Test
	public void 호텔수정테스트() throws Exception{
		System.out.println("호텔수정테스트");
		
		//호텔셋팅
		HotelVO hotel = new HotelVO();
		List<RoomVO> rooms = new ArrayList<RoomVO>();
		hotel.setNo(41);
		hotel = hDao.selectHotelByNo(hotel);		//41 47,44
		rooms = rDao.selectRoomByHno(hotel.getNo());
		List<ImageVO> images = new ArrayList<ImageVO>();
		for(RoomVO room: rooms){
			images=iDao.selectImageByRno(room.getNo());
			room.setImages(images);
		}
		hotel.setRooms(rooms);
		System.out.println(hotel);
		
		//수정
		hotel.setName("이름바꿈");
		hotel.getRooms().get(0).setName("이름바꾼룸");
			
		//db
		int cnt = 0;
		cnt = hDao.updateHotel(hotel);
		if(cnt==1){
			List<RoomVO> rooms2 = hotel.getRooms();
			for(RoomVO room2 : rooms2){
				cnt = rDao.updateRoom(room2);
				System.out.println("방등록");
				if(cnt==1){
					cnt = iDao.updateImage(room2.getImages());
					System.out.println("사진등록");
				}
			}
		}
		System.out.println("수정완료");
		rooms = new ArrayList<RoomVO>();
		hotel = hDao.selectHotelByNo(hotel);		//41 47,44
		rooms = rDao.selectRoomByHno(hotel.getNo());
		images = new ArrayList<ImageVO>();
		for(RoomVO room: rooms){
			images=iDao.selectImageByRno(room.getNo());
			room.setImages(images);
		}
		hotel.setRooms(rooms);
		System.out.println(hotel);
		System.out.println(hotel.getRooms().get(0).getImages());
		System.out.println(hotel.getRooms().get(1).getImages());
	}
	@Transactional
	@Test
	public void 호텔삭제테스트() throws Exception{
		System.out.println("호텔삭제테스트");
		HotelVO hotel = new HotelVO();
		hotel.setNo(41);
		hotel = hDao.selectHotelByNo(hotel);
		int cnt=0;
		cnt = hDao.deleteHotelByNo(hotel);
		System.out.println(cnt);
	}
}
