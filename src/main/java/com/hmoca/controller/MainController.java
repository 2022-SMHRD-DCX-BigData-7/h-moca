package com.hmoca.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
		
	@GetMapping("/Main.do")
	public String Main() {
		return "main";
	}
	
	// 게시판 페이지 이동
	@GetMapping("/boardList.do")
	public String boardList() {
		return "boardList";
	}
	
}
