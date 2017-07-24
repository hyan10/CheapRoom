package kr.co.bit.cr.hotel;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.GetObjectRequest;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.model.S3Object;

import kr.co.bit.cr.image.ImageVO;
import kr.co.bit.cr.owner.OwnerVO;
import kr.co.bit.cr.room.RoomVO;
import kr.co.bit.cr.search.SearchVO;
import kr.co.bit.cr.user.UserVO;
import kr.co.bit.cr.util.Util;

@Controller
@RequestMapping("/hotel")
public class HotelController {
	@Autowired
	private HotelService service;
	
	//aws s3 접근정보
	private final String AWS_ACCESS_KEY = Util.jsonParse("AWS_ACCESS_KEY");
	private final String AWS_SECRET_KEY = Util.jsonParse("AWS_SECRET_KEY");
	private final String AWS_BUCKETNAME = "cheaproom";
	
	//호텔 + 방 같이 등록
	@RequestMapping(value="/hotelRegister.cr", method=RequestMethod.GET)
	public String registerHotelForm(){
		System.out.println("호텔등록폼");
		return "registerHotel";
	}
	@RequestMapping(value="/hotelRegister.cr", method=RequestMethod.POST)
	public String registerHotel(@ModelAttribute("hotel")HotelVO hotel,HttpSession session, @RequestParam("imgurl")MultipartFile uploadFile){
		if(hotel.getBbq()==null){
			hotel.setBbq("N");
		}
		if(hotel.getParking()==null){
			hotel.setParking("N");
		}
		if(hotel.getPool()==null){
			hotel.setPool("N");
		}
		if(hotel.getSmoking()==null){
			hotel.setSmoking("N");
		}
		if(hotel.getWifi()==null){
			hotel.setWifi("N");
		}
		
		System.out.println("이미지업로드");
		
        BasicAWSCredentials creds = new BasicAWSCredentials(AWS_ACCESS_KEY, AWS_SECRET_KEY); 
        AmazonS3 s3Client = AmazonS3ClientBuilder.standard().withRegion(Regions.AP_NORTHEAST_2).withCredentials(new AWSStaticCredentialsProvider(creds)).build();
        String fileName = uploadFile.getOriginalFilename();
        File file=null;
		try {
			file = Util.multipartToFile(uploadFile);
		} catch (IllegalStateException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
        PutObjectRequest putObjectRequest = new PutObjectRequest(AWS_BUCKETNAME, "upload/hotel/"+fileName, file);
        putObjectRequest.setCannedAcl(CannedAccessControlList.PublicRead); // URL 접근시 권한 읽을수 있도록 설정.
        s3Client.putObject(putObjectRequest);
        System.out.println("Uploadinf OK");
        // 파일 다운로드 다운로드 경로와 파일이름 동시 필요. 
//        System.out.println("Downloading an object");
//        S3Object object = s3Client.getObject(new GetObjectRequest(AWS_BUCKETNAME, "upload/hotel/"+fileName));
//        System.out.println("Content-Type: "  + object.getObjectMetadata().getContentType());
       // displayTextInputStream(object.getObjectContent());
        
        
        
		System.out.println(uploadFile);
		
//		String filePath = session.getServletContext().getRealPath("/upload/hotel/");
//		if (!uploadFile.isEmpty()) { 
//	
//			try { 
//				byte[] bytes = uploadFile.getBytes(); 
//				BufferedOutputStream stream = 
//						new BufferedOutputStream(new FileOutputStream(new File(filePath+fileName))); 
//				stream.write(bytes); 
//				stream.close(); 
//				System.out.println("Creating file: " + filePath); 
//				System.out.println("You successfully uploaded " + fileName); 
//			} catch (Exception e) { 
//				e.printStackTrace();
//			} 
//		} else { 
//			System.out.println("You failed to upload " + uploadFile.getOriginalFilename() + " because the file was empty."); 
//		} 
		
		OwnerVO owner = (OwnerVO)session.getAttribute("loginUser");
		hotel.setOwnerNo(owner.getNo());
		hotel.setNo(service.selectHotelSeq());
		hotel.setImgUrl(fileName);
		System.out.println(hotel);
		session.setAttribute("hotel", hotel);
		return "registerRoom";
	
	}

	@RequestMapping(value="/roomRegister.cr", method=RequestMethod.POST)
	public String registerRoom(RoomVO room, HttpSession session){
		HotelVO hotel = (HotelVO)session.getAttribute("hotel");
		List<RoomVO> list = room.getRoomList();

		for(RoomVO r: list){
			if(r.getCooking()==null){
				r.setCooking("N");
			}
			if(r.getTv()==null){
				r.setTv("N");
			}
			if(r.getAc()==null){
				r.setAc("N");
			}
			r.setHotelNo(hotel.getNo());
			r.setNo(service.selectRoomSeq());
			//r.setImages(images);
			//이미지리스트에 룸번호 세팅
			//이미지 리스트 업로드
			List<MultipartFile> files = r.getImageList();
			List<ImageVO> imgList = new ArrayList<>();
			
			for(MultipartFile uploadFile : files){
				ImageVO img = new ImageVO();
				BasicAWSCredentials creds = new BasicAWSCredentials(AWS_ACCESS_KEY, AWS_SECRET_KEY); 
				AmazonS3 s3Client = AmazonS3ClientBuilder.standard().withRegion(Regions.AP_NORTHEAST_2).withCredentials(new AWSStaticCredentialsProvider(creds)).build();
				String fileName = uploadFile.getOriginalFilename();
				File file=null;
				try {
					file = Util.multipartToFile(uploadFile);
				} catch (IllegalStateException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				} catch (IOException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				PutObjectRequest putObjectRequest = new PutObjectRequest(AWS_BUCKETNAME, "upload/room/"+fileName, file);
				putObjectRequest.setCannedAcl(CannedAccessControlList.PublicRead); // URL 접근시 권한 읽을수 있도록 설정.
				s3Client.putObject(putObjectRequest);
				System.out.println("Uploadinf OK");
				
				img.setUrl(fileName);
				img.setRoomNo(r.getNo());
				imgList.add(img);
			}
			
//		        
//			for(MultipartFile f : files){
//				ImageVO img = new ImageVO();
//				String filePath = session.getServletContext().getRealPath("/upload/room/");
//				String fileName = f.getOriginalFilename();
//				if (!f.isEmpty()){ 
//					try { 
//						byte[] bytes = f.getBytes(); 
//						BufferedOutputStream stream = 
//								new BufferedOutputStream(new FileOutputStream(new File(filePath+fileName))); 
//						stream.write(bytes); 
//						stream.close(); 
//						System.out.println("Creating file: " + filePath); 
//						System.out.println("You successfully uploaded " + fileName); 
//					} catch (Exception e) { 
//						e.printStackTrace();
//					} 
//				} else { 
//					System.out.println("You failed to upload " + f.getOriginalFilename() + " because the file was empty."); 
//				} 
//				img.setUrl(fileName);
//				img.setRoomNo(r.getNo());
//				imgList.add(img);
//			}
			
			r.setImages(imgList);
			
		}

		System.out.println(hotel);

		hotel.setRooms(list);
		System.out.println("-----");
		System.out.println(hotel);
		int result = service.registerHotel(hotel);
		session.removeAttribute("hotel");
		if(result==1){
			return "redirect:/owner/info.cr";
		}
		return "redirect:/";
	}

	
	@RequestMapping(value="/hotelList.cr", method=RequestMethod.GET)
	public String hotelList(@ModelAttribute("search")SearchVO search, 
							@RequestParam("dateRange")String daterange, Model model,
							HttpServletResponse response,
							HttpSession session){
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
		
		
		System.out.println(list);
		//owner user 체크
		UserVO user = (UserVO)session.getAttribute("loginUser");
		list = service.favoriteList(list, user);
		System.out.println("favorite추가");
		System.out.println(list);
		model.addAttribute("hotelList", list);
		return "hotelList";
	}

	@RequestMapping(value="/roomList.cr", method=RequestMethod.GET)
	public String roomList(@RequestParam("hotelNo") int no, @RequestParam("hotelNo") String datarange, 
						 @CookieValue(value="startDate",required=true)Cookie startDate,
						 @CookieValue(value="endDate",required=true)Cookie endDate,
						 Model model){
		//1. 쿠키 가져와서 시작날짜 - 끝나는날짜 검색
		//Booking Table 예약기간이랑 겹치지 않는 거 가져오기 
		HotelVO hotel = new HotelVO();
		SearchVO search = new SearchVO();
		search.setStartDate(startDate.getValue());
		search.setEndDate(endDate.getValue());
		hotel = service.roomList(no, search);
		
		model.addAttribute("roomList",hotel.getRooms());
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
