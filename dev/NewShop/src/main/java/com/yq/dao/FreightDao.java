package com.yq.dao;

import java.util.List;
import java.util.Map;

import com.yq.entity.Freight;



public interface FreightDao {
	
	public int insert(Map<String, Object> map);
	
	public int update(Map<String, Object> map);
	
	public List<Freight> list(Freight freight); 
	
}
