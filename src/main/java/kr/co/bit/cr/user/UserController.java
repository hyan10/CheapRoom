package kr.co.bit.cr.user;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bit.cr.booking.BookingService;
import kr.co.bit.cr.booking.BookingVO;
import kr.co.bit.cr.favorite.FavoriteService;
import kr.co.bit.cr.favorite.FavoriteVO;
import kr.co.bit.cr.hotel.HotelVO;
import kr.co.bit.cr.owner.OwnerService;

import kr.co.bit.cr.owner.OwnerVO;
import kr.co.bit.cr.review.ReviewService;
import kr.co.bit.cr.review.ReviewVO;


@Controller
@RequestMapping("/user")
@SessionAttributes("user")
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private OwnerService ownerService;
	@Autowired
	private BookingService bookingService;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private FavoriteService favoriteService;

	
	@RequestMapping(value="/join.cr", method=RequestMethod.POST) 
	//public String join(UserVO userVO){
	public String join(HttpServletRequest request){
		//System.out.println("join info ----- > " + userVO);
		String name = (String)request.getParameter("name");
		String email = (String)request.getParameter("email");
		String phone  = (String)request.getParameter("phone");
		String password = (String)request.getParameter("password");
		UserVO user = new UserVO(email, password, "U", name, phone);
		System.out.println("user 가입정보 : " + user);
		userService.join(user);
		return "redirect:/";
	}
	
//	@RequestMapping(value="/login.cr", method=RequestMethod.GET)
//	public String loginForm(){
//		return "/user/login.cr";
//	}
	@RequestMapping(value="/login.cr", method=RequestMethod.POST)
	public String login(UserVO userVO, Model model, HttpSession session){
		UserVO user = userService.login(userVO); 
		if(user == null){
			model.addAttribute("msg", "아이디 또는 패스워드가 잘못되었습니다.");
			System.out.println("아이디 또는 패스워드가 잘못되었습니다.");
			return "redirect:/";
		} else {
			System.out.println("로그인 성공 : " + user);
		}
//		model.addAttribute("loginUser", user);
		session.setAttribute("loginUser", user);
		if(user.getType().equals("S")){
			return "redirect:/admin/admissionList.cr";
		}
		return "search";
	}
	/*@RequestMapping(value="/login.cr", method=RequestMethod.POST)
	public String login(HttpServletRequest request, UserVO userVO, Model model, HttpSession session){
		String loginType = request.getParameter("loginType");
		System.out.println("로그인 타입 : "+loginType);
		UserVO user = null;
		OwnerVO owner = null;
		String email = userVO.getEmail();
		String password = userVO.getPassword();
		if(loginType != null){
			owner = OwnerService.login(new OwnerVO(email, password));
			model.addAttribute("user", owner);
		} else {
			user = userService.login(userVO); 
			model.addAttribute("user", user);
		}
		if(user == null && owner == null){
			model.addAttribute("msg", "아이디 또는 패스워드가 잘못되었습니다.");
			System.out.println("아이디 또는 패스워드가 잘못되었습니다.");
		} else {
			System.out.println("로그인 성공");
		}
		return "redirect:/";
	}*/
	@RequestMapping("/logout.cr")
	public String logout(HttpSession session){
		UserVO user = (UserVO) session.getAttribute("loginUser");
		System.out.println("로그아웃 정보" + user);
		session.invalidate();
		return "redirect:/";
	}
	@RequestMapping("/info.cr")
	public String userInfo(HttpSession session){
		//세선 받아오기
		UserVO user = (UserVO) session.getAttribute("loginUser");
		System.out.println("로그인 중인 user : " + user);
		user = userService.info(user);
		session.setAttribute("userInfo", user);
		
		return "myPage";
	}
	@RequestMapping("/bookingList.cr")
	public ModelAndView userBookingList(HttpSession session){
		UserVO user = (UserVO) session.getAttribute("loginUser");
		List<BookingVO> bookingList = bookingService.userBookingList(user.getNo());
		ModelAndView mav = new ModelAndView("/user/bookingList"); //예약 현황 페이
		mav.addObject("bookingList", bookingList);
		return mav;
/*		//부킹 서비스로 부르기
		UserVO user = (UserVO) session.getAttribute("loginUser");
		List<BookingVO> bookingList = bookingService.userBookingList(userNo);
		ModelAndView mav = new ModelAndView("/user/bookingList"); //예약 현황 페이
		mav.addObject("bookingList", bookingList);
		return mav;*/
	}
	@RequestMapping("/bookingHistoryList.cr")
	public ModelAndView userBookingHistory(HttpSession session){
		UserVO user = (UserVO) session.getAttribute("loginUser");
		List<BookingVO> bookingHistoryList = bookingService.userBookingList(user.getNo());
		ModelAndView mav = new ModelAndView("/user/bookingHistoryList"); //예약 현황 페이
		mav.addObject("bookingHistoryList", bookingHistoryList);
		return mav;
	}
	/*
	 * user : 내 후기 
	 */
	@RequestMapping(value="/registerReview.cr", method=RequestMethod.POST)
	public String registerReview(@RequestParam("hotelNo") String hotelNo, @RequestParam("userNo") String userNo, ReviewVO reviewVO){
		reviewService.registerReview(reviewVO);
		return "redirect:/user/bookingHistoryList.cr";
	}
	
	@RequestMapping("/reviewList.cr")
	public ModelAndView userReview(HttpSession session){
		UserVO user = (UserVO) session.getAttribute("loginUser");
		List<ReviewVO> reviewList = reviewService.userReviewList(user.getNo());
		ModelAndView mav = new ModelAndView("/user/reviewList");
		mav.addObject("reviewList", reviewList);
		return mav;
	}
	@RequestMapping("/blind.cr")
	public void userBlind(){
		//세선 받아오기
	}
	@RequestMapping(value="/favorite.cr",method=RequestMethod.GET)
	@ResponseBody
	public String Favorite(HttpSession session, @RequestParam("hotelNo")int hotelNo){
		UserVO user = (UserVO)session.getAttribute("loginUser");
		FavoriteVO favorite = new FavoriteVO();
		favorite.setUserNo(user.getNo());
		favorite.setHotelNo(hotelNo);
		System.out.println(favorite);
		String msg = favoriteService.Favorite(favorite);
		System.out.println(favorite);
		if(msg==null){
			msg="error";
		}
		//return "redirect:/hotel/hotelList.cr?msg="+msg;
		//호텔 셋 favorite
		System.out.println(msg);
		
		return msg;
	}
	
	@RequestMapping(value="/favoriteList.cr",method=RequestMethod.GET)
	public String FavoriteList(HttpSession session, Model model){
		
		UserVO user = (UserVO)session.getAttribute("loginUser");
		List<HotelVO> hotel = new ArrayList<>();
		hotel = favoriteService.bookmarkList(user.getNo());
		System.out.println(hotel);
		model.addAttribute("hotelList",hotel);
		return "favoriteList";
	}
	
	@RequestMapping(value="/cancel.cr",method=RequestMethod.GET)
	public String Cancel(HttpSession session, @RequestParam("hotelNo")int hotelNo){
		System.out.println("csdjlfasjf;sfdksfjsdlkfjals;j;lskdfjlsdkafjlkdsfjdls;jlk");
		FavoriteVO favorite = new FavoriteVO();
		UserVO user = (UserVO)session.getAttribute("loginUser");
		favorite.setUserNo(user.getNo());
		favorite.setHotelNo(hotelNo);
		int cnt = favoriteService.Cancel(favorite);
		
		return "redirect:/user/favoriteList.cr";
	}
	  
}
