package kr.co.bit.cr.owner;

public class OwnerVO {
	private Integer no;

	private String email;

	private String password;

	private String name;

	private String phone;

	// 사업자등록번호
	private String crn;

	private String regDate;

	public OwnerVO() {
		// TODO Auto-generated constructor stub
	}
	
	public OwnerVO(String email, String password) {
		this.email = email;
		this.password = password;
	}

	public OwnerVO(String email, String password, String name, String phone, String crn) {
		this.email = email;
		this.password = password;
		this.name = name;
		this.phone = phone;
		this.crn = crn;
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

	

	public String getCrn() {
		return crn;
	}

	public void setCrn(String crn) {
		this.crn = crn;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "OwnerVO [no=" + no + ", email=" + email + ", password=" + password + ", name=" + name + ", phone="
				+ phone + ", crn=" + crn + ", regDate=" + regDate + "]";
	}

	
}
