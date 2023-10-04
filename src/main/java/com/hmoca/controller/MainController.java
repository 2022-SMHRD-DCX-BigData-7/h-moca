package com.hmoca.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	
	// Autowired 넣어야함
	
	@GetMapping("/Main.do")
	public String Main() {
		return "main";
	}

}
