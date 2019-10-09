package entity;

import java.io.Serializable;

public class Ad_uva_list implements Serializable{
	private Integer id;
	private String User;
	private String Euq;
	private Float Pit;
	private Float Row;
	private Float Yaw;
	private Double Lon;
	private Double Lat;
	private Float Alt;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUser() {
		return User;
	}
	public void setUser(String user) {
		User = user;
	}
	public String getEuq() {
		return Euq;
	}
	public void setEuq(String euq) {
		Euq = euq;
	}
	public Float getPit() {
		return Pit;
	}
	public void setPit(Float pit) {
		Pit = pit;
	}
	public Float getRow() {
		return Row;
	}
	public void setRow(Float row) {
		Row = row;
	}
	public Float getYaw() {
		return Yaw;
	}
	public void setYaw(Float yaw) {
		Yaw = yaw;
	}
	public Double getLon() {
		return Lon;
	}
	public void setLon(Double lon) {
		Lon = lon;
	}
	public Double getLat() {
		return Lat;
	}
	public void setLat(Double lat) {
		Lat = lat;
	}
	public Float getAlt() {
		return Alt;
	}
	public void setAlt(Float alt) {
		Alt = alt;
	}
	public Ad_uva_list(String user, String euq, Float pit, Float row, Float yaw, Double lon, Double lat, Float alt) {
		super();
		User = user;
		Euq = euq;
		Pit = pit;
		Row = row;
		Yaw = yaw;
		Lon = lon;
		Lat = lat;
		Alt = alt;
	}
	public Ad_uva_list() {
		super();
	}
	public Ad_uva_list(String user, Float pit, Float row, Float yaw, Double lon, Double lat, Float alt) {
		super();
		User = user;
		Pit = pit;
		Row = row;
		Yaw = yaw;
		Lon = lon;
		Lat = lat;
		Alt = alt;
	}
	
}
