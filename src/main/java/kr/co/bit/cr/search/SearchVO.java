package kr.co.bit.cr.search;

public class SearchVO {
	private int cityNo;
	private String startDate;
	private String endDate;
	private int personNo;
	public SearchVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SearchVO(int cityNo, String startDate, String endDate, int personNo) {
		super();
		this.cityNo = cityNo;
		this.startDate = startDate;
		this.endDate = endDate;
		this.personNo = personNo;
	}
	public int getCityNo() {
		return cityNo;
	}
	public void setCityNo(int cityNo) {
		this.cityNo = cityNo;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public int getPersonNo() {
		return personNo;
	}
	public void setPersonNo(int personNo) {
		this.personNo = personNo;
	}
	@Override
	public String toString() {
		return "SearchVO [cityNo=" + cityNo + ", startDate=" + startDate + ", endDate=" + endDate + ", personNo="
				+ personNo + "]";
	}
	
	
}
