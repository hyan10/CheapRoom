package kr.co.bit.cr.hotel;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.junit.runner.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.bit.cr.search.SearchVO;

@Controller
@RequestMapping("/hotel")
public class HotelController {
	@Autowired
	private HotelService service;
	
	//호텔 + 방 같이 등록
	@RequestMapping(value="/register.cr", method=RequestMethod.POST)
	public String registerHotel(HotelVO hotel){
		
		if(service.registerHotel(hotel)==1){
			return "redirect:/owner/info.cr";
		}
		return "hotel/register";	//실패시 메세지띄우고 입력폼유지
	}
	//검색 : 지역 번호, 체크인, 체크아웃 날짜, 인원수 
	//
	@RequestMapping(value="/hotelList.cr", method=RequestMethod.GET)
	public String hotelList(@ModelAttribute("search")SearchVO search, 
							@RequestParam("daterange")String daterange, Model model,
							HttpServletResponse response){
		//1. 쿠키에 input form 날라온 데이터 저장해주기
		//2. 지역 번호로 호텔 검색하는데, 사람 인원수를 보여줘야하니까-> 호텔 방 조인해서 가능한 방이 한개 이상있으면 호텔 보여줘
		//지역번호로 호텔조회함/ 호텔리스트에서 상세페이지 들어가면 룸이랑 부킹 확인해서 예약가능한 방 보여줌
		//날짜 2018-01-01 - 2018-01-01 //날짜파싱해야댐
		//지역 번호로 호텔 검색
		List<HotelVO> list = new ArrayList<>();
		
		//날짜파싱
		String date = daterange.replaceAll(" ", "");
		search.setStartDate(date.substring(0, 10));
		search.setEndDate(date.substring(11));
		
		//쿠키 생성 및 등록
		Cookie cityNo = new Cookie("cityNo",String.valueOf(search.getCityNo()));
		Cookie startDate = new Cookie("startDate", search.getStartDate());
		Cookie endDate = new Cookie("endDate", search.getEndDate());
		Cookie personNo = new Cookie("personNo",String.valueOf(search.getPersonNo()));
		
		response.addCookie(cityNo);
		response.addCookie(startDate);
		response.addCookie(endDate);
		response.addCookie(personNo);
		
		search.setCityNo(Integer.parseInt(cityNo.getValue()));
		search.setPersonNo(Integer.parseInt(personNo.getValue()));
		list = service.hotelList(search);
		model.addAttribute("hotelList", list);

		return "hotelList";
	}
		
	@RequestMapping(value="/roomList.cr", method=RequestMethod.GET)
	public String roomList(@RequestParam("hotelNo") int no,@RequestParam("roomNo")List<Integer> roomNo,
						 @CookieValue(value="startDate",required=true)Cookie startDate,
						 @CookieValue(value="endDate",required=true)Cookie endDate,
						 Model model){
		//1. 쿠키 가져와서 시작날짜 - 끝나는날짜 검색
		//Booking Table 예약기간이랑 겹치지 않는 거 가져오기 
		HotelVO hotel = new HotelVO();
		//hotel.setNo(no);
		//hotel.setRooms(rooms);
		SearchVO search = new SearchVO();
		search.setStartDate(startDate.getValue());
		search.setEndDate(endDate.getValue());
		hotel = service.roomList(no, roomNo, search);
		model.addAttribute("hotel",hotel);
		return "roomList";
		
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
