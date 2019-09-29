package com.ssafy.edu.dto;

import java.io.Serializable;

public class FoodDetailDto implements Serializable{
	private int food_code;
	private double daily;
	private double calorie;
	private double carbohydrate;
	private double protein;
	private double fat;
	private double sugars;
	private double salt;
	private double cholesterol;
	private double fatty_acid;
	private double trans_fat;
	public FoodDetailDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public FoodDetailDto(int food_code, double d, double calorie, double carbohydrate, double protein, double fat,
			double sugars, double salt, double cholesterol, double fatty_acid, double trans_fat) {
		super();
		this.food_code = food_code;
		this.daily = d;
		this.calorie = calorie;
		this.carbohydrate = carbohydrate;
		this.protein = protein;
		this.fat = fat;
		this.sugars = sugars;
		this.salt = salt;
		this.cholesterol = cholesterol;
		this.fatty_acid = fatty_acid;
		this.trans_fat = trans_fat;
	}

	@Override
	public String toString() {
		return "FoodDetail [code=" + food_code + ", daily=" + daily + ", calorie=" + calorie + ", carbohydrate="
				+ carbohydrate + ", protein=" + protein + ", fat=" + fat + ", sugars=" + sugars + ", salt=" + salt
				+ ", cholesterol=" + cholesterol + ", fatty_acid=" + fatty_acid + ", trans_fat=" + trans_fat + "]";
	}
	public int getFood_code() {
		return food_code;
	}

	public void setFood_code(int food_code) {
		this.food_code = food_code;
	}

	public double getDaily() {
		return daily;
	}

	public void setDaily(int daily) {
		this.daily = daily;
	}

	public double getCalorie() {
		return calorie;
	}

	public void setCalorie(double calorie) {
		this.calorie = calorie;
	}

	public double getCarbohydrate() {
		return carbohydrate;
	}

	public void setCarbohydrate(double carbohydrate) {
		this.carbohydrate = carbohydrate;
	}

	public double getProtein() {
		return protein;
	}

	public void setProtein(double protein) {
		this.protein = protein;
	}

	public double getFat() {
		return fat;
	}

	public void setFat(double fat) {
		this.fat = fat;
	}

	public double getSugars() {
		return sugars;
	}

	public void setSugars(double sugars) {
		this.sugars = sugars;
	}

	public double getSalt() {
		return salt;
	}

	public void setSalt(double salt) {
		this.salt = salt;
	}

	public double getCholesterol() {
		return cholesterol;
	}

	public void setCholesterol(double cholesterol) {
		this.cholesterol = cholesterol;
	}

	public double getFatty_acid() {
		return fatty_acid;
	}

	public void setFatty_acid(double fatty_acid) {
		this.fatty_acid = fatty_acid;
	}

	public double getTrans_fat() {
		return trans_fat;
	}

	public void setTrans_fat(double trans_fat) {
		this.trans_fat = trans_fat;
	}
	
}
