package com.yq.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yq.dao.CouponsDao;
import com.yq.entity.Coupons;

@Service
public class CouponsService {
	@Autowired
	private CouponsDao couponsDao;
	
	public int insert(Map<String,Object> map){
		return couponsDao.insert(map);
	}
	
	public int update(Map<String,Object> map){
		return couponsDao.update(map) ;
	}
	public int upstatus(Map<String, Object> map){
		return couponsDao.upstatus(map);
	}
	public int delete(Map<String,Object> map){
		return couponsDao.delete(map) ;
	}
	
	public List<Coupons> list(Coupons coupons){
		return couponsDao.list(coupons) ;
	} 
	public List<Coupons> listAll(Coupons coupons){
		return couponsDao.listAll(coupons) ;
	} 
	public int count(Coupons coupons){
		return couponsDao.count(coupons) ;
	}
	public List<Coupons> listByCode(Coupons coupons){
		return couponsDao.listByCode(coupons) ;
	} 
	
	public List<Coupons> listById(Coupons coupons){
		return couponsDao.listById(coupons) ;
	} 
}
