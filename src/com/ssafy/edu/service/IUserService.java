package com.ssafy.edu.service;

import java.util.List;

import com.ssafy.edu.dto.UserAllergyDto;
import com.ssafy.edu.dto.UserDto;



public interface IUserService {
	void insertUser(UserDto dto);
	void updateUser(UserDto dto);
	void deleteUser(int user_code);
	List<UserDto> findAllUsers();
	int makeUPK();
	UserDto findUserById(String id);
	
	void insertUser_allergy(UserAllergyDto dto);
	void deleteUser_allergy(int user_code);
	List<UserAllergyDto> findUser_allergy(int user_code);
	
	int findAllergyCodeByName(String allergy_name);
	
	UserDto login(UserDto dto);
	UserDto findId(UserDto userdto);
	UserDto findPw(UserDto userdto);
	String checkDuplicateId(String userid);
	String checkDuplicatePhone(String userphone);
	
	// 아직 user.xml에 구현 안했어
/*	void insertUser_allergy(int ucode, String allergys);
	String searchUser_allergy(int ucode);*/
}
