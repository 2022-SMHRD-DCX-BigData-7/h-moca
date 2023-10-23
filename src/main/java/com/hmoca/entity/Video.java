package com.hmoca.entity;

public class Video {
	private int cmt_count;
	private int like_count;
	private int video_length;
	private int video_views;
	private String video_thumb;
	private String video_name;
	private String url_name;
	
	
	public int getCmt_count() {
		return cmt_count;
	}
	public void setCmt_count(int cmt_count) {
		this.cmt_count = cmt_count;
	}
	public int getLike_count() {
		return like_count;
	}
	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}
	public int getVideo_length() {
		return video_length;
	}
	public void setVideo_length(int video_length) {
		this.video_length = video_length;
	}
	public int getVideo_views() {
		return video_views;
	}
	public void setVideo_views(int video_views) {
		this.video_views = video_views;
	}
	public String getVideo_thumb() {
		return video_thumb;
	}
	public void setVideo_thumb(String video_thumb) {
		this.video_thumb = video_thumb;
	}
	public String getVideo_name() {
		return video_name;
	}
	public void setVideo_name(String video_name) {
		this.video_name = video_name;
	}
	public String getUrl_name() {
		return url_name;
	}
	public void setUrl_name(String url_name) {
		this.url_name = url_name;
	}
}

