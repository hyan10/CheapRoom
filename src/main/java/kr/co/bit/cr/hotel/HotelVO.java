package kr.co.bit.cr.hotel;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.co.bit.cr.room.RoomVO;

@Repository
public class HotelVO {
	private Integer no;

    private Integer ownerNo;

    //  지역
    private Integer cityNo;

    private String name;

    //  블라인드 여부 (Y/N)
    private String blind;

    private Integer tel;

    //  (Y/N)
    private String parking;

    //  (Y/N)
    private String wifi;

    //  (Y/N)
    private String smoking;

    //  (Y/N)
    private String pool;

    //  (Y/N)
    private String bbq;

    private String description;

    private String checkin;

    private String checkout;

    //  상세 주소
    private String addr;

    private String regDate;

    private List<RoomVO> rooms;
    
    
    
    public HotelVO() {
		super();
		// TODO Auto-generated constructor stub
	}
    
    

	public HotelVO(Integer no, Integer ownerNo, Integer cityNo, String name, String blind, Integer tel, String parking,
			String wifi, String smoking, String pool, String bbq, String description, String checkin, String checkout,
			String addr, List<RoomVO> rooms) {
		super();
		this.no = no;
		this.ownerNo = ownerNo;
		this.cityNo = cityNo;
		this.name = name;
		this.blind = blind;
		this.tel = tel;
		this.parking = parking;
		this.wifi = wifi;
		this.smoking = smoking;
		this.pool = pool;
		this.bbq = bbq;
		this.description = description;
		this.checkin = checkin;
		this.checkout = checkout;
		this.addr = addr;
		//this.regDate = regDate;
		this.rooms = rooms;
	}


/*
	public HotelVO(int i, int j, int k, String string, String string2, String string3, String string4, String string5,
			String string6, String string7, String string8, String string9, String string10, String string11,
			String string12, List<RoomVO> rooms2) {
		// TODO Auto-generated constructor stub
	}
*/


	public List<RoomVO> getRooms() {
		return rooms;
	}

	public void setRooms(List<RoomVO> rooms) {
		this.rooms = rooms;
	}

	public Integer getNo() {
        return no;
    }

    public void setNo(Integer no) {
        this.no = no;
    }

    public Integer getOwnerNo() {
        return ownerNo;
    }

    public void setOwnerNo(Integer ownerNo) {
        this.ownerNo = ownerNo;
    }

    public Integer getCityNo() {
        return cityNo;
    }

    public void setCityNo(Integer cityNo) {
        this.cityNo = cityNo;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBlind() {
        return blind;
    }

    public void setBlind(String blind) {
        this.blind = blind;
    }

    public Integer getTel() {
        return tel;
    }

    public void setTel(Integer tel) {
        this.tel = tel;
    }

    public String getParking() {
        return parking;
    }

    public void setParking(String parking) {
        this.parking = parking;
    }

    public String getWifi() {
        return wifi;
    }

    public void setWifi(String wifi) {
        this.wifi = wifi;
    }

    public String getSmoking() {
        return smoking;
    }

    public void setSmoking(String smoking) {
        this.smoking = smoking;
    }

    public String getPool() {
        return pool;
    }

    public void setPool(String pool) {
        this.pool = pool;
    }

    public String getBbq() {
        return bbq;
    }

    public void setBbq(String bbq) {
        this.bbq = bbq;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCheckin() {
        return checkin;
    }

    public void setCheckin(String checkin) {
        this.checkin = checkin;
    }

    public String getCheckout() {
        return checkout;
    }

    public void setCheckout(String checkout) {
        this.checkout = checkout;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "HotelVO [no=" + no + ", ownerNo=" + ownerNo + ", cityNo=" + cityNo + ", name=" + name + ", blind="
				+ blind + ", tel=" + tel + ", parking=" + parking + ", wifi=" + wifi + ", smoking=" + smoking
				+ ", pool=" + pool + ", bbq=" + bbq + ", description=" + description + ", checkin=" + checkin
				+ ", checkout=" + checkout + ", addr=" + addr + ", regDate=" + regDate + ", rooms=" + rooms + "]";
	}
	
    
}
