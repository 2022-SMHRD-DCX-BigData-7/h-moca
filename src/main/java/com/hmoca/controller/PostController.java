package com.hmoca.controller;

import java.util.List;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.hmoca.entity.Post;
import com.hmoca.mapper.PostMapper;

public class PostController {

	private PostMapper mapper;
	
	@GetMapping("/post")
	public List<Post> postAjaxList(){
		// @RestController 표시 덕분에 @ResponseBody 안 써도 됨
		List<Post> list = mapper.postList();
		return list;
		
	}
	
	@PostMapping("/post")
	// 돌려줄 데이터 없어서 void로 !
	public void postAjaxInsert(Post vo){  
		System.out.println("vo에 담긴 content : "+vo.getPost_content());
		mapper.insertPost(vo);
		// 돌려줄 데이터 없음   -> 돌려줄 데이터는 없지만 결과물을 boarList가 실행됨 ( success : boardList 에 의해서 ~)
	}
	
	@DeleteMapping("/post/{post_idx}")
	public void postAjaxDelete(@PathVariable int post_idx) {
		mapper.DeletePost(post_idx);
	}
	
	@PutMapping("/post")
	public void postAjaxUpdate(@RequestBody Post vo) {
		// 전에는 contentType이 지정되어있지 않아서 넘어오는 값을
		// 바로 Board객체로 묶어 줄 수 있었음
		// json 형식으로 넘어노는 값은 표시를 해줘야함 (@RequestBody)
		
		mapper.Updatepost(vo);
		
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
