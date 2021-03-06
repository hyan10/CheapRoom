package kr.co.bit.cr.room;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.co.bit.cr.image.ImageVO;

public class RoomVO {
	private Integer no;

    private Integer hotelNo;

    private String name;

    private Integer price;

    //  최소 인원
    private Integer minPerson;

    //  최대 인원
    private Integer maxPerson;

    //  추가 인원 1인당 요금
    private Integer addPrice;

    //  취사 (Y/N)
    private String cooking;

    //  티비 (Y/N)
    private String tv;

    //  에어컨 (Y/N)
    private String ac;
    
    //예약여부(Y/N)
    private String booking;
    //사진 리스트
    private List<ImageVO> images;
    
    //roomvo list
    private List<RoomVO> roomList;
    
    private MultipartFile image;
    
    private List<MultipartFile> imageList;
    
    public RoomVO() {
		super();
		// TODO Auto-generated constructor stub
	}



	
	public RoomVO(Integer no, Integer hotelNo, String name, Integer price, Integer minPerson, Integer maxPerson,
			Integer addPrice, String cooking, String tv, String ac, String booking, List<ImageVO> images) {
		super();
		this.no = no;
		this.hotelNo = hotelNo;
		this.name = name;
		this.price = price;
		this.minPerson = minPerson;
		this.maxPerson = maxPerson;
		this.addPrice = addPrice;
		this.cooking = cooking;
		this.tv = tv;
		this.ac = ac;
		this.booking = booking;
		this.images = images;
	}

	
	public MultipartFile getImage() {
		return image;
	}




	public void setImage(MultipartFile image) {
		this.image = image;
	}




	public List<MultipartFile> getImageList() {
		return imageList;
	}




	public void setImageList(List<MultipartFile> imageList) {
		this.imageList = imageList;
	}


	public List<RoomVO> getRoomList() {
		return roomList;
	}

	public void setRoomList(List<RoomVO> roomList) {
		this.roomList = roomList;
	}




	public String getBooking() {
		return booking;
	}

	public void setBooking(String booking) {
		this.booking = booking;
	}

	public Integer getNo() {
		return no;
	}



	public void setNo(Integer no) {
		this.no = no;
	}



	public Integer getHotelNo() {
		return hotelNo;
	}



	public void setHotelNo(Integer hotelNo) {
		this.hotelNo = hotelNo;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public Integer getPrice() {
		return price;
	}



	public void setPrice(Integer price) {
		this.price = price;
	}



	public Integer getMinPerson() {
		return minPerson;
	}



	public void setMinPerson(Integer minPerson) {
		this.minPerson = minPerson;
	}



	public Integer getMaxPerson() {
		return maxPerson;
	}



	public void setMaxPerson(Integer maxPerson) {
		this.maxPerson = maxPerson;
	}



	public Integer getAddPrice() {
		return addPrice;
	}



	public void setAddPrice(Integer addPrice) {
		this.addPrice = addPrice;
	}



	public String getCooking() {
		return cooking;
	}



	public void setCooking(String cooking) {
		this.cooking = cooking;
	}



	public String getTv() {
		return tv;
	}



	public void setTv(String tv) {
		this.tv = tv;
	}



	public String getAc() {
		return ac;
	}



	public void setAc(String ac) {
		this.ac = ac;
	}



	public List<ImageVO> getImages() {
		return images;
	}



	public void setImages(List<ImageVO> images) {
		this.images = images;
	}




	@Override
	public String toString() {
		return "RoomVO [no=" + no + ", hotelNo=" + hotelNo + ", name=" + name + ", price=" + price + ", minPerson="
				+ minPerson + ", maxPerson=" + maxPerson + ", addPrice=" + addPrice + ", cooking=" + cooking + ", tv="
				+ tv + ", ac=" + ac + ", booking=" + booking + ", images=" + images + ", roomList=" + roomList
				+ ", imageList=" + imageList + "]";
	}


	
	

}