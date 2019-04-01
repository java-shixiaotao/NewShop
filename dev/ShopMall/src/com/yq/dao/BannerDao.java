package com.yq.dao;

import java.util.List;
import java.util.Map;

import com.yq.entity.Banner;


public interface BannerDao {
	
	public int insert(Map<String, Object> map);
	
	public int update(Map<String, Object> map);
	
	public int upstatus(Map<String, Object> map);
	
	public int sort(Map<String, Object> map);
	
	public List<Banner> list(Banner banner); 
	
	public int count(Banner banner); 
	
	public List<Banner> listById(Banner banner); 
}
