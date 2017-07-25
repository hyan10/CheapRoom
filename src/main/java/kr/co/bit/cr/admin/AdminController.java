package kr.co.bit.cr.admin;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bit.cr.booking.BookingService;
import kr.co.bit.cr.booking.BookingVO;
import kr.co.bit.cr.chart.ChartService;
import kr.co.bit.cr.chart.ChartVO;
import kr.co.bit.cr.owner.OwnerService;
import kr.co.bit.cr.owner.OwnerVO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private ChartService chartService;
	@Autowired
	private OwnerService ownerService;
	@Autowired
	private BookingService bookingService;
	
	@Autowired
	private HttpSession session;

	
	//승인대기중인리스트
	@RequestMapping(value="/admissionList.cr", method=RequestMethod.GET)
	public ModelAndView AdmissionList(){
		List<OwnerVO> ownerList = ownerService.selectOwnerByType("N");
		ModelAndView mav = new ModelAndView();
		mav.addObject("ownerList", ownerList);
		mav.setViewName("admin/admission");
		System.out.println(ownerList);
		return mav;
	}
	//승인
	@RequestMapping(value="/admission.cr", method=RequestMethod.GET)
	public String Admission(@RequestParam("ownerNo")int ownerNo, Model model){
		int cnt = ownerService.updateOwnerType(ownerNo);
		String msg = "";
		if(cnt==1){
			msg="사업자 승인 완료";
		}else{
			msg="사업자 승인 실패";
		}
		model.addAttribute("msg", msg);
		return "redirect:/admin/admissionList.cr";
	}
	
	@RequestMapping(value="/rejection.cr", method=RequestMethod.GET)
	public String rejection(@RequestParam("ownerNo")int ownerNo){
		System.out.println("delete");
		int cnt = ownerService.deleteOwnerByNo(ownerNo);

		return "redirect:/admin/admissionList.cr";
	}
	
	
	/**
	 * 현재 예약 진행중인 내역
	 * @param request
	 * @return
	 */
	@RequestMapping("/bookingList.cr")
	public ModelAndView bookingList(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		List<BookingVO> bookingList = new ArrayList<>();
		bookingList = bookingService.bookingList();
		
		mav.addObject("bookingList", bookingList);
		mav.setViewName("admin/bookingList");
		
		return mav;
	}
	
	/**
	 * admin의 월별 지난 내역
	 * @param request
	 * @return
	 */
	@RequestMapping("/bookingHistoryList.cr")
	public ModelAndView bookingHistoryList(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		List<ChartVO> chartList = new ArrayList<>();
		List<BookingVO> bookingList = new ArrayList<>();
	
		// 1. 날짜 계산 & 저장
		// 현재 월이 최대 월
		int maxMonth = new Date().getMonth()+1;
		int month = request.getParameter("month")!=null?Integer.parseInt(request.getParameter("month")):maxMonth;
		request.setAttribute("month", month);
		request.setAttribute("maxMonth", maxMonth);
		
		// 이번 달 통계
		/*if(maxMonth == month){
			chartList = chartService.chartThisMonth();
			bookingList = bookingService.bookingHistoryList(month);
		}else {
			// n월의 통계
*/			chartList = chartService.chartLastMonth(month);
			bookingList = bookingService.bookingHistoryList(month);
		/*}*/
		
		if(chartList.isEmpty()){
			chartList = new ArrayList<>();
			ChartVO chart = new ChartVO();
			chart.setHotelName("");
			chart.setCount(0);
			chart.setProfit(0);
			chart.setTotalPerson(0);
			chartList.add(chart);
		}
		
		if(bookingList.isEmpty()){
			bookingList = new ArrayList<>();
		}
		
		System.out.println(chartList);
		
		mav.addObject("bookingList",bookingList);
		mav.addObject("chartList",chartList);
		mav.setViewName("admin/bookingHistoryList");
		
		return mav;
	}
	
	/**
	 * admin의 전체 통계
	 * @return
	 */
	@RequestMapping("/chart.cr")
	public ModelAndView chart(){
		ModelAndView mav = new ModelAndView();
		List<ChartVO> chartList = new ArrayList<>();
		
		chartList = chartService.chartAll();
		
		mav.addObject("chartList",chartList);
		mav.setViewName("admin/chart");
		
		return mav;
	}
}
