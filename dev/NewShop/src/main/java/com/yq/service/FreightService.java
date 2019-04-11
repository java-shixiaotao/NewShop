package com.yq.service;


import com.yq.dao.FreightDao;
import com.yq.entity.Freight;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


@Service
public class FreightService {
@Autowired
FreightDao freightDao ;
	public int insert(Map<String,Object> map){
		return freightDao.insert(map);
	}
	
	public int update(Map<String,Object> map){
		return freightDao.update(map);
	}
	
	public List<Freight> list(Freight freight){
		return freightDao.list(freight);
	}
	
}
