package com.yq.service;

import com.yq.dao.GoodsPicDao;
import com.yq.entity.GoodsPic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class GoodsPicService {
	@Autowired
	private GoodsPicDao goodsPicDao;


	public GoodsPic getByFileName(Map<String, Object> params){ return goodsPicDao.getByFileName(params);}

	public int insertPic(GoodsPic goodsPic) {
		return goodsPicDao.insertPic(goodsPic);
	}
}
