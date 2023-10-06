package com.hmoca.mapper;

import java.util.List;

import com.hmoca.entity.Comment;

public interface CmtMapper {
	public List<Comment> commentList();
	public void insertComment(Comment vo);
	public Comment selectComment(int cmt_idx);

}
