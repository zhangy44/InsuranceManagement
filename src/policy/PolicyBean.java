package policy;

public class PolicyBean {
	private String id;
	private String type;
	private String name;
	private int price;
	private int duration;
	private int yearInterest;
	public PolicyBean() {
		
	}
	public PolicyBean(String id, String type, String name, int price, int duration , int yi) {
		super();
		this.id = id;
		this.type = type;
		this.name = name;
		this.price = price;
		this.duration = duration;
		this.yearInterest = yi;
	}
	public PolicyBean(String type, String name, int price, int duration , int yi) {
		super();
		this.type = type;
		this.name = name;
		this.price = price;
		this.duration = duration;
		this.yearInterest = yi;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getDuration() {
		return duration;
	}
	public void setDuration(int duration) {
		this.duration = duration;
	}
	public int getYearInterest() {
		return yearInterest;
	}
	public void setYearInterest(int yearInterest) {
		this.yearInterest = yearInterest;
	}
	@Override
	public String toString() {
		return "PolicyBean [id=" + id + ", type=" + type + ", name=" + name + ", price=" + price + ", duration="
				+ duration + ", yearInterest=" + yearInterest + "]";
	}
	
}
