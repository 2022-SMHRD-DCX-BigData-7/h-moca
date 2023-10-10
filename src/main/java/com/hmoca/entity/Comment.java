package com.hmoca.entity;

public class Comment {
	
	private int cmt_idx;
	private String cmt_content;
	private String created_at;
	private String user_id;
	private int post_idx;
	
	public int getCmt_idx() {
		return cmt_idx;
	}
	public void setCmt_idx(int cmt_idx) {
		this.cmt_idx = cmt_idx;
	}
	public String getCmt_content() {
		return cmt_content;
	}
	public void setCmt_content(String cmt_content) {
		this.cmt_content = cmt_content;
	}
	public String getCreated_at() {
		return created_at;
	}
	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getPost_idx() {
		return post_idx;
	}
	public void setPost_idx(int post_idx) {
		this.post_idx = post_idx;
	}

}

