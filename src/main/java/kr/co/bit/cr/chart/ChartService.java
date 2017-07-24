package kr.co.bit.cr.chart;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChartService {

	@Autowired
	ChartDAO dao;
	
	// 사업자의 이번달 통계
	public  List<ChartVO> chartThisMonthByOwnerNo(int ownerNo){
		System.out.println(ownerNo);
		return dao.chartThisMonthByOwnerNo(ownerNo);
	}
	
	// 관리자의 이번달 통계
	public List<ChartVO> chartThisMonth(){
		return dao.chartThisMonth();
	}
	
	// 관리자의 n월 통계
	public List<ChartVO> chartLastMonth(int month){
		return dao.chartLastMonth(month);
	}

	// 사업자의 n월 통계
	public List<ChartVO> chartLastMonthByOwnerNo(Map<String, Integer> map) {
		return dao.chartLastMonthByOwnerNo(map);
	}
	
	// 월별 통계
	public List<ChartVO> chartAllByOwnerNo(int ownerNo){
		return dao.chartAllByOwnerNo(ownerNo);
	}
	
}
