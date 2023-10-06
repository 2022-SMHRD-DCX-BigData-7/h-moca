package com.hmoca.controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;

import com.hmoca.entity.Comment;
import com.hmoca.mapper.CmtMapper;


public class CmtController {
private CmtMapper mapper;

	@GetMapping("/cmt")
	public List<Comment> cmtAjaxList(){
		List<Comment> list = mapper.commentList();
		return list;
		
	}
}
