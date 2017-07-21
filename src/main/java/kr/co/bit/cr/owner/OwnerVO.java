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

	private String type;
		
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

	
	
	public OwnerVO(Integer no, String email, String password, String name, String phone, String crn, String regDate,
			String type) {
		super();
		this.no = no;
		this.email = email;
		this.password = password;
		this.name = name;
		this.phone = phone;
		this.crn = crn;
		this.regDate = regDate;
		this.type = type;
	}

	public Integer getNo() {
		return no;
	}

	public void setNo(Integer no) {
		this.no = no;
	}

	
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
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
		StringBuilder builder = new StringBuilder();
		builder.append("OwnerVO [no=");
		builder.append(no);
		builder.append(", email=");
		builder.append(email);
		builder.append(", password=");
		builder.append(password);
		builder.append(", name=");
		builder.append(name);
		builder.append(", phone=");
		builder.append(phone);
		builder.append(", crn=");
		builder.append(crn);
		builder.append(", regDate=");
		builder.append(regDate);
		builder.append(", type=");
		builder.append(type);
		builder.append("]");
		return builder.toString();
	}

	
}
