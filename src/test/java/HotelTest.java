import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

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
public class HotelTest {
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

	//@Transactional
	//@Test
	public void 호텔등록테스트() throws Exception{
		System.out.println("호텔등록테스트");
		ImageVO image = new ImageVO(1,15,"urltest");
		List<ImageVO> images = new ArrayList<ImageVO>();
		List<RoomVO> rooms = new ArrayList<RoomVO>();
		images.add(image);
		RoomVO room = new RoomVO(15,"룸이름", 100000, 2, 4,
				10000, 'Y', 'Y', 'Y', images);
		rooms.add(room);
		
		HotelVO hotel = new HotelVO(1, 1, "호텔1", 'N', 010000000, 'N',
				'N', 'N', 'N', 'N', "블라블라", "15:00", "10:00",
				"부평구", "이미지",rooms);
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
		
		hotel.setNo(15);
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
	//@Transactional
	//@Test
	public void 호텔삭제테스트() throws Exception{
		System.out.println("호텔삭제테스트");
		HotelVO hotel = new HotelVO();
		hotel.setNo(41);
		hotel = hDao.selectHotelByNo(hotel);
		int cnt=0;
		cnt = hDao.deleteHotelByNo(hotel);
		System.out.println(cnt);
	}
//	@Transactional
	@Test
	public void 호텔조인테스트() throws Exception{
		System.out.println("호텔 조인 테스트");
		Map<Integer,Integer> map; 
		map = hDao.joinHotelAndBooking();
		Iterator<Integer> iterator = map.keySet().iterator();
	    while (iterator.hasNext()) {
	    	int hotelNo = (Integer) iterator.next();
	        System.out.print("hotelNo="+hotelNo);
	        System.out.println(" value="+map.get(hotelNo));
	    }
	    
	    System.out.println("호텔 방개수");
	    List<HotelVO> list = hDao.selectHotelByCno(1);
		Map<Integer, Integer> roomCount = new HashMap<>();
		for(HotelVO hotel : list){
			int hotelNo = hotel.getNo();
			List<RoomVO> rooms = rDao.selectRoomByHno(hotelNo);
			hotel.setRooms(rooms);
			roomCount.put(hotelNo, rooms.size());
			System.out.println(hotel);
		}
		
		//map=조인해서 가져온 맵, roomCount=도시번호로 조회한 호텔 룸카운트
		//하나의 키셋을 가져와
		//그거에 밸류와 다른 맵의 밸류를 비교
		Iterator<Integer> iterator2 = map.keySet().iterator();
	    while (iterator2.hasNext()) {
	    	int hotelNo = (Integer) iterator2.next();
	    	if(roomCount.get(hotelNo)!=null && map.get(hotelNo)!=null){
	    		System.out.println(roomCount.get(hotelNo));
	    		System.out.println(map.get(hotelNo));
	    		if(roomCount.get(hotelNo)>map.get(hotelNo)){
	    			System.out.println("보여줘");
	    			System.out.println(hotelNo);
	    		}
	    	}
	    }
	    System.out.println("테스트끝");
	}
}
