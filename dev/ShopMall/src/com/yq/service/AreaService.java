package com.yq.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yq.dao.AreaDao;
import com.yq.entity.Area;

@Service
public class AreaService {
	@Autowired
	private AreaDao areaDao;
	
	public int insert(Map<String,Object> map ){
		return areaDao.insert(map);
	}
	
	public int update(Map<String,Object> map ){
		return areaDao.update(map);
	}
	
	public int upstatus(Map<String,Object> map){
		return areaDao.upstatus(map);
	}
	
	public int sort(Map<String,Object> map){
		return areaDao.sort(map);
	}
	
	public List<Area> list(Area area){
		return areaDao.list(area);
	}
	public List<Area> listById(Area area){
		return areaDao.listById(area);
	}
}
