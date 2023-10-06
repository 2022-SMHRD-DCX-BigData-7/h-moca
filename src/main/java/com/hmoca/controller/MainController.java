package com.hmoca.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	
		
	@GetMapping("/Main.do")
	public String Main() {
		return "main";
	}
	
	@GetMapping("/postList.do")
	public String List() {
		return "board";
	}
	
}
