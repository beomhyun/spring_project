package com.ssafy.edu.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.edu.dto.EatDto;
import com.ssafy.edu.dto.FoodDetailDto;
import com.ssafy.edu.dto.FoodInfoDto;

@Repository
public class FoodInfoDao {
	String ns="com.ssafy.edu.foodinfo.";
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<FoodInfoDto> getFoodInfolist() throws Exception{
		return sqlSession.selectList(ns+"getFoodInfolist");
	}

	public FoodInfoDto getFoodInfoById(int food_code) {
		return sqlSession.selectOne(ns+"getFoodInfoById",food_code);
	}

	public List<FoodInfoDto> searchFood(HashMap<String, String> map) {
		return sqlSession.selectList(ns+"searchFood",map);
	}

	public List<String> getAllergy(int food_code) {
		return sqlSession.selectList(ns+"allergy",food_code);
	}
	
	
	public List<EatDto> getEatInfo(int user_code){
		return sqlSession.selectList(ns+"getEatInfo",user_code);
	}
	public void addEat(EatDto eat) {
		sqlSession.insert(ns+ "addEat", eat);
	}
	public void deleteEatInfo(EatDto eat) {
		sqlSession.delete(ns+"deleteEatInfo",eat);
	}
	public void updateEatInfo(EatDto eat) {
		sqlSession.update(ns+"updateEatInfo", eat);
	}
	public int checkEat(EatDto eat) {
		return sqlSession.selectOne(ns+"checkEat",eat);
	}
	public FoodDetailDto eatcal(int user_code) {
		return sqlSession.selectOne(ns+"eatcal",user_code);
	}
}
