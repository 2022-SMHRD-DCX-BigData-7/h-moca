package com.hmoca.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hmoca.entity.Dist;
import com.hmoca.entity.Post;
import com.hmoca.entity.User;
import com.hmoca.mapper.DistMapper;
import com.hmoca.mapper.PostMapper;

@Controller
public class DistController {

@Autowired
	private DistMapper mapper;
	
	// 결과페이지 이동
	@GetMapping("/result.do")
	public String result() {
				
		return "result";
	}
}