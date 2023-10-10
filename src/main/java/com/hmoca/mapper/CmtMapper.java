package com.hmoca.mapper;

import java.util.List;

import com.hmoca.entity.Comment;

public interface CmtMapper {
	
	// 댓글 조회
	public List<Comment> commentList();
	
	// 댓글 작성
	public void insertComment(Comment vo);
	
	// 댓글 수정
	public void UpdateComment(Comment vo);
	
	// 댓글 삭제
	public void DeleteComment(int cmt_idx);
	
	
//	public Comment selectComment(int cmt_idx);
	


}
