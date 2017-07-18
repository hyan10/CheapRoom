package kr.co.bit.cr.booking;

public class BookingVO {

	private Integer no;
    private Integer userNo;
    private Integer hotelNo;
    private Integer roomNo;
    //  체크인 날짜
    private String startDate;
    //  체크아웃 날짜
    private String endDate;
    //  예약 인원
    private Integer totalPerson;
    private Integer totalPrice;
    //  카드 종류
    private String cardType;
    private String cardNo;
    private String cardDate;
    //  예약 날짜
    private String regDate;
    //  예약 유저 이름
    private String userName;
    //  예약 유저 이메일
    private String userEmail;
    //  예약 유저 번호
    private String userPhone;
    //	호텔 이름
    private String hotelName; 
    //	방 이름
    private String roomName;
    // 처리 완료 여부 (Y/N)
    private char type;

    

	public BookingVO() {
		// TODO Auto-generated constructor stub
	}
	
	
	// 예약 추가용 - 입력받은 정보 디비 추가
	public BookingVO(Integer userNo, Integer hotelNo, Integer roomNo, String startDate, String endDate,
			Integer totalPerson, Integer totalPrice, String cardType, String cardNo, String cardDate, String userName,
			String userEmail, String userPhone) {
		super();
		this.userNo = userNo;
		this.hotelNo = hotelNo;
		this.roomNo = roomNo;
		this.startDate = startDate;
		this.endDate = endDate;
		this.totalPerson = totalPerson;
		this.totalPrice = totalPrice;
		this.cardType = cardType;
		this.cardNo = cardNo;
		this.cardDate = cardDate;
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPhone = userPhone;
	}

	// 예약 수정용 ver1
		public BookingVO(Integer no, String userName,
				String userEmail, String userPhone) {
			super();
			this.no = no;
			this.userName = userName;
			this.userEmail = userEmail;
			this.userPhone = userPhone;
		}

	public BookingVO(Integer no, Integer userNo, Integer hotelNo, Integer roomNo, String startDate, String endDate,
			Integer totalPerson, Integer totalPrice, String cardType, String cardNo, String cardDate, String regDate,
			String userName, String userEmail, String userPhone, String hotelName, String roomName, char type) {
		super();
		this.no = no;
		this.userNo = userNo;
		this.hotelNo = hotelNo;
		this.roomNo = roomNo;
		this.startDate = startDate;
		this.endDate = endDate;
		this.totalPerson = totalPerson;
		this.totalPrice = totalPrice;
		this.cardType = cardType;
		this.cardNo = cardNo;
		this.cardDate = cardDate;
		this.regDate = regDate;
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPhone = userPhone;
		this.hotelName = hotelName;
		this.roomName = roomName;
		this.type = type;
	}

	public BookingVO(Integer no, Integer userNo, Integer hotelNo, Integer roomNo, String startDate, String endDate,
			Integer totalPerson, Integer totalPrice, String cardType, String cardNo, String cardDate, String regDate,
			String userName, String userEmail, String userPhone) {
		super();
		this.no = no;
		this.userNo = userNo;
		this.hotelNo = hotelNo;
		this.roomNo = roomNo;
		this.startDate = startDate;
		this.endDate = endDate;
		this.totalPerson = totalPerson;
		this.totalPrice = totalPrice;
		this.cardType = cardType;
		this.cardNo = cardNo;
		this.cardDate = cardDate;
		this.regDate = regDate;
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPhone = userPhone;
	}

	public Integer getNo() {
		return no;
	}

	public void setNo(Integer no) {
		this.no = no;
	}

	public Integer getUserNo() {
		return userNo;
	}

	public void setUserNo(Integer userNo) {
		this.userNo = userNo;
	}

	public Integer getHotelNo() {
		return hotelNo;
	}

	public void setHotelNo(Integer hotelNo) {
		this.hotelNo = hotelNo;
	}

	public Integer getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(Integer roomNo) {
		this.roomNo = roomNo;
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

	public Integer getTotalPerson() {
		return totalPerson;
	}

	public void setTotalPerson(Integer totalPerson) {
		this.totalPerson = totalPerson;
	}

	public Integer getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(Integer totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getCardType() {
		return cardType;
	}

	public void setCardType(String cardType) {
		this.cardType = cardType;
	}

	public String getCardNo() {
		return cardNo;
	}

	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}

	public String getCardDate() {
		return cardDate;
	}

	public void setCardDate(String cardDate) {
		this.cardDate = cardDate;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	
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

	public char getType() {
		return type;
	}

	public void setType(char type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "BookingVO [no=" + no + ", userNo=" + userNo + ", hotelNo=" + hotelNo + ", roomNo=" + roomNo
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", totalPerson=" + totalPerson + ", totalPrice="
				+ totalPrice + ", cardType=" + cardType + ", cardNo=" + cardNo + ", cardDate=" + cardDate + ", regDate="
				+ regDate + ", userName=" + userName + ", userEmail=" + userEmail + ", userPhone=" + userPhone + "]";
	}

    
}