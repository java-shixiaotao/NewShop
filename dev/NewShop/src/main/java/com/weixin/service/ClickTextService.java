package com.weixin.service;

import com.weixin.dao.ClickTextMapper;
import com.weixin.entity.ClickText;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class ClickTextService {
	@Autowired
	private ClickTextMapper clickTextMapper;
	
	public int deleteByPrimaryKey(String ct_key) {
		
		return clickTextMapper.deleteByPrimaryKey(ct_key);
	}

	public int insert(ClickText record) {
		return clickTextMapper.insert(record);
	}

	
	public int insertSelective(ClickText record) {
		return clickTextMapper.insertSelective(record);
	}

	
	public ClickText selectByPrimaryKey(String ct_key) {
		return clickTextMapper.selectByPrimaryKey(ct_key);
	}

	
	public List<ClickText> select(ClickText record) {
		return clickTextMapper.select(record);
	}

	
	public int updateByPrimaryKeySelective(ClickText record) {
		return clickTextMapper.updateByPrimaryKeySelective(record);
	}

	
	public int updateByPrimaryKey(ClickText record) {
		return clickTextMapper.updateByPrimaryKey(record);
	}

}
