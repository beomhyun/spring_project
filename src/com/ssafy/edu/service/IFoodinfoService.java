package com.ssafy.edu.service;
import java.util.HashMap;
import java.util.List;

import com.ssafy.edu.dto.EatDto;
import com.ssafy.edu.dto.FoodDetailDto;
import com.ssafy.edu.dto.FoodInfoDto;

public interface IFoodinfoService {
	/*boolean insertFoodInfo(FoodInfoDto dto);
	boolean updateFoodInfo(FoodInfoDto dto);
	boolean deleteFoodInfo(int seq);
	int makeFPK();*/
	
	FoodInfoDto findFoodInfoById(int food_code)throws Exception;
	List<FoodInfoDto> findAllFoods() throws Exception;
	List<FoodInfoDto> searchFood(HashMap<String, String> map) throws Exception;
	List<String> Allergy(int food_code)throws Exception;
	List<EatDto> getEatInfo(int user_code)throws Exception;
	void addEat(EatDto eat) throws Exception;
	void deleteEatInfo(EatDto eat)throws Exception;
	void updateEatInfo(EatDto eat)throws Exception;
	int checkEat(EatDto eat) throws Exception;
	FoodDetailDto eatcal(int user_code) throws Exception;
}
