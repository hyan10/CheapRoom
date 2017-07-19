package kr.co.bit.cr.hotel;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bit.cr.image.ImageDAO;
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
	public int registerHotel(HotelVO hotel){
		
		int cnt = hDao.registerHotel(hotel);
		if(cnt==1){
			List<RoomVO> rooms = hotel.getRooms();
			for(RoomVO room : rooms){
				cnt = rDao.registerRoom(room);
				if(cnt==1){
					cnt = iDao.registerImage(room.getImages());
				}
			}
		}
		
		return cnt;
	}
	
	/**
	 * 호텔,방,사진 같이 수정
	 * @param hotel
	 * @return
	 */
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
		
		return null;
	}
}