package com.yq.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yq.dao.ExpressMapper;
import com.yq.entity.Express;
@Service
@Transactional
public class ExpressService{
	@Autowired
	private ExpressMapper expressMapper;
	
	
	public int deleteByPrimaryKey(Integer express_id) {
		
		return expressMapper.deleteByPrimaryKey(express_id);
	}

	
	public int insert(Express record) {
		
		return expressMapper.insert(record);
	}

	
	public List<Express> select(Express express) {
		
		return expressMapper.select(express);
	}

	
	public Express selectByPrimaryKey(Integer express_id) {
		
		return expressMapper.selectByPrimaryKey(express_id);
	}

	
	public int updateByPrimaryKey(Express record) {
		
		return expressMapper.updateByPrimaryKey(record);
	}

}
