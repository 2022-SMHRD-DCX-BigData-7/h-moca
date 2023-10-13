package com.hmoca.entity;

public class Dist {
	private int dist_idx;
	private String user_id; 
	private String url_name;
	private String video_name;
	private String video_thumb; 
	private double title_score; 
	private double thumb_score;
	private double meta_score; 
	private double video_score; 
	
	public int getDist_idx() {
		return dist_idx;
	}
	public void setDist_idx(int dist_idx) {
		this.dist_idx = dist_idx;
	}
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
	public String getVideo_name() {
		return video_name;
	}
	public void setVideo_name(String video_name) {
		this.video_name = video_name;
	}
	public String getVideo_thumb() {
		return video_thumb;
	}
	public void setVideo_thumb(String video_thumb) {
		this.video_thumb = video_thumb;
	}
	public double getTitle_score() {
		return title_score;
	}
	public void setTitle_score(double title_score) {
		this.title_score = title_score;
	}
	public double getThumb_score() {
		return thumb_score;
	}
	public void setThumb_score(double thumb_score) {
		this.thumb_score = thumb_score;
	}
	public double getMeta_score() {
		return meta_score;
	}
	public void setMeta_score(double meta_score) {
		this.meta_score = meta_score;
	}
	public double getVideo_score() {
		return video_score;
	}
	public void setVideo_score(double video_score) {
		this.video_score = video_score;
	}

}
