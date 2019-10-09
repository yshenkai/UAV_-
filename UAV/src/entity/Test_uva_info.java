package entity;

public class Test_uva_info {
	private Integer id;
	private String username;
	private String startime;
	private String endtime;
	private Double startLon;
	private Double startLat;
	private Double endLon;
	private Double endLat;
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
	public String getStartime() {
		return startime;
	}
	public void setStartime(String startime) {
		this.startime = startime;
	}
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	public Double getStartLon() {
		return startLon;
	}
	public void setStartLon(Double startLon) {
		this.startLon = startLon;
	}
	public Double getStartLat() {
		return startLat;
	}
	public void setStartLat(Double startLat) {
		this.startLat = startLat;
	}
	public Double getEndLon() {
		return endLon;
	}
	public void setEndLon(Double endLon) {
		this.endLon = endLon;
	}
	public Double getEndLat() {
		return endLat;
	}
	public void setEndLat(Double endLat) {
		this.endLat = endLat;
	}
	public Test_uva_info(String username, String startime, String endtime, Double startLon, Double startLat, Double endLon, Double endLat) {
		super();
		this.username = username;
		this.startime = startime;
		this.endtime = endtime;
		this.startLon = startLon;
		this.startLat = startLat;
		this.endLon = endLon;
		this.endLat = endLat;
	}
	public Test_uva_info() {
		super();
	}
	
}	
