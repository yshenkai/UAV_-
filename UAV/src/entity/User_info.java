package entity;

public class User_info {
	private Integer id;
	private String username;
	private String password;
	private String euq;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEuq() {
		return euq;
	}
	public void setEuq(String euq) {
		this.euq = euq;
	}
	public User_info(String username, String password, String euq) {
		super();
		this.username = username;
		this.password = password;
		this.euq = euq;
	}
	public User_info() {
		super();
	}
	
}
