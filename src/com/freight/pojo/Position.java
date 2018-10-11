package com.freight.pojo;

public class Position {
	double lng;
	double lat;
	
	public double getLng() {
		return lng;
	}

	public void setLng(double lng) {
		this.lng = lng;
	}

	public double getLat() {
		return lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public Position() {
		
	}
	public Position(double lng, double lat) {
		super();
		this.lng = lng;
		this.lat = lat;
	}
}
