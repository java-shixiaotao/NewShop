package com.yq.dao;

import java.util.List;
import java.util.Map;

import com.yq.entity.Search;


public interface SearchDao {
	
	public int insert(Map<String, Object> map);
	
	public int update(Map<String, Object> map);
	
	public int upstatus(Map<String, Object> map);
	
	public int sort(Map<String, Object> map);
	
	public List<Search> list(Search search); 
	
	public int count(Search search); 
	
	public List<Search> listById(Search search); 
}
