package kr.co.bit.cr.hotel;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.bit.cr.booking.BookingDAO;
import kr.co.bit.cr.favorite.FavoriteDAO;
import kr.co.bit.cr.favorite.FavoriteVO;
import kr.co.bit.cr.image.ImageDAO;
import kr.co.bit.cr.image.ImageVO;
import kr.co.bit.cr.review.ReviewDAO;
import kr.co.bit.cr.review.ReviewVO;
import kr.co.bit.cr.room.RoomDAO;
import kr.co.bit.cr.room.RoomVO;
import kr.co.bit.cr.search.SearchVO;
import kr.co.bit.cr.user.UserVO;

@Service
public class HotelService {
	@Autowired
	private HotelDAO hDao;
	@Autowired
	private RoomDAO rDao;
	@Autowired
	private ImageDAO iDao;
	@Autowired
	private FavoriteDAO fDao;
	@Autowired
	private BookingDAO bDao;
	@Autowired
	private ReviewDAO reviewDAO;
	
	/**
	 * 사업자가 호텔+방+사진 등록
	 * @param hotel
	 * @return
	 */
	@Transactional
	public int registerHotel(HotelVO hotel){
		hotel.setBlind("N");
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
		System.out.println(search);
		List<HotelVO> list = hDao.selectHotelByCno(search.getCityNo());
		List<Integer> numList = bDao.selectHotelNobyDate(search);
		
		System.out.println("비교하기전 사이즈 : "+list.size());

		Map<Integer, HotelVO> fList = new HashMap<>();
		Map<Integer, Integer> roomCount = new HashMap<>();
		List<HotelVO> copyList = new ArrayList<>();
		copyList.addAll(list);
		for(HotelVO hotel : list){
			//Map<String, Object> paramMap = new HashMap<>(); 
			int hotelNo = hotel.getNo();
			//paramMap.put("no", hotelNo);
			//paramMap.put("personNo", search.getPersonNo());
			//사람수체크해서 맞는 경우만 가져옴 
			List<RoomVO> rooms = rDao.selectRoomByHno(hotelNo);
			hotel.setRooms(rooms);
			roomCount.put(hotelNo, rooms.size());
			System.out.println("룸사이즈"+rooms.size());
			fList.put(hotelNo, hotel);
			//부킹을날짜로 조회해서 호텔번호를 뽑아옴
			//호텔리스트에서 해당번호 객체 삭제
			if(numList.contains(hotel.getNo())){
				System.out.println("booking목록에 있는 호텔 삭제");
				copyList.remove(hotel);
			}
		}
		list.clear();
		list.addAll(copyList);
		System.out.println("list size:"+list.size());
		
		//2.호텔의 룸 카운트를세서 예약+룸 카운트가 그것보다 작으면 남는방이 있는거니까 보여준다.
		//호텔 부킹 조인할 때 where절에 호텔리스트 번호추가
		Map<Integer, Integer> joinMap = new HashMap<>();
		joinMap = hDao.joinHotelAndBooking(search);
		System.out.println("joinMap");
		System.out.println(joinMap);
		
		//검색목록이 없는것과 인원수에 따라 없는거 구분 
//		if(joinMap.isEmpty()){
//			for(list)
//			return list;
//		}
		
		//조인비교시 해당하면 기존호텔리스트에 추가
		if(!joinMap.isEmpty()){
			List<HotelVO> resultList = new ArrayList<>();
			Iterator<Integer> iterator = joinMap.keySet().iterator();
			while (iterator.hasNext()) {
				int hotelNo = (Integer) iterator.next();
				if(roomCount.get(hotelNo)!=null && joinMap.get(hotelNo)!=null){
					System.out.println(roomCount.get(hotelNo));
					System.out.println(joinMap.get(hotelNo));
					if(roomCount.get(hotelNo)>joinMap.get(hotelNo)){
						System.out.println("조인비교");
						HotelVO h = fList.get(hotelNo);
						System.out.println("hotel : "+h.getNo());
						//resultList.add(h);
						list.add(h);
					}
				}
			}
			System.out.println("join not empty");
			//return list;
		}
//		else{
//			for(Iterator<HotelVO> iterator = list.iterator();iterator.hasNext();){
//				HotelVO hotel = iterator.next();
//				System.out.println(hotel.getRooms());
//				if(hotel.getRooms().isEmpty()){
//					iterator.remove();
//				}
//			}
//			for(HotelVO hh : list){
//			List<Integer> tmp = new ArrayList<>();
//				if(hh.getRooms().isEmpty()){
//					System.out.println("isemtpy");
//				}
//				if(hh.getRooms()==null){
//					System.out.println("is null");
//					list.remove(hh);
//				}
//			int size = list.size();
//			for(int i=0;i<size-1;i++){
//				System.out.println(list.get(i).getRooms());
//				List<RoomVO> rr = new ArrayList<>();
//				rr = list.get(i).getRooms();
//				System.out.println(rr==null);
//				System.out.println(rr.equals(null));
//				System.out.println(rr.isEmpty());
//				System.out.println(rr.size()==0);
//				System.out.println("=======");
//				if(rr.isEmpty()){
//					list.remove();
//					tmp.add(i);
//				}else{
//					System.out.println("null아님");
//				}
//			}
//			System.out.println("tmp size : "+tmp.size());
//			for(int i=0;i<tmp.size();i++){
//				System.out.println(i);
//				list.remove(i);
//				//객체로 지워야하는듯;;
//			}
			//return list;
//			}
		

	    //인원수 체크

		//남은 결과 조회해서 리턴
	    //System.out.println(resultList);
//	    for(HotelVO h1 : list){
//	    	System.out.println("hotel no : "+h1.getNo());
//	    	System.out.println("room  : "+h1.getRooms());
//	    	System.out.println(h1.getRooms()==null);
//	    	System.out.println("======");
//	    	System.out.println(h1.getRooms().size()==0);
//	    	System.out.println(h1.getRooms().isEmpty());
//	    }
//	    if(resultList.isEmpty()){
//	    	return list;
//	    }
//		정렬 
		Collections.sort(list, new Compare());
		System.out.println(list.size());
		return list;
	}

	class Compare implements Comparator<HotelVO> {
		@Override
		public int compare(HotelVO o1, HotelVO o2) {
			return o1.getRooms().get(0).getPrice().compareTo(o2.getRooms().get(0).getPrice());
		}
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
		hotel = hDao.selectHotelByNo(no);
		//호텔에 룸+이미지 세팅하고 roomNo있는건 예약불가 나머지는 예약가능
		//룸이랑부킹이랑 조인해서 예약가능한방 리스트가져와서 타입 세팅하고 호텔에다가 넣기
		List<RoomVO> totalRooms = rDao.selectRoomByHno(no);
		for(RoomVO room : totalRooms){
			List<ImageVO> images = iDao.selectImageByRno(room.getNo());
			room.setImages(images);
		}		
		
		//조인   return 예약된 방리스트
		List<RoomVO> bookingRooms = new ArrayList<>();
		System.out.println("===========");
		System.out.println(search);
		//bookingRooms = rDao.selectRoomByHno(no);
		Map<String, Object> bMap = new HashMap<>();
		bMap.put("no", no);
		bMap.put("search", search);
		
		
		bookingRooms = rDao.joinRoomAndBooking(bMap);
	
		System.out.println(bookingRooms);
		if(!bookingRooms.isEmpty()){
			System.out.println("not empty");
			for(RoomVO room1 : totalRooms){
				for(RoomVO room2 : bookingRooms){
					if(room2.getNo()==room1.getNo()){
						room1.setBooking("N");
						break;
					}else{
					room1.setBooking("Y");
					}

				}
			}	
		}else{
			System.out.println("empty");
			for(RoomVO room1 : totalRooms){
				room1.setBooking("Y");
			}
		}
	
		
		hotel.setRooms(totalRooms);
		for(RoomVO r : hotel.getRooms()){
			System.out.println(r.getBooking());
		}
		return hotel;
	}
	
	public int selectHotelSeq(){
		return hDao.selectHotelSeq();
	}
	
	public int selectRoomSeq(){
		return rDao.selectRoomSeq();
	}
	
	public HotelVO selectHotelByRno(int rNo){
		List<RoomVO> rooms = new ArrayList<>();
		RoomVO room = rDao.selectRoomByNo(rNo);
		rooms.add(room);
		System.out.println("room : "+room);
		HotelVO hotel = hDao.selectHotelByNo(room.getHotelNo());
		hotel.setRooms(rooms);
		return hotel;
	}
	
	public List<HotelVO> favoriteList(List<HotelVO> list, UserVO user) {
		//호텔리스트의 번호들을 리스트로 가져옴
		// 유저넘버 in 호텔번호 from favorite해서 favorite List를 가져옴
		// favorite리스트의 번호가 호텔리스트에포함되어잇으면 y 아니면 n
		List<Integer> noList = new ArrayList<>();
		Map<String, Object> map = new HashMap<>();
		map.put("no", user.getNo());
		for(HotelVO hotel : list){
			System.out.println("=====");
			System.out.println(hotel.getNo());
			noList.add(hotel.getNo());
		}
		
		map.put("list", noList);
		
		List<FavoriteVO> favorite = new ArrayList<>();
		System.out.println(favorite);
		favorite = fDao.favoriteList(map);
		System.out.println(favorite);
		//비교해서 셋 호텔넘버만 리스트로 받자
		for(HotelVO hotel : list){
			hotel.setFavorite("N");
			System.out.println("=======");
			for(FavoriteVO f: favorite){
				if((f!=null) && (hotel.getNo()==f.getHotelNo())){
					System.out.println(f.getHotelNo());
					hotel.setFavorite("Y");
					break;
				}
				
			}
		}
		
		return list;
	}
	
	public List<String> selectHotelNameByOno(int ownerNo){
		return hDao.selectHotelNameByOno(ownerNo);
	}
	
	public List<HotelVO> selectHotelListByOno(int ownerNo){
		List<HotelVO> list = hDao.selectHotelListByOno(ownerNo);
		Map<Integer, HotelVO> fList = new HashMap<>();
		Map<Integer, Integer> roomCount = new HashMap<>();
		for(HotelVO hotel : list){
			int hotelNo = hotel.getNo();
			List<RoomVO> rooms = rDao.selectRoomByHno(hotelNo);
			hotel.setRooms(rooms);
			roomCount.put(hotelNo, rooms.size());
			fList.put(hotelNo, hotel);
		}
		
		return list;
	}

	public List<HotelVO> reviewList(List<HotelVO> list) {
		for(HotelVO hotel : list){
			ReviewVO review = new ReviewVO();
			review = reviewDAO.selectReviewAVGByHno(hotel.getNo());
			if(review==null){
				ReviewVO review0 = new ReviewVO();
				review0.setHotelNo(hotel.getNo());
				review0.setCleanliness(0);
				review0.setComfort(0);
				review0.setFacilities(0);
				review0.setLocation(0);
				review0.setStaff(0);
				hotel.setReview(review0);
			}else{
				hotel.setReview(review);
			}
		}
		return list;
	}

}
