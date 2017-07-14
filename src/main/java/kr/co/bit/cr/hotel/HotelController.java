package kr.co.bit.cr.hotel;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/hotel")
public class HotelController {
	@Autowired
	private HotelService service;
	
	//호텔 + 방 같이 등록
	@RequestMapping("/registerHotel.cr")
	public void addHotel(HotelVO hotel){
		
	}
	//검색 : 지역 번호, 체크인, 체크아웃 날짜, 인원수 
	//
	@RequestMapping("/hotelList.cr")
	public void hotelList(@RequestParam("city_no") int cityNo, 
						  @RequestParam("start_date") String startDate,
						  @RequestParam("end_date") String endDate,
						  @RequestParam("person_no") int personNo){
		//1. 쿠키에 input form 날라온 데이터 저장해주기
		//2. 지역 번호로 호텔 검색하는데, 사람 인원수를 보여줘야하니까-> 호텔 방 조인해서 가능한 방이 한개 이상있으면 호텔 보여줘
		
		
	}
		
	@RequestMapping("/roomList.cr")
	public void roomList(@RequestParam("hotel_no") int no){
		//1. 쿠키 가져와서 시작날짜 - 끝나는날짜 검색
		//Booking Table 예약기간이랑 겹치지 않는 거 가져오기 
	}
	//호텔 + 방 같이 수정
	@RequestMapping("/updateHotel.cr")
	public void updateHotel(){
		
	}
	
}
