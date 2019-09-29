package com.ssafy.edu.dto;

import java.io.Serializable;

public class FoodInfoDto implements Serializable{
	private int food_code;
	private String food_name;
	private String food_maker;
	private String food_material;
	private String food_img;
	public FoodInfoDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FoodInfoDto(int food_code, String food_name, String food_maker, String food_material,String food_img) {
		super();
		this.food_code = food_code;
		this.food_name = food_name;
		this.food_maker = food_maker;
		this.food_material = food_material;
		this.food_img = food_img;
	}
	@Override
	public String toString() {
		return "FoodDetail [num=" + food_code + ", name=" + food_name + ", maker=" + food_maker + ", material=" + food_material + ", img="+ food_img +"]";
	}
	public int getFood_code() {
		return food_code;
	}
	public void setFood_code(int food_code) {
		this.food_code = food_code;
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
	public String getFood_material() {
		return food_material;
	}
	public void setFood_material(String food_material) {
		this.food_material = food_material;
	}
	public String getFood_img() {
		return food_img;
	}
	public void setFood_img(String food_img) {
		this.food_img = food_img;
	}
}
