package com.ssafy.edu.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.edu.dao.FoodInfoDao;
import com.ssafy.edu.dto.EatDto;
import com.ssafy.edu.dto.FoodDetailDto;
import com.ssafy.edu.dto.FoodInfoDto;

@Service
public class FoodInfoService implements IFoodinfoService{
	@Autowired
	private FoodInfoDao foodinfoDao;
	
	@Override
	@Transactional(readOnly=true)
	public FoodInfoDto findFoodInfoById(int food_code) {
		return foodinfoDao.getFoodInfoById(food_code);
	}
	@Override
	@Transactional(readOnly=true)
	public List<FoodInfoDto> findAllFoods() throws Exception{
		return foodinfoDao.getFoodInfolist();
	}
	@Override
	@Transactional(readOnly=true)
	public List<FoodInfoDto> searchFood(HashMap<String, String> map) throws Exception{
		return foodinfoDao.searchFood(map);
	}
	@Override
	@Transactional(readOnly=true)
	public List<String> Allergy(int seq) {
		return foodinfoDao.getAllergy(seq);
	}
	@Override
	@Transactional(readOnly=true)
	public List<EatDto> getEatInfo(int user_code) throws Exception {
		return foodinfoDao.getEatInfo(user_code);
		}
	@Override
	@Transactional
	public void addEat(EatDto eat) throws Exception {
		foodinfoDao.addEat(eat);
	}
	@Override
	@Transactional
	public void deleteEatInfo(EatDto eat) throws Exception {
		foodinfoDao.deleteEatInfo(eat);
	}
	@Override
	@Transactional
	public void updateEatInfo(EatDto eat) throws Exception {
		foodinfoDao.updateEatInfo(eat);
	}
	@Override
	@Transactional(readOnly=true)
	public int checkEat(EatDto eat) throws Exception {
		return foodinfoDao.checkEat(eat);
	}
	@Override
	@Transactional(readOnly=true)
	public FoodDetailDto eatcal(int user_code) throws Exception {
		return foodinfoDao.eatcal(user_code);
	}
}
