package com.hmoca.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hmoca.entity.Dist;

@Mapper
public interface DistMapper {

	public List<Dist> MyDistList(String user_id);
	public Dist selectDist(int dist_idx); // 스크랩 -> 게시물
	public void selectDist1(Dist vo); // 검색 -> 판별 페이지
	public Dist selectDist();
	public Dist scrapDist(int dist_idx);
	public List<Dist> distScore(Dist vo);
	//
	public List<Dist> selectDist(Dist vo);
	
	
	
}
