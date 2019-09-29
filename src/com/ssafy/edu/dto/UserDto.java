package com.ssafy.edu.dto;

import java.io.Serializable;
import java.util.List;

public class UserDto implements Serializable{
	private static final long serialVersionUID = 637723243193970601L;
	private int user_code;
	private String user_id;
	private String user_pwd;
	private String user_name;
	private String user_address;
	private String user_phone;
	private List<UserAllergyDto> user_allergy;
	private int user_isadmin = 1;
	public UserDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public UserDto(int user_code, String user_id, String user_pwd, String user_name, String user_address,
			String user_phone) {
		super();
		this.user_code = user_code;
		this.user_id = user_id;
		this.user_pwd = user_pwd;
		this.user_name = user_name;
		this.user_address = user_address;
		this.user_phone = user_phone;
	}
	public UserDto(int user_code, String user_id, String user_pwd, String user_name, String user_address,
			String user_phone, List<UserAllergyDto> user_allergy, int user_isadmin) {
		super();
		this.user_code = user_code;
		this.user_id = user_id;
		this.user_pwd = user_pwd;
		this.user_name = user_name;
		this.user_address = user_address;
		this.user_phone = user_phone;
		this.user_allergy = user_allergy;
		this.user_isadmin = user_isadmin;
	}
	@Override
	public String toString() {
		return "UserDto [user_code=" + user_code + ", user_id=" + user_id + ", user_pwd=" + user_pwd + ", user_name="
				+ user_name + ", user_address=" + user_address + ", user_phone=" + user_phone + ", user_allergy="
				+ user_allergy + ", user_isadmin=" + user_isadmin + "]";
	}
	public int getUser_code() {
		return user_code;
	}
	public void setUser_code(int user_code) {
		this.user_code = user_code;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pwd() {
		return user_pwd;
	}
	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_address() {
		return user_address;
	}
	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public List<UserAllergyDto> getUser_allergy() {
		return user_allergy;
	}
	public void setUser_allergy(List<UserAllergyDto> user_allergy) {
		this.user_allergy = user_allergy;
	}
	public int getUser_isadmin() {
		return user_isadmin;
	}
	public void setUser_isadmin(int user_isadmin) {
		this.user_isadmin = user_isadmin;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	

	
}
