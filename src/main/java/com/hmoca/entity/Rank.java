package com.hmoca.entity;

public class Rank {
    private String video_name;
    private String video_thumb;
    private String url_name;
    private int url_count;
    
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
	public String getUrl_name() {
		return url_name;
	}
	public void setUrl_name(String url_name) {
		this.url_name = url_name;
	}
	public int getUrl_count() {
		return url_count;
	}
	public void setUrl_count(int url_count) {
		this.url_count = url_count;
	}
}
