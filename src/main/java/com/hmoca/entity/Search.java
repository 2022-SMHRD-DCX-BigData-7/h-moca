package com.hmoca.entity;

import java.util.List;

public class Search {
	List<Search> Searchs;
	private int dist_idx;
	private String user_id; 
	private String url_name;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUrl_name() {
		return url_name;
	}
	public void setUrl_name(String url_name) {
		this.url_name = url_name;
	}
	public int getDist_idx() {
		return dist_idx;
	}
	public void setDist_idx(int dist_idx) {
		this.dist_idx = dist_idx;
	}
	
	public List<Search> getSearchs() {
		return Searchs;
	}
	public void setSearchs(List<Search> searchs) {
		Searchs = searchs;
	}
	@Override
	public String toString() {
		return "Search [dist_idx=" + dist_idx + ", user_id=" + user_id + ", url_name=" + url_name + "]";
	}

}
