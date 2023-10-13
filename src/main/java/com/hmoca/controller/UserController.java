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

import com.hmoca.entity.Post;
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
//		if(vo.getUser_id() != null) {
//	        model.addAttribute("error", "이미 사용 중인 아이디입니다.");
//
//		}
//		else
//		{
//	        model.addAttribute("successMessage", "아이디 사용 가능"); // 왜 안됨 !!
//	        return "join";
//		}
		
		// 아이디 중복 확인
	    if (mapper.UserExists(vo.getUser_id())) {
	        model.addAttribute("error", "이미 사용 중인 아이디입니다.");
	        return "join";
 
	    }
	    
	    
		// 아이디 사용 가능
	    if (mapper.UserNoExists(vo.getUser_id())) {
	        model.addAttribute("successMessage", "아이디 사용 가능"); // 왜 안됨 !!
	        return "join";
 
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
	
	 // 비밀번호, 닉네임 수정

		@RequestMapping("/UserUpdate.do")
		public String UserUpdate(HttpSession session, Model model) {
			
			User loginUser = (User)session.getAttribute("loginUser");
			String user_nick = loginUser.getUser_nick();
			String user_pw = loginUser.getUser_pw();
			
			User vo = mapper.UserSelect(user_nick);
			model.addAttribute("vo", vo);
			
			User pw = mapper.UserSelect(user_pw);
			model.addAttribute("pw", pw);
			
			return "UserUpdate";
		}
		
	// 로그아웃
	@RequestMapping("/Logout.do")
	public String Logout(HttpSession session) {
		session.removeAttribute("loginUser");
		
		return "redirect:/Main.do";
	}
}