package com.weixin.dao;

import java.util.List;
import java.util.Map;

import com.weixin.entity.AccessToken;

public interface AccessTokenMapper {
	
	int update(Map<String, Object> map);
	
	List<AccessToken> select(AccessToken accessToken); 
}
