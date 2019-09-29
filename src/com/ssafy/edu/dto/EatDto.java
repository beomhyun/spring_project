package com.ssafy.edu.dto;

import java.io.Serializable;

public class EatDto implements Serializable{
	private int user_code;
	private int food_code;
	private int quantity;
	private String food_name;
	private String food_maker;
	private String food_img;
	public EatDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public EatDto(int user_code, int food_code, int quantity, String food_name, String food_maker, String food_img) {
		super();
		this.user_code = user_code;
		this.food_code = food_code;
		this.quantity = quantity;
		this.food_name = food_name;
		this.food_maker = food_maker;
		this.food_img = food_img;
	}
	@Override
	public String toString() {
		return "EatDto [user_code=" + user_code + ", food_code=" + food_code + ", quantity=" + quantity + ", food_name="
				+ food_name + ", food_maker=" + food_maker + ", food_img=" + food_img + "]";
	}
	public int getUser_code() {
		return user_code;
	}
	public void setUser_code(int user_code) {
		this.user_code = user_code;
	}
	public int getFood_code() {
		return food_code;
	}
	public void setFood_code(int food_code) {
		this.food_code = food_code;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getFood_name() {
		return food_name;
	}
	public void setFood_name(String food_name) {
		this.food_name = food_name;
	}
	public String getFood_maker() {
		return food_maker;
	}
	public void setFood_maker(String food_maker) {
		this.food_maker = food_maker;
	}
	public String getFood_img() {
		return food_img;
	}
	public void setFood_img(String food_img) {
		this.food_img = food_img;
	}
	
}
