package com.ssafy.edu.controller;

import java.util.Date;

import javax.servlet.http.HttpSession;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ssafy.edu.dto.UserAllergyDto;
import com.ssafy.edu.dto.UserDto;
import com.ssafy.edu.service.IUserService;

@Controller
public class UserController {
	private static final Logger logger = 
			LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private IUserService iUserService;
	
	@RequestMapping(value = "signupbf.do",method={RequestMethod.GET,RequestMethod.POST})
	public String signupbf(Model model) throws Exception{
		logger.debug("signupbf!"+new Date());
		int a = iUserService.makeUPK();    
		model.addAttribute("pk",a);
		return "signUp";
	}
	
	@RequestMapping(value = "signup.do", 
			method = {RequestMethod.GET,RequestMethod.POST})
	public String signup(int _upk,String _uid,String _upwd,String _uname,String _uaddress,String _uphone,@RequestParam(value="_uallergy", required=false) String[] _uallergy, Model model) throws Exception {
		logger.debug("Welcome UserController signup------------------! "+ new Date());
		
		logger.debug(_upk+" "+_uid+" "+_upwd+" "+_uname+" "+_uaddress+" "+_uphone);
		try {
			iUserService.insertUser(new UserDto(_upk,_uid,_upwd,_uname,_uaddress,_uphone));
			if(_uallergy != null) {
				for (String string : _uallergy) {
					int acode = iUserService.findAllergyCodeByName(string);
					iUserService.insertUser_allergy(new UserAllergyDto(_upk, acode));
				}
			}
		}catch(Exception e){
			logger.debug("Welcome UserController signup fail------------------! "+ new Date());
			
		}
		return "redirect:foodinfolist.do";
	}//	
	@RequestMapping(value = "main.do", method = RequestMethod.GET)
	public String main(Model model) {
		logger.debug("main!"+new Date());
		return "redirect:foodinfolist.do";
	}
	
	@RequestMapping(value = "login.do", 
			method = {RequestMethod.GET,RequestMethod.POST})
	public String login(@ModelAttribute UserDto userdto, Model model, HttpSession session) throws Exception {
		logger.debug("Welcome UserController login------------------! "+ new Date());
		try {
			UserDto logindto = iUserService.login(userdto);
			
			
			if(logindto != null) {
				// 로그인 성공
				session.setAttribute("login", logindto);
				session.setMaxInactiveInterval(10*60);
			}else if(logindto == null) {
				///////////////////////로그인 실패 처리 추가 구현!!///////////////////////////////
				model.addAttribute("msg","로그인 실패");
			}
		}catch(Exception e){
			logger.debug("Welcome UserController login fail------------------! "+ new Date());
		}
		return "redirect:/foodinfolist.do";
	}//
	
	@RequestMapping(value = "logout.do", 
			method = {RequestMethod.GET,RequestMethod.POST})
	public String logout(@ModelAttribute UserDto userdto, Model model, HttpSession session) throws Exception {
		logger.debug("Welcome UserController logout------------------! "+ new Date());
		session.invalidate();
		return "redirect:foodinfolist.do";
	}//
	
	@RequestMapping(value = "userdetail.do", 
			method = {RequestMethod.GET,RequestMethod.POST})
	public String userdetail(String user_id, Model model) throws Exception {
		logger.debug("Welcome UserController userdetail------------------! "+ new Date());
		try {
			UserDto user = iUserService.findUserById(user_id);
			model.addAttribute("user", user);
			model.addAttribute("allergy",iUserService.findUser_allergy(user.getUser_code()));
		}catch(Exception e){
			logger.debug("Welcome UserController userdetail fail------------------! "+ new Date());
		}
		return "editMember_2";
	}//
	
	@RequestMapping(value = "delete.do", 
			method = {RequestMethod.GET,RequestMethod.POST})
	public String delete(int user_code, Model model) throws Exception {
		logger.debug("Welcome UserController delete------------------! "+ new Date());
		try {
			iUserService.deleteUser(user_code);
			
		}catch(Exception e){
			logger.debug("Welcome UserController delete fail------------------! "+ new Date());
		}
		return "redirect:/logout.do";
	}//
	
	@RequestMapping(value = "update.do", 
			method = {RequestMethod.GET,RequestMethod.POST})
	public String update(@ModelAttribute UserDto userdto, @RequestParam(value="_uallergy", required=false) String[] _uallergy, Model model, HttpSession session) throws Exception {
		logger.debug("Welcome UserController update------------------! "+ new Date());
		try {
			iUserService.updateUser(userdto);
			iUserService.deleteUser_allergy(userdto.getUser_code());
			//UserDto newUser = iUserService.findUserById(userdto.getUser_id());
			if(_uallergy != null) {
				for (String string : _uallergy) {
					int acode = iUserService.findAllergyCodeByName(string);
					iUserService.insertUser_allergy(new UserAllergyDto(userdto.getUser_code(), acode));
				}
			}
			session.setAttribute("login", userdto);

		}catch(Exception e){
			logger.debug("Welcome UserController update fail------------------! "+ new Date());

		}
		return "redirect:foodinfolist.do";
	}//
	
	@RequestMapping(value = "goqna.do",method=RequestMethod.GET)
	   public String goqna(Model model) throws Exception{
	      return "qna";
	   }
	
	
	@RequestMapping(value = "findaccount.do", method = RequestMethod.GET)
	public String findaccount(Model model) {
		logger.debug("findaccount!"+new Date());
		return "findAccount";
	}
	@RequestMapping(value = "ajlogin.do", 
			method = {RequestMethod.POST})
	@ResponseBody
	public UserDto ajlogin(@ModelAttribute UserDto userdto, Model model,HttpSession session) throws Exception {
		logger.debug("Welcome UserController findId------------------! "+ new Date());
		UserDto logindto = null;
		try {
			logindto = iUserService.login(userdto);
			logindto.setUser_allergy(iUserService.findUser_allergy(logindto.getUser_code()));
			if(logindto != null) {
				// 로그인 성공
				session.setAttribute("login", logindto);
				session.setMaxInactiveInterval(10*60);
			}else if(logindto == null) {
				///////////////////////로그인 실패 처리 추가 구현!!///////////////////////////////
				model.addAttribute("msg","로그인 실패");
			}
		}catch(Exception e){
			logger.debug("Welcome UserController login fail------------------! "+ new Date());
		}
		return logindto;
	}//
	
	@RequestMapping(value = "findId.do", 
			method = {RequestMethod.POST})
	@ResponseBody
	public UserDto findId(@ModelAttribute UserDto userdto, Model model) throws Exception {
		logger.debug("Welcome UserController findId------------------! "+ new Date());
		UserDto user = null;
		try {
			user = iUserService.findId(userdto);
		}catch(Exception e){
			logger.debug("Welcome UserController findId fail------------------! "+ new Date());
		}
		return user;
	}//
	
	@RequestMapping(value = "findPw.do", 
			method = {RequestMethod.POST})
	@ResponseBody
	public UserDto findPw(@ModelAttribute UserDto userdto, Model model) throws Exception {
		logger.debug("Welcome UserController findPw------------------! "+ new Date());
		UserDto user = null;
		try {
			user = iUserService.findPw(userdto);
		}catch(Exception e){
			logger.debug("Welcome UserController findPw fail------------------! "+ new Date());
		}
		return user;
	}//
	
	@RequestMapping(value = "checkDuplicateId.do", 
			method = {RequestMethod.POST})
	@ResponseBody
	public String checkDuplicateId(String userid, Model model) throws Exception {
		logger.debug("Welcome UserController checkDuplicateId------------------! "+ new Date());
		String id = "";
		try {
			id = iUserService.checkDuplicateId(userid);
		}catch(Exception e){
			logger.debug("Welcome UserController checkDuplicateId fail------------------! "+ new Date());
		}
		return id;
	}//
	
	@RequestMapping(value = "checkDuplicatePhone.do", 
			method = {RequestMethod.POST})
	@ResponseBody
	public String checkDuplicatePhone(String userphone, Model model) throws Exception {
		logger.debug("Welcome UserController checkDuplicatePhone------------------! "+ new Date());
		String phone = "";
		try {
			phone = iUserService.checkDuplicatePhone(userphone);
		}catch(Exception e){
			logger.debug("Welcome UserController checkDuplicatePhone fail------------------! "+ new Date());
		}
		return phone;
	}
	@RequestMapping(value = "godiet.do",method=RequestMethod.GET)
	   public String godiet(Model model) throws Exception{
	      return "dietManage";
	   }
	 @RequestMapping(value = "gonotice.do",method=RequestMethod.GET)
	   public String gonotice(Model model) throws Exception{
	      return "notice";
	   }//
}
