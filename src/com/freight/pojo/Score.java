package com.freight.pojo;

public class Score {
	public String name;
	public double num;
	
	
	public Score() {
		
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getNum() {
		return num;
	}

	public void setNum(double num) {
		this.num = num;
	}

	public Score(String name, double num) {
		super();
		this.name = name;
		this.num = num;
	}
	
	
	
}
