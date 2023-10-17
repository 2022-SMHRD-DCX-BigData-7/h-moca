package com.hmoca.mapper;

import java.util.List;

import com.hmoca.entity.Dist;


public interface DistMapper {

	public List<Dist> MyDistList(String user_id);
	public Dist selectDist(int dist_idx);
}
