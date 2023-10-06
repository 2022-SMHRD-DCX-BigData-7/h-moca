package com.hmoca.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
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
}
