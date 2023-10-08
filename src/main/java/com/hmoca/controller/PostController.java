package com.hmoca.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hmoca.entity.Post;
import com.hmoca.mapper.PostMapper;
@RestController
public class PostController {
	
	@Autowired
	private PostMapper mapper;
		
	@DeleteMapping("/boardDelete.do/{post_idx}")
	public void postAjaxDelete(@PathVariable int post_idx) {
		mapper.DeletePost(post_idx);
	}
			
	////////////
	@GetMapping("/updateCount/{idx}")  //idx를 요청에 의해 가져오기 때문에 PathVariable로 받아와야함
	public Post updateCount(@PathVariable int post_idx) {
		// 조회수 +1 하는 메소드
		mapper.postCount(post_idx); //해당 게시글에 있는 조회수를 하나 올리겠다 !
		
		// 기존에 idx를 이용해서 해당 게시글 하나 가져오는 메소드 만들적 있음
		// +1 된 조회수가 반영된 게시글 DB
		Post vo =mapper.selectPost(post_idx);
		System.out.println(vo.toString()); // xml에서 디버깅 요소를 만들었기 때문에 확인 가능
		
		return vo;
	}
	
	
}
