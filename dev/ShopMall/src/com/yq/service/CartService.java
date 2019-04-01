package com.yq.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yq.dao.CartDao;
import com.yq.entity.Cart;

@Service
public class CartService {
	@Autowired
	private CartDao cartDao;

	public int insert(Map<String, Object> map) {
		return cartDao.insert(map);
	}

	public int update(Map<String, Object> map) {
		return cartDao.update(map);
	}

	public int delete(Map<String, Object> map) {
		return cartDao.delete(map);
	}

	public List<Cart> list(Cart cart) {
		return cartDao.list(cart);
	}
	public int count(Cart cart){
		return cartDao.count(cart);
	}
	public int goodsnum(Cart cart){
		return cartDao.goodsnum(cart);
	}
	
	public Float goodstotalprice(Cart cart){
		return cartDao.goodstotalprice(cart);
	}
	public int goodstotalnum(Cart cart){
		return cartDao.goodstotalnum(cart);
	}
}
