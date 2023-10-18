package com.hmoca.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
//	@GetMapping("/result.do")
//	public String result(@PathVariable("dist_idx")int dist_idx, Model model) {
//		
//		Dist vo = mapper.selectDist(dist_idx);
//		model.addAttribute("vo", vo);
//		return "result";
//	}
	
	@GetMapping("/result.do")
	public String result(Model model) {
		
		Dist vo = mapper.selectDist();
		model.addAttribute("vo", vo);
		return "result";
	}
	
	// 결과페이지 이동
//	@GetMapping("/result.do") //결과페이지에 dist_info 값 뿌려주기만 하면됨
//	public String result(Dist vo, Model model) {
//		mapper.selectDist1(vo); 
//		return "result";
//	}

//	@GetMapping("/result.do/{dist_idx}")
//	public String result(@PathVariable("dist_idx") int dist_idx, Model model) {
//	    Dist vo = mapper.selectDist(dist_idx);
//	    model.addAttribute("vo", vo);
//	    return "result";
//}
}