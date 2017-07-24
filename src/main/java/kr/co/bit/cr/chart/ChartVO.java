package kr.co.bit.cr.chart;

//호텔 월별 통계
public class ChartVO {

	private Integer hotelNo;

	private Integer year;

	private Integer month;

	private Integer cityNo;

	// 지난 내역 건수
	private Integer count;

	// 수익
	private Integer profit;

	private Integer totalPerson;
	
	private String hotelName;

	public Integer getHotelNo() {
		return hotelNo;
	}

	public void setHotelNo(Integer hotelNo) {
		this.hotelNo = hotelNo;
	}

	public Integer getYear() {
		return year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	public Integer getMonth() {
		return month;
	}

	public void setMonth(Integer month) {
		this.month = month;
	}

	public Integer getCityNo() {
		return cityNo;
	}

	public void setCityNo(Integer cityNo) {
		this.cityNo = cityNo;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public Integer getProfit() {
		return profit;
	}

	public void setProfit(Integer profit) {
		this.profit = profit;
	}

	public Integer getTotalPerson() {
		return totalPerson;
	}

	public void setTotalPerson(Integer totalPerson) {
		this.totalPerson = totalPerson;
	}
	

	public String getHotelName() {
		return hotelName;
	}

	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}

	@Override
	public String toString() {
		return "{hotelNo:" + hotelNo + ", year:" + year + ", month:" + month + ", cityNo:" + cityNo + ", count:"
				+ count + ", profit:" + profit + ", totalPerson:" + totalPerson + ", hotelName:\"" + hotelName + "\"}";
	}
	
}
