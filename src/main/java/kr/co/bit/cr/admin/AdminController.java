package kr.co.bit.cr.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
	
	@RequestMapping(value="/chart.cr", method=RequestMethod.GET)
	public ModelAndView Chart(){
		
		ModelAndView mav = new ModelAndView();
//		ChartVO chart = chartService.chartThisMonth();
//		
//		mav.addObject("chart",chart);
//		mav.setViewName("admin/chart");
		return mav;
	}
	
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
		int cnt = ownerService.updateOnwerType(ownerNo);
		String msg = "";
		if(cnt==1){
			msg="사업자 승인 완료";
		}else{
			msg="사업자 승인 실패";
		}
		model.addAttribute("msg", msg);
		return "admin/admission";
	}
	
}
