package com.hmoca.mapper;

import java.util.List;

import com.hmoca.entity.Dist;


public interface DistMapper {

	public List<Dist> MyDistList(String user_id);
	public Dist selectDist(int dist_idx); // 스크랩 -> 게시물
	public void selectDist1(Dist vo); // 검색 -> 판별 페이지
	public Dist selectDist();
}
