package kr.green.springwebproject.dao;

/* DB에서 불러온 User 정보를 저장하기 위한 클래스 */
public class User {
	/* 각 멤버 변수는 DB에 있는 User관련 테이블(account)에
	 * 있는 속성명과 일치해야한다. */
	private String id;
	private String pw;
	private String email;
	private String admin;
	
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;
	}
	/* 멤버 변수에 접근하기 위한 getter와 setter */
	public String getId() {
		return id;
	}
	public String getPw() {
		return pw;
	}
	public String getEmail() {
		return email;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public void setEmail(String eamil) {
		this.email = eamil;
	}
	/* toString 메소드 오버라이딩 : System.out.println을 할 때
	 * 매개변수에 User 객체를 넘겨주면 toString이 호출되고 이때 원하는 
	 * 문자열을 찍기 위해 toString 메소드을 오버라이딩함 */
	@Override
	public String toString() {
		return "User [id=" + id + ", pw=" + pw + ", email=" + email + "]";
	}
}
