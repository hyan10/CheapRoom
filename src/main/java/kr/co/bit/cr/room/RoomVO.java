package kr.co.bit.cr.room;

import java.util.List;

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
    
    private List<ImageVO> images;
    
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
}
