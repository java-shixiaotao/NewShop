package com.yq.dao;

import com.yq.entity.GoodsPic;

import java.util.Map;


public interface GoodsPicDao {

//	public int insert(Map<String, Object> map);

	public GoodsPic getByFileName(Map<String, Object> params);

	int insertPic(GoodsPic goodsPic);
}
