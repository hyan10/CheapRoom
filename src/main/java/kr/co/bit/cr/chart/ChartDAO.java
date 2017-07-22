package kr.co.bit.cr.chart;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChartDAO {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	// 사업자의 이번 달 통계
	public List<ChartVO> chartThisMonthByOwnerNo(int ownerNo) {
		List<ChartVO> chartList = sqlSessionTemplate.selectList("chart.ChartDAO.selectChartThisMonthByOwnerNo", ownerNo);
		System.out.println(chartList);
		return chartList;
	}

	// 관리자의 이번 달 통계
	public List<ChartVO> chartThisMonth() {
		return sqlSessionTemplate.selectList("chart.ChartDAO.selectChartThisMonth");
	}
	
	// 관리자의 n월 통계
	public List<ChartVO> chartLastMonth(String month){
		return sqlSessionTemplate.selectList("chart.ChartDAO.selectChartLastMonth", month);
	}

}
