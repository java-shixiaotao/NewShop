package com.yq.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yq.dao.SearchDao;
import com.yq.entity.Search;

@Service
public class SearchService {

	@Autowired
	private SearchDao searchDao;

	public int insert(Map<String, Object> map) {
		return searchDao.insert(map);
	}
	
	public int update(Map<String, Object> map) {
		return searchDao.update(map);
	}

	public int upstatus(Map<String, Object> map) {
		return searchDao.upstatus(map);
	}

	public int sort(Map<String, Object> map) {
		return searchDao.sort(map);
	}

	public List<Search> list(Search search) {
		return searchDao.list(search);
	}

	public int count(Search search) {
		return searchDao.count(search);
	}

	public List<Search> listById(Search search) {
		return searchDao.listById(search);
	}
}
