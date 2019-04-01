package com.weixin.dao;

import java.util.List;

import com.weixin.entity.Button;

public interface ButtonMapper {
    int deleteByPrimaryKey(String id);

    int insert(Button record);

    int insertSelective(Button record);
    
    List<Button> select(Button record);
    
    int selectCount(Button record);
    
    Button selectByPrimaryKey(String id);
    
    int sort(Button record);
    
    int updateByPrimaryKeySelective(Button record);

    int updateByPrimaryKey(Button record);
}