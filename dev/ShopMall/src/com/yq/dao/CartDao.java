package com.yq.dao;

import java.util.List;
import java.util.Map;

import com.yq.entity.Cart;


public interface CartDao {

	public int insert(Map<String, Object> map);

	public int update(Map<String, Object> map);

	
	
	public int delete(Map<String, Object> map);

	public List<Cart> list(Cart cart);

	public int count(Cart cart);
	
	public int goodsnum(Cart cart);
	
	public Float goodstotalprice(Cart cart);
	
	public int goodstotalnum(Cart cart);
}
