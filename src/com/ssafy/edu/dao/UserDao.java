package com.ssafy.edu.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.edu.dto.UserAllergyDto;
import com.ssafy.edu.dto.UserDto;


@Repository
public class UserDao {
	String ns ="com.ssafy.edu.";
	
	@Autowired
	private SqlSession sqlSession;

	public void insertUser(UserDto dto) {
		sqlSession.insert(ns+"insertUser",dto);
	}

	public void updateUser(UserDto dto) {
		sqlSession.update(ns+"updateUser",dto);
	}

	public void deleteUser(int user_code) {
		sqlSession.delete(ns+"deleteUser",user_code);
	}

	public List<UserDto> findAllUsers() {
		return sqlSession.selectList(ns+"findAllUsers");
	}

	public int makeUPK() {
		return sqlSession.selectOne(ns+"makeUPK");
	}

	public UserDto findUserById(String id) {
		return sqlSession.selectOne(ns+"findUserById",id);
	}

	public void insertUser_allergy(UserAllergyDto dto) {
		sqlSession.insert(ns+"insertUser_allergy",dto);
	}

	public int findAllergyCodeByName(String allergy_name) {
		return sqlSession.selectOne(ns+"findAllergyCodeByName",allergy_name);
	}

	public UserDto login(UserDto dto) {
		return sqlSession.selectOne(ns+"login",dto);
	}

	public void deleteUser_allergy(int user_code) {
		sqlSession.delete(ns+"deleteUser_allergy",user_code);
	}

	public List<UserAllergyDto> findUser_allergy(int user_code) {
		return sqlSession.selectList(ns+"findUser_allergy",user_code);
	}

	public UserDto findId(UserDto userdto) {
		return sqlSession.selectOne(ns+"findId",userdto);
	}

	public UserDto findPw(UserDto userdto) {
		return sqlSession.selectOne(ns+"findPw",userdto);
	}

	public String checkDuplicateId(String userid) {
		return sqlSession.selectOne(ns+"checkDuplicateId",userid);
	}

	public String checkDuplicatePhone(String userphone) {
		return sqlSession.selectOne(ns+"checkDuplicatePhone",userphone);
	}


}
