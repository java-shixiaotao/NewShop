package com.yq.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yq.dao.MenuDao;
import com.yq.entity.Menu;

@Service
public class MenuService {
	@Autowired
	private MenuDao menuDao;
	
	public int insert(Map<String,Object> map ){
		return menuDao.insert(map);
	}
	
	public int update(Map<String,Object> map ){
		return menuDao.update(map);
	}
	
	public int upstatus(Map<String,Object> map){
		return menuDao.upstatus(map);
	}

	public List<Menu> list(Menu menu){
		return menuDao.list(menu);
	}
	public int count(Menu menu){
		return menuDao.count(menu);
	}
	
	public List<Menu> listById(Menu menu){
		return menuDao.listById(menu);
	}
}
