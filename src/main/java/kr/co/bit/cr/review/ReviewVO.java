package kr.co.bit.cr.review;

//평점
public class ReviewVO {

	private Integer hotelNo;

	private Integer userNo;

	private float cleanliness;

	private float comfort;

	private float location;

	private float facilities;

	private float staff;
	
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
	public ReviewVO(Integer hotelNo, Integer userNo, float cleanliness, float comfort, float location,
			float facilities, float staff, String regDate) {
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
	
	public ReviewVO(Integer hotelNo, Integer userNo, float cleanliness, float comfort, float location,
			float facilities, float staff, String regDate, String hotelName, String roomName) {
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

	public float getCleanliness() {
		return cleanliness;
	}

	public void setCleanliness(float cleanliness) {
		this.cleanliness = cleanliness;
	}

	public float getComfort() {
		return comfort;
	}

	public void setComfort(float comfort) {
		this.comfort = comfort;
	}

	public float getLocation() {
		return location;
	}

	public void setLocation(float location) {
		this.location = location;
	}

	public float getFacilities() {
		return facilities;
	}

	public void setFacilities(float facilities) {
		this.facilities = facilities;
	}

	public float getStaff() {
		return staff;
	}

	public void setStaff(float staff) {
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
