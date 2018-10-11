package com.freight.pojo;

public class Freight {
	private String f_name;
	private String f_name_code;
	private String f_from_city;
	private Double f_from_longitude;
	private Double f_from_latitude;
	private String f_to_city;
	private Double f_to_longitude;
	private Double f_to_latitude;
	private String f_total;
	private Integer f_truck_num;
	private Double f_ton;
	
	public Freight() {
		
	}
	
	public Freight( String f_name, String f_name_code, String f_from_city, Double f_from_longitude,
			Double f_from_latitude, String f_to_city, Double f_to_longitude, Double f_to_latitude, String f_total,
			Integer f_truck_num, Double f_ton) {
		this.f_name = f_name;
		this.f_name_code = f_name_code;
		this.f_from_city = f_from_city;
		this.f_from_longitude = f_from_longitude;
		this.f_from_latitude = f_from_latitude;
		this.f_to_city = f_to_city;
		this.f_to_longitude = f_to_longitude;
		this.f_to_latitude = f_to_latitude;
		this.f_total = f_total;
		this.f_truck_num = f_truck_num;
		this.f_ton = f_ton;
	}

	public String getF_name() {
		return f_name;
	}
	public void setF_name(String f_name) {
		this.f_name = f_name;
	}
	public String getF_name_code() {
		return f_name_code;
	}
	public void setF_name_code(String f_name_code) {
		this.f_name_code = f_name_code;
	}
	public String getF_from_city() {
		return f_from_city;
	}
	public void setF_from_city(String f_from_city) {
		this.f_from_city = f_from_city;
	}
	public Double getF_from_longitude() {
		return f_from_longitude;
	}
	public void setF_from_longitude(Double f_from_longitude) {
		this.f_from_longitude = f_from_longitude;
	}
	public Double getF_from_latitude() {
		return f_from_latitude;
	}
	public void setF_from_latitude(Double f_from_latitude) {
		this.f_from_latitude = f_from_latitude;
	}
	public String getF_to_city() {
		return f_to_city;
	}
	public void setF_to_city(String f_to_city) {
		this.f_to_city = f_to_city;
	}
	public Double getF_to_longitude() {
		return f_to_longitude;
	}
	public void setF_to_longitude(Double f_to_longitude) {
		this.f_to_longitude = f_to_longitude;
	}
	public Double getF_to_latitude() {
		return f_to_latitude;
	}
	public void setF_to_latitude(Double f_to_latitude) {
		this.f_to_latitude = f_to_latitude;
	}
	public String getF_total() {
		return f_total;
	}
	public void setF_total(String f_total) {
		this.f_total = f_total;
	}
	public Integer getF_truck_num() {
		return f_truck_num;
	}
	public void setF_truck_num(Integer f_truck_num) {
		this.f_truck_num = f_truck_num;
	}
	public Double getF_ton() {
		return f_ton;
	}
	public void setF_ton(Double f_ton) {
		this.f_ton = f_ton;
	}
}
