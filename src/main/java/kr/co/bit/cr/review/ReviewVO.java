package kr.co.bit.cr.review;

//평점
public class ReviewVO {

	private Integer hotelNo;

	private Integer userNo;

	private Integer cleanliness;

	private Integer comfort;

	private Integer location;

	private Integer facilities;

	private Integer staff;
	
	private String regDate;
	
	private String hotelName;
	private String roomName;
	
	
	public String getHotelName() {
		return hotelName;
	}
	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public ReviewVO() {
		// TODO Auto-generated constructor stub
	}
	public ReviewVO(Integer hotelNo, Integer userNo, Integer cleanliness, Integer comfort, Integer location,
			Integer facilities, Integer staff, String regDate) {
		super();
		this.hotelNo = hotelNo;
		this.userNo = userNo;
		this.cleanliness = cleanliness;
		this.comfort = comfort;
		this.location = location;
		this.facilities = facilities;
		this.staff = staff;
		this.regDate = regDate;
	}
	
	public ReviewVO(Integer hotelNo, Integer userNo, Integer cleanliness, Integer comfort, Integer location,
			Integer facilities, Integer staff, String regDate, String hotelName, String roomName) {
		super();
		this.hotelNo = hotelNo;
		this.userNo = userNo;
		this.cleanliness = cleanliness;
		this.comfort = comfort;
		this.location = location;
		this.facilities = facilities;
		this.staff = staff;
		this.regDate = regDate;
		this.hotelName = hotelName;
		this.roomName = roomName;
	}
	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public Integer getHotelNo() {
		return hotelNo;
	}

	public void setHotelNo(Integer hotelNo) {
		this.hotelNo = hotelNo;
	}

	public Integer getUserNo() {
		return userNo;
	}

	public void setUserNo(Integer userNo) {
		this.userNo = userNo;
	}

	public Integer getCleanliness() {
		return cleanliness;
	}

	public void setCleanliness(Integer cleanliness) {
		this.cleanliness = cleanliness;
	}

	public Integer getComfort() {
		return comfort;
	}

	public void setComfort(Integer comfort) {
		this.comfort = comfort;
	}

	public Integer getLocation() {
		return location;
	}

	public void setLocation(Integer location) {
		this.location = location;
	}

	public Integer getFacilities() {
		return facilities;
	}

	public void setFacilities(Integer facilities) {
		this.facilities = facilities;
	}

	public Integer getStaff() {
		return staff;
	}

	public void setStaff(Integer staff) {
		this.staff = staff;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ReviewVO [hotelNo=");
		builder.append(hotelNo);
		builder.append(", userNo=");
		builder.append(userNo);
		builder.append(", cleanliness=");
		builder.append(cleanliness);
		builder.append(", comfort=");
		builder.append(comfort);
		builder.append(", location=");
		builder.append(location);
		builder.append(", facilities=");
		builder.append(facilities);
		builder.append(", staff=");
		builder.append(staff);
		builder.append(", regDate=");
		builder.append(regDate);
		builder.append("]");
		return builder.toString();
	}
}
