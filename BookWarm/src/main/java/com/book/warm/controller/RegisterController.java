package com.book.warm.controller;

import java.text.ParseException;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.book.warm.service.AuthenticationService;
import com.book.warm.service.RegisterService;
import com.book.warm.vo.UserVO;

import lombok.extern.log4j.Log4j;
@Log4j
@Controller
@RequestMapping("/register")
public class RegisterController {
	
	@Inject
	RegisterService registerService;
	
	@Autowired
	AuthenticationService authenticationService;
	
	// 회원가입(중복 확인)페이지 띄우는 controller
	@RequestMapping(value="/checkDuplicateRegister") 
	public String checkDuplicateRegister() {
		System.out.println("checkDuplicateRegister()");
		return "/checkDuplicateRegister";
	}
	
	// 중복확인처리 controller
	@RequestMapping(value="/checkDuplicated") 
	public String checkDuplicated(HttpServletRequest req, RedirectAttributes rttr) {
		log.info("========== checkDuplicated() ==========");
		// 1. 이름, 메일주소 받아온다
		String user_name = req.getParameter("user_name");
		String user_mail = req.getParameter("user_mail");
		
		// 2. 받아온 정보들을 가지고 있는 유저가 있는지 db에서 확인한다.
		UserVO userVO = registerService.checkUser(user_mail);
		
		if(userVO!=null) {
			log.info("========== User 정보가 있습니다. ==========");
			
			// userVO로 받아온게 있다면 >> 이미 존재하는 유저(중복)
			rttr.addFlashAttribute("msg", true); 
			return "redirect:/register/checkDuplicateRegister";
		}else {
			log.info("========== User 정보가 없습니다. ==========");
			// userVO로 받아온게 없다면(null) >> 새로운 유저
			rttr.addFlashAttribute("user_name", user_name);
			rttr.addFlashAttribute("user_mail", user_mail);
			return "redirect:/register/registerForm";
		}
	}
	
	// 회원가입 페이지
	@RequestMapping(value="/registerForm") 
	public String registerForm(HttpServletRequest req, Model model) {
		log.info("========== registerForm() ==========");
		String user_name = null;
		String user_mail = null;
		
		Map<String, ?> map = RequestContextUtils.getInputFlashMap(req);
		
		if(map!=null) {
			user_name = (String) map.get("user_name");
			user_mail = (String) map.get("user_mail");
			
			model.addAttribute("user_name", user_name);
			model.addAttribute("user_mail", user_mail);
		}
		
		if(user_name!=null && user_mail!=null) {
			return "/register";
		}
		
		// url로 접근한 경우 >> 회원가입(중복확인)페이지로 보내버린다.
		return "redirect:/register/checkDuplicateRegister";
	}
	
	
	// 회원가입 
	@RequestMapping(value="/registerSuccess", method=RequestMethod.POST)
	public String registerSuccess(UserVO userVO, HttpServletRequest req) {
		System.out.println("registerSuccess()");
		// url로 접근한 경우 >> 회원가입(중복확인)페이지로 보내버린다.
		if(userVO==null)
			return "redirect:/checkDuplicateRegister";
		log.info("userVO.phone : "+userVO.getUser_phone());
		BCryptPasswordEncoder pwEncoder = new BCryptPasswordEncoder();
		String encryptedPw = pwEncoder.encode(userVO.getUser_pw());
		userVO.setUser_pw(encryptedPw);
		
		String str=req.getParameter("user_bday_string");
		
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd"); 
		java.util.Date t;
		
		try {
			t = sdf.parse(str);
			java.sql.Date st = new java.sql.Date(t.getTime());
			java.sql.Timestamp sts = new java.sql.Timestamp(t.getTime());
			
			userVO.setUser_bday(sts);
			System.out.println("성공");
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		registerService.insertNewUser(userVO); // add user_data
		authenticationService.addRoleUser(userVO.getUser_id()); // add Authorities
		return "/registerSuccess";
	}
	
	// url로 접근한 경우 >> 회원가입(중복확인)페이지로 보내버린다.
	@RequestMapping(value="/registerSuccess", method=RequestMethod.GET)
	public String registerSuccessByURL() {
		return "redirect:/register/checkDuplicateRegister";
	}
	
	
	// id 중복확인
	@ResponseBody
	@RequestMapping(value="/idCheck", method=RequestMethod.GET)
	public int idCheck(@RequestParam("user_id") String user_id) {
		System.out.println("idCheck(), user_id : "+user_id);
		int rtn =  registerService.checkDuplicatedId(user_id);
		System.out.println("rtn:"+rtn);
		return rtn;
	}
	

	// nickname 중복확인
	@ResponseBody
	@RequestMapping(value="/nicknameCheck", method=RequestMethod.GET)
	public int nicknameCheck(@RequestParam("user_nickname") String user_nickname) {
		int rtn = registerService.checkDuplicatedNickname(user_nickname);
		System.out.println(rtn);
		return rtn;
	}
	
	
	
}
