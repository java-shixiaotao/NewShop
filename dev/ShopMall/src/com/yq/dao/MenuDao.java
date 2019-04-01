package com.yq.dao;

import java.util.List;
import java.util.Map;

import com.yq.entity.Menu;


public interface MenuDao {
	
	public int insert(Map<String, Object> map);
	
	public int update(Map<String, Object> map);
	
	public int upstatus(Map<String, Object> map);
	
	public List<Menu> list(Menu menu); 
	
	public int count(Menu menu); 
	
	public List<Menu> listById(Menu menu); 
}
