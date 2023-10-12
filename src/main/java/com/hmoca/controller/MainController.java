package com.hmoca.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hmoca.entity.Post;
import com.hmoca.entity.Rank;
import com.hmoca.mapper.PostMapper;

@Controller
public class MainController {
	
	@Autowired
	private PostMapper mapper;
	
	@GetMapping("/Main.do")
	public String Main() {
				
		return "main";
	}
		
	
	
	// 마이페이지 이동
	@RequestMapping("/MyPage.do")
	public String MyPage() {
		return "myPage";
	}
}
