package kr.co.bit.cr.favorite;

public class FavoriteVO {
	private int userNo;
	private int hotelNo;
	private String flag;
	public FavoriteVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FavoriteVO(int userNo, int hotelNo) {
		super();
		this.userNo = userNo;
		this.hotelNo = hotelNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getHotelNo() {
		return hotelNo;
	}
	public void setHotelNo(int hotelNo) {
		this.hotelNo = hotelNo;
	}
	
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	@Override
	public String toString() {
		return "FavoriteVO [userNo=" + userNo + ", hotelNo=" + hotelNo + ", flag=" + flag + "]";
	}
	
	
}
