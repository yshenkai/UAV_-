package entity;

import java.io.Serializable;

public class Ad_info implements Serializable{
	private Integer id;
	private String adminname;
	private String password;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getAdminname() {
		return adminname;
	}
	public void setAdminname(String adminname) {
		this.adminname = adminname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Ad_info(String adminname, String password) {
		super();
		this.adminname = adminname;
		this.password = password;
	}
	public Ad_info() {
		super();
	}
	
}
