package kr.co.bit.cr.hotel;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/hotel")
public class HotelController {
	@Autowired
	private HotelService service;
	
	//호텔 + 방 같이 등록
	@RequestMapping("/register.cr")
	public String registerHotel(HotelVO hotel){
		
		if(service.registerHotel(hotel)==1){
			return "redirect:/owner/info.cr";
		}
		return "hotel/register";	//실패시 메세지띄우고 입력폼유지
	}
	//검색 : 지역 번호, 체크인, 체크아웃 날짜, 인원수 
	//
	@RequestMapping("/hotelList.cr")
	public void hotelList(@CookieValue(value="city_no", required=false)Cookie cityNo, 
						  @CookieValue(value="start_date",required=false)Cookie startDate,
						  @CookieValue(value="end_date",required=false)Cookie endDate,
						  @CookieValue(value="person_no",required=false)Cookie personNo){
		//1. 쿠키에 input form 날라온 데이터 저장해주기
		//2. 지역 번호로 호텔 검색하는데, 사람 인원수를 보여줘야하니까-> 호텔 방 조인해서 가능한 방이 한개 이상있으면 호텔 보여줘
		//지역번호로 호텔조회함/ 호텔리스트에서 상세페이지 들어가면 룸이랑 부킹 확인해서 예약가능한 방 보여줌
		
		//지역 번호로 호텔 검색
		List<HotelVO> list = new ArrayList<>();
		list = service.hotelList(Integer.parseInt(cityNo.getValue()), startDate.getValue(), endDate.getValue(), Integer.parseInt(personNo.getValue()));
		
	}
		
	@RequestMapping("/roomList.cr")
	public void roomList(@RequestParam("hotel_no") int no){
		//1. 쿠키 가져와서 시작날짜 - 끝나는날짜 검색
		//Booking Table 예약기간이랑 겹치지 않는 거 가져오기 
	}
	//호텔 + 방 + 사진 같이 수정
	@RequestMapping("/updateHotel.cr")
	public String updateHotel(HotelVO hotel){
		if(service.updateHotel(hotel)==1){
			return "redirect:/";
		}
		return "";
	}
	//호텔삭제
	@RequestMapping("/deleteHotel.cr")
	public String deleteHotel(HotelVO hotel){
		if(service.deleteHotel(hotel)==1){
			return "redirect:/";
		}
		return "";
	}
	
}
