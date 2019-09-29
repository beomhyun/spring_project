package com.ssafy.edu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.edu.dao.UserDao;
import com.ssafy.edu.dto.UserAllergyDto;
import com.ssafy.edu.dto.UserDto;


@Service
public class UserServiceImpl implements IUserService{

	@Autowired
	private UserDao userDao;
	
	
	@Override
	@Transactional
	public void insertUser(UserDto dto) {
		userDao.insertUser(dto);
	}

	@Override
	@Transactional
	public void updateUser(UserDto dto) {
		userDao.updateUser(dto);
	}

	@Override
	@Transactional
	public void deleteUser(int user_code) {
		userDao.deleteUser(user_code);
	}

	// 현재 쓰이는 곳은 없음
	@Override
	@Transactional(readOnly=true)
	public List<UserDto> findAllUsers() {
		return userDao.findAllUsers();
	}

	@Override
	@Transactional(readOnly=true)
	public int makeUPK() {
		return userDao.makeUPK();
	}

	@Override
	@Transactional(readOnly=true)
	public UserDto findUserById(String id) {
		return userDao.findUserById(id);
	}


	@Override
	@Transactional
	public void insertUser_allergy(UserAllergyDto dto) {
		userDao.insertUser_allergy(dto);
	}

	@Override
	@Transactional(readOnly=true)
	public int findAllergyCodeByName(String allergy_name) {
		return userDao.findAllergyCodeByName(allergy_name);
	}

	@Override
	@Transactional(readOnly=true)
	public UserDto login(UserDto dto) {
		return userDao.login(dto);
	}

	@Override
	@Transactional
	public void deleteUser_allergy(int user_code) {
		userDao.deleteUser_allergy(user_code);
		
	}

	@Override
	@Transactional(readOnly=true)
	public List<UserAllergyDto> findUser_allergy(int user_code) {
		return userDao.findUser_allergy(user_code);
	}

	@Override
	@Transactional(readOnly=true)
	public UserDto findId(UserDto userdto) {
		return userDao.findId(userdto);
	}

	@Override
	@Transactional(readOnly=true)
	public UserDto findPw(UserDto userdto) {
		return userDao.findPw(userdto);
	}

	@Override
	@Transactional(readOnly=true)
	public String checkDuplicateId(String userid) {
		return userDao.checkDuplicateId(userid);
	}

	@Override
	@Transactional(readOnly=true)
	public String checkDuplicatePhone(String userphone) {
		return userDao.checkDuplicatePhone(userphone);
	}
	
}
