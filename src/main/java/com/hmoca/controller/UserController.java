package com.hmoca.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hmoca.entity.User;
import com.hmoca.mapper.UserMapper;


@Controller
public class UserController {

	@Autowired
	private UserMapper mapper;

	// 회원가입 페이지 이동
	@RequestMapping("/UserInsertForm.do")
	public String UserInsertForm() { return "join"; }	
	
	// 로그인 페이지 이동
	@RequestMapping("/UserLoginForm.do")
	public String UserLoginForm() {
		return "login";
	}
	
	// 회원가입
	@PostMapping("/UserInsert.do")
	public String UserInsert(User vo, Model model) {
		// 아이디 중복 확인
	    if (mapper.isUsernameExists(vo.getUser_id())) {
	        model.addAttribute("error", "이미 사용 중인 아이디입니다.");
	        return "join";

	       
	    }
	    else {
	        model.addAttribute("successMessage", "아이디 사용 가능"); // 왜 안됨 !!
	    }
	    
		mapper.UserInsert(vo); 

		return "redirect:/Main.do"; 
	}
	
	// 로그인하면 세션에 저장
	@PostMapping("/UserLogin.do")
	public String UserLogin(User vo, HttpSession session) {
		User loginUser = mapper.UserLogin(vo);
		
		if(loginUser != null) {
			session.setAttribute("loginUser", loginUser);

		}
		
		return "redirect:/Main.do";
	}
	
	// 로그아웃
	@RequestMapping("/Logout.do")
	public String Logout(HttpSession session) {
		session.removeAttribute("loginUser");
		
		return "redirect:/Main.do";
	}
}