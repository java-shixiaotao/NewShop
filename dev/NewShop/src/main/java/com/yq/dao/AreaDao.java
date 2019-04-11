package com.yq.dao;

import java.util.List;
import java.util.Map;

import com.yq.entity.Area;

public interface AreaDao {
	public int insert(Map<String, Object> map);
	
	public int update(Map<String, Object> map);
	
	public int upstatus(Map<String, Object> map);
	
	public int sort(Map<String, Object> map);
	
	public List<Area> list(Area area); 
	
	public List<Area> listById(Area area); 
}
