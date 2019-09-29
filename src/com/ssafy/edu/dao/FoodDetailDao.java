package com.ssafy.edu.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.edu.dto.FoodDetailDto;

@Repository
public class FoodDetailDao {
	String ns = "com.ssafy.edu.foodnutrition.";
	
	@Autowired
	private SqlSession sqlSession;

	public FoodDetailDto findDetailByInt(int food_code) {
		return sqlSession.selectOne(ns+"selectnutrition",food_code);
	}
}
