package com.ssafy.edu.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssafy.edu.dto.BoolResult;
import com.ssafy.edu.dto.EatDto;
import com.ssafy.edu.dto.FoodDetailDto;
import com.ssafy.edu.dto.UserDto;
import com.ssafy.edu.service.IFoodDetailService;
import com.ssafy.edu.service.IFoodinfoService;

@Controller
public class FoodController {
	private static final Logger logger = LoggerFactory.getLogger(FoodController.class);
	@Autowired
	private IFoodinfoService iFoodinfoService;
	@Autowired
	private IFoodDetailService iFoodDetailService;
	
	@RequestMapping(value = "foodinfolist.do", method = RequestMethod.GET)
	public String foodinfolist(Model model) throws Exception{
		logger.debug("foodinfolist!"+new Date());
		model.addAttribute("foodinfos",iFoodinfoService.findAllFoods());
		return "main";
	}
	@RequestMapping(value = "getfooddetail.do",method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public FoodDetailDto getfooddetail(int food_code,Model model)throws Exception{
		logger.debug("getfooddetail!"+new Date());
		
		FoodDetailDto res = iFoodDetailService.findDetailByInt(food_code);
		return res;
	}
	@RequestMapping(value = "fooddetail.do",method = {RequestMethod.GET,RequestMethod.POST})
	public String fooddetail(int food_code,Model model)throws Exception{
		logger.debug("fooddetail!"+new Date());
		model.addAttribute("foodinfo",iFoodinfoService.findFoodInfoById(food_code));
		model.addAttribute("fooddetail",iFoodDetailService.findDetailByInt(food_code));
		model.addAttribute("allergy",iFoodinfoService.Allergy(food_code));
		return "productdetail";
	}
	@RequestMapping(value = "search.do",method = {RequestMethod.GET,RequestMethod.POST})
	   public String search(String s_category,String s_keyword,Model model) throws Exception{
	      logger.debug("search!"+new Date());
	      HashMap<String, String> map = new HashMap<>();
	      map.put("s_category", s_category);
	      map.put("s_keyword",s_keyword);
	      model.addAttribute("foodinfos",iFoodinfoService.searchFood(map));
	      model.addAttribute("s_category",s_category);
	      model.addAttribute("s_keyword",s_keyword);
	      return "main";
	   }
	@RequestMapping(value = "addEat.do",method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	   public BoolResult addEat(@ModelAttribute EatDto eatdto,Model model) throws Exception{
	      logger.debug("addEat!"+new Date());
	      BoolResult res = new BoolResult();
			try {
				iFoodinfoService.addEat(eatdto);
				res.setState("success");
			}catch(Exception e){
				logger.debug("Welcome UserController checkDuplicatePhone fail------------------! "+ new Date());
				res.setState("fail");
			}
	      return res;
	   }
	
	@RequestMapping(value = "getEatInfo.do",method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	   public List<EatDto> getEatInfo(int user_code,Model model) throws Exception{
	      logger.debug("getEatInfo!"+new Date());
	      List<EatDto> res = null;
			try {
				res = iFoodinfoService.getEatInfo(user_code);
			}catch(Exception e){
				logger.debug("Welcome UserController checkDuplicatePhone fail------------------! "+ new Date());
			}
	      return res;
	   }
	
	@RequestMapping(value = "deleteEatInfo.do",method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	   public String deleteEatInfo(@ModelAttribute EatDto eatdto,Model model) throws Exception{
	      logger.debug("addEat!"+new Date());
	      String res = "fail";
			try {
				iFoodinfoService.deleteEatInfo(eatdto);
				res = "success";
			}catch(Exception e){
				logger.debug("Welcome UserController checkDuplicatePhone fail------------------! "+ new Date());
				res = "fail";
			}
	      return res;
	   }
	@RequestMapping(value = "updateEatInfo.do",method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	   public String updateEatInfo(@ModelAttribute EatDto eatdto,Model model) throws Exception{
	      logger.debug("updateEatInfo!"+new Date());

	      String res = "fail";
			try {
				iFoodinfoService.updateEatInfo(eatdto);
				res = "success";
			}catch(Exception e){
				logger.debug("Welcome UserController checkDuplicatePhone fail------------------! "+ new Date());
				res = "fail";
			}
	      return res;
	 }
	@RequestMapping(value = "checkEat.do",method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	   public int checkEat(@ModelAttribute EatDto eatdto,Model model) throws Exception{
	      logger.debug("updateEatInfo!"+new Date());
	      int res = 0;
			try {
				res = iFoodinfoService.checkEat(eatdto);
			}catch(Exception e){
				logger.debug("Welcome UserController checkDuplicatePhone fail------------------! "+ new Date());
			}
	      return res;
	}
	@RequestMapping(value = "eatcal.do",method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public FoodDetailDto eatcal(@RequestParam int user_code,Model model)throws Exception{
		logger.debug("eatcal!"+new Date());
		FoodDetailDto res = iFoodinfoService.eatcal(user_code);
		return res;
	}
}
