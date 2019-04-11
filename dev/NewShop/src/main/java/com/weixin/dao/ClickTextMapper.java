package com.weixin.dao;

import java.util.List;

import com.weixin.entity.ClickText;

public interface ClickTextMapper {
    int deleteByPrimaryKey(String key);

    int insert(ClickText record);

    int insertSelective(ClickText record);

    ClickText selectByPrimaryKey(String ct_key);

    List<ClickText> select(ClickText record);

    int updateByPrimaryKeySelective(ClickText record);

    int updateByPrimaryKey(ClickText record);
}