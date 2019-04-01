package com.weixin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.weixin.dao.AccessTokenMapper;
import com.weixin.entity.AccessToken;


@Service
@Transactional
public class AccessTokenService{
	@Autowired
	public  AccessTokenMapper accessTokenMapper ;
	
	
	public int update(Map<String, Object> map) {
		return accessTokenMapper.update(map);
	}

	
	public List<AccessToken> listById(AccessToken accessToken) {
		return accessTokenMapper.select(accessToken);
	}
}
