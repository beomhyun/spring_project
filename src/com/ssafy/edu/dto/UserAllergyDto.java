package com.ssafy.edu.dto;

import java.io.Serializable;

public class UserAllergyDto implements Serializable{
	
	private int user_code;
	private int allergy_code;
	private String allergy_name;
	public UserAllergyDto() {
		super();
	}
	public UserAllergyDto(int user_code, int allergy_code) {
		super();
		this.user_code = user_code;
		this.allergy_code = allergy_code;

	}
	@Override
	public String toString() {
		return "UserAllergyDto [user_code=" + user_code + ", allergy_code=" + allergy_code + ", allergy_name="
				+ allergy_name + "]";
	}
	public int getUser_code() {
		return user_code;
	}
	public void setUser_code(int user_code) {
		this.user_code = user_code;
	}
	public int getAllergy_code() {
		return allergy_code;
	}
	public void setAllergy_code(int allergy_code) {
		this.allergy_code = allergy_code;
	}
	public String getAllergy_name() {
		return allergy_name;
	}
	public void setAllergy_name(String allergy_name) {
		this.allergy_name = allergy_name;
	}
	
	
}
