package com.yq.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yq.dao.CategoryDao;
import com.yq.entity.Category;

@Service
public class CategoryService {
	@Autowired
	private CategoryDao categoryDao;
	
	public int insert(Map<String,Object> map ){
		return categoryDao.insert(map);
	}
	
	public int update(Map<String,Object> map ){
		return categoryDao.update(map);
	}
	
	public int upstatus(Map<String,Object> map){
		return categoryDao.upstatus(map);
	}
	public int sort(Map<String,Object> map){
		return categoryDao.sort(map);
	}
	public List<Category> list(Category category){
		return categoryDao.list(category);
	}
	public List<Category> listById(Category category){
		return categoryDao.listById(category);
	}
}
