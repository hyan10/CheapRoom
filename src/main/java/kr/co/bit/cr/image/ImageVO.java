package kr.co.bit.cr.image;


public class ImageVO {
	private int no;
	private int roomNo;
	private String url;
	
	
	
	public ImageVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public ImageVO(int no, int roomNo, String url) {
		super();
		this.no = no;
		this.roomNo = roomNo;
		this.url = url;
	}

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getRoomNo() {
		return roomNo;
	}
	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	@Override
	public String toString() {
		return "ImageVO [no=" + no + ", roomNo=" + roomNo + ", url=" + url + "]";
	}
	
	
}
