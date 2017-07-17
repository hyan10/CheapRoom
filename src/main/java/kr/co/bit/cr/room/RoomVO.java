package kr.co.bit.cr.room;

import java.util.List;

import org.springframework.stereotype.Repository;

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
    private char cooking;

    //  티비 (Y/N)
    private char tv;

    //  에어컨 (Y/N)
    private char ac;
    
    //사진 리스트
    private List<ImageVO> images;
    
    
    
    public RoomVO() {
		super();
		// TODO Auto-generated constructor stub
	}



	public RoomVO(Integer hotelNo, String name, Integer price, Integer minPerson, Integer maxPerson,
			Integer addPrice, char cooking, char tv, char ac, List<ImageVO> images) {
		super();
		this.hotelNo = hotelNo;
		this.name = name;
		this.price = price;
		this.minPerson = minPerson;
		this.maxPerson = maxPerson;
		this.addPrice = addPrice;
		this.cooking = cooking;
		this.tv = tv;
		this.ac = ac;
		this.images = images;
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



	public char getCooking() {
		return cooking;
	}



	public void setCooking(char cooking) {
		this.cooking = cooking;
	}



	public char getTv() {
		return tv;
	}



	public void setTv(char tv) {
		this.tv = tv;
	}



	public char getAc() {
		return ac;
	}



	public void setAc(char ac) {
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
				+ tv + ", ac=" + ac + ", images=" + images + "]";
	}
    
	
    
    
}
