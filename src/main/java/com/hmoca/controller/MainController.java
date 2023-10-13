package com.hmoca.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hmoca.entity.Comment;
import com.hmoca.entity.Post;
import com.hmoca.entity.Rank;
import com.hmoca.entity.User;
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
	// 내가 쓴 게시물 불러오기
	@RequestMapping("/MyPage.do")
	public String MyPage(Model model, HttpSession session) {
		System.out.println("실행됨!!");
		User loginUser = (User)session.getAttribute("loginUser");
		String user_id = loginUser.getUser_id();
		
		
		List<Post> list = mapper.MypostList(user_id);
		System.out.println(list.get(0).getPost_idx());
		
		 for(Post p: list) { System.out.println("내게시글");
		 System.out.println(p.getPost_idx()); }
		 

		model.addAttribute("list", list);

		return "myPage";
	}
	
	@PostMapping("/mycontent")
	public void Mypost(Post vo){  
		System.out.println("vo에 담긴 content : "+vo.getPost_content());
		mapper.Mypostcontent(vo);
	}
}
