package bookcart;

public class MemberRegisterBean {
	private String user_id;
	private String pw;
	private String name;
	private String email;
	private String area1;
	private String area2;
	private String phone;
	
	public void setUser_id(String user_id) {
		this.user_id=user_id;
	}
	
	public void setPw(String pw) {
		this.pw=pw;
	}
	
	public void setName(String name) {
		this.name=name;
	}
	
	public void setEmail(String email) {
		this.email=email;
	}
	
	public void setArea1(String area1) {
		this.area1=area1;
	}
	
	public void setArea2(String area2) {
		this.area2=area2;
	}
	
	public void setPhone(String phone) {
		this.phone=phone;
	}
	
	public String getUser_id() {
		return user_id;
	}
	
	public String getPw() {
		return pw;
	}
	
	public String getName() {
		return name;
	}
	
	public String getEmail() {
		return email;
	}
	
	public String getArea1() {
		return area1;
	}
	
	public String getArea2() {
		return area2;
	}
	
	public String getPhone() {
		return phone;
	}
	

}
