package com.hmoca.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hmoca.entity.User;
import com.hmoca.mapper.UserMapper;


@Controller
public class UserController {

	@Autowired
	private UserMapper mapper;

	
	@RequestMapping("/UserInsertForm.do")
	public void UserInsertForm() { }	
	// 스프링에서는 메소드 이름과 일치한 jsp가 있는지 확인 후 연결
	
	
	@RequestMapping("/UserInsert.do")
	public String UserInsert(User vo) {
		
		mapper.UserInsert(vo); 

		return "redirect:/UserList.do"; 
	}	
}