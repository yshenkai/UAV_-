package entity;

import java.util.Date;



public class Nofly_number {
	private Integer id;
	private String number;
	private Long intime;
	
	
	public Nofly_number(String number, Long intime) {
		super();
		this.number = number;
		this.intime = intime;
	}
	public Long getIntime() {
		return intime;
	}
	public void setIntime(Long intime) {
		this.intime = intime;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public Nofly_number(String number) {
		super();
		this.number = number;
	}
	public Nofly_number() {
		super();
	}
	
}
