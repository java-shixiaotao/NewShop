package com.weixin.dao;

import com.weixin.entity.WxSetting;

public interface WxSettingMapper {
	public  int deleteByPrimaryKey(Integer id);

	public  int insert(WxSetting record);

	public  int insertSelective(WxSetting record);

	public   WxSetting selectByPrimaryKey(Integer id);

	public int updateByPrimaryKeySelective(WxSetting record);

	public  int updateByPrimaryKey(WxSetting record);
}