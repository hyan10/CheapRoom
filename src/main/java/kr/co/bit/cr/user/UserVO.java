package kr.co.bit.cr.user;

public class UserVO {

    private Integer no;

    private String email;

    private String password;

    //  일반/관리자 (U/S)
    private String type;

    private String name;

    private String phone;

    private String regDate;
    
    public UserVO() {
		// TODO Auto-generated constructor stub
	}
    public UserVO(String email, String password) {
		super();
		this.email = email;
		this.password = password;
	}
    
    public UserVO(String email, String password, String type, String name, String phone) {
		super();
		this.email = email;
		this.password = password;
		this.type = type;
		this.name = name;
		this.phone = phone;
	}
	public UserVO(String email, String password, String name, String phone) {
		this.email = email;
		this.password = password;
		this.name = name;
		this.phone = phone;
	}
	public UserVO(Integer no, String email, String password, String type, String name, String phone, String regDate) {
		super();
		this.no = no;
		this.email = email;
		this.password = password;
		this.type = type;
		this.name = name;
		this.phone = phone;
		this.regDate = regDate;
	}

	public Integer getNo() {
        return no;
    }

    public void setNo(Integer no) {
        this.no = no;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getRegDate() {
        return regDate;
    }

    public void setRegDate(String regDate) {
        this.regDate = regDate;
    }

	@Override
	public String toString() {
		return "UserVO [no=" + no + ", email=" + email + ", password=" + password + ", type=" + type + ", name=" + name
				+ ", phone=" + phone + ", regDate=" + regDate + "]";
	}
    
}
