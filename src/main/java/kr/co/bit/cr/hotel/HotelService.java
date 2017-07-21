package kr.co.bit.cr.hotel;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.bit.cr.image.ImageDAO;
import kr.co.bit.cr.image.ImageVO;
import kr.co.bit.cr.room.RoomDAO;
import kr.co.bit.cr.room.RoomVO;
import kr.co.bit.cr.search.SearchVO;

@Service
public class HotelService {
	@Autowired
	private HotelDAO hDao;
	@Autowired
	private RoomDAO rDao;
	@Autowired
	private ImageDAO iDao;

	
	/**
	 * 사업자가 호텔+방+사진 등록
	 * @param hotel
	 * @return
	 */
	@Transactional
	public int registerHotel(HotelVO hotel){
		
		int cnt = hDao.registerHotel(hotel);
		if(cnt==1){
			List<RoomVO> rooms = hotel.getRooms();
			for(RoomVO room : rooms){
				cnt = rDao.registerRoom(room);
//				if(cnt==1){
//					cnt = iDao.registerImage(room.getImages());
//				}
			}
		}
		
		return cnt;
	}
	
	/**
	 * 호텔,방,사진 같이 수정
	 * @param hotel
	 * @return
	 */
	@Transactional
	public int updateHotel(HotelVO hotel){
		int cnt = hDao.updateHotel(hotel);
		if(cnt==1){
			List<RoomVO> rooms = hotel.getRooms();
			for(RoomVO room : rooms){
				cnt = rDao.updateRoom(room);
				if(cnt==1){
					cnt = iDao.updateImage(room.getImages());
				}
			}
		}
		
		return cnt;
	}
	
	/**
	 * 
	 * 호텔 삭제
	 * @param hotel
	 * @return
	 */
	public int deleteHotel(HotelVO hotel){
		return hDao.deleteHotelByNo(hotel);
	}
	
	/**
	 * 호텔 찾기
	 * @return
	 */
	public List<HotelVO> hotelList(SearchVO search){
		
		//1.지역번호로 호텔이랑 방조회해서 호텔세팅
		//원래 조인으로 해야댐ㅠ
		List<HotelVO> list = hDao.selectHotelByCno(search.getCityNo());
		Map<Integer, HotelVO> fList = new HashMap<>();
		Map<Integer, Integer> roomCount = new HashMap<>();
		for(HotelVO hotel : list){
			int hotelNo = hotel.getNo();
			List<RoomVO> rooms = rDao.selectRoomByHno(hotelNo);
			hotel.setRooms(rooms);
			roomCount.put(hotelNo, rooms.size());
			fList.put(hotelNo, hotel);
		}
		
		//2.호텔의 룸 카운트를세서 예약+룸 카운트가 그것보다 작으면 남는방이 있는거니까 보여준다.
		Map<Integer, Integer> joinMap = hDao.joinHotelAndBooking(search);
		List<HotelVO> resultList = new ArrayList<>();
		Iterator<Integer> iterator = joinMap.keySet().iterator();
	    while (iterator.hasNext()) {
	    	int hotelNo = (Integer) iterator.next();
	    	if(roomCount.get(hotelNo)!=null && joinMap.get(hotelNo)!=null){
	    		if(roomCount.get(hotelNo)>joinMap.get(hotelNo)){
	    			HotelVO h = fList.get(hotelNo);
	    			resultList.add(h);
	    		}
	    	}
	    }
	    
		//남은 결과 조회해서 리턴
		return resultList;
	}
	
	/**
	 * 선택한 호텔+날짜로 호텔+룸 리턴
	 * @param no
	 * @param search
	 * @return
	 */
	public HotelVO roomList(int no, SearchVO search){
		//예약가능한 룸리스트를 가져와서 hotelVo에 set해서 리턴해야댐
		HotelVO hotel = new HotelVO();
		hotel.setNo(no);
		hotel = hDao.selectHotelByNo(hotel);
		//호텔에 룸+이미지 세팅하고 roomNo있는건 예약불가 나머지는 예약가능
		//룸이랑부킹이랑 조인해서 예약가능한방 리스트가져와서 타입 세팅하고 호텔에다가 넣기
		List<RoomVO> totalRooms = rDao.selectRoomByHno(no);
		for(RoomVO room : totalRooms){
			List<ImageVO> images = iDao.selectImageByRno(room.getNo());
			room.setImages(images);
		}		
		
		//조인   return 예약된 방리스트
		List<RoomVO> bookingRooms = rDao.joinRoomAndBooking(search);

		for(RoomVO room1 : totalRooms){
			for(RoomVO room2 : bookingRooms){
				if(room2.getNo()==room1.getNo()){
					room1.setBooking('N');
				}else{
				room1.setBooking('Y');
				}
			}
		}
		
		hotel.setRooms(totalRooms);
		return hotel;
	}
	
	public int selectSeq(){
		return hDao.selectSeq();
	}
}