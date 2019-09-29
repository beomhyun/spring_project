package com.ssafy.edu.service;

import com.ssafy.edu.dto.FoodDetailDto;

public interface IFoodDetailService {
	/*boolean insertDetail(FoodDetailDto dto);
	boolean updateDetail(FoodDetailDto dto);
	boolean deleteDetail(String name);*/
	
	FoodDetailDto findDetailByInt(int num) throws Exception;
}
