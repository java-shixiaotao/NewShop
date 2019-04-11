package com.yq.dao;

import java.util.List;
import java.util.Map;

import com.yq.entity.Category;


public interface CategoryDao {
	public int insert(Map<String, Object> map);
	
	public int update(Map<String, Object> map);
	
	public int upstatus(Map<String, Object> map);
	
	public int sort(Map<String, Object> map);
	
	public List<Category> list(Category category); 
	
	public List<Category> listById(Category category); 
}
