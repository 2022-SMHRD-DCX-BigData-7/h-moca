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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hmoca.entity.Comment;
import com.hmoca.mapper.CmtMapper;

@RestController
public class CmtController {
	
	@Autowired
	private CmtMapper mapper;

	@GetMapping("/cmt")
	public List<Comment> cmtAjaxList(){
				
		List<Comment> list = mapper.commentList();
		
		return list;
		
	}
	
	@PostMapping("/cmt")
	public void cmtAjaxInsert(Comment vo){  
		System.out.println("vo에 담긴 content : "+vo.getCmt_content());
		mapper.insertComment(vo);
	}
	
	@DeleteMapping("/cmt/{cmt_idx}")
	public void cmtAjaxDelete(@PathVariable int cmt_idx) {
		mapper.DeleteComment(cmt_idx);
	}
	
}
