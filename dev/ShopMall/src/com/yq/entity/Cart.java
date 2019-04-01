package com.yq.entity;

public class Cart {
	Integer cart_id;
	Integer goods_id;
	String goods_name;
	String goods_img;
	Float goods_price;
	Integer goods_num;
	Float goods_total;
	String oppen_id;
	String goods_spe;
	public Integer getCart_id() {
		return cart_id;
	}
	public void setCart_id(Integer cart_id) {
		this.cart_id = cart_id;
	}
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public String getGoods_img() {
		return goods_img;
	}
	public void setGoods_img(String goods_img) {
		this.goods_img = goods_img;
	}
	public Float getGoods_price() {
		return goods_price;
	}
	public void setGoods_price(Float goods_price) {
		this.goods_price = goods_price;
	}
	public Integer getGoods_num() {
		return goods_num;
	}
	public void setGoods_num(Integer goods_num) {
		this.goods_num = goods_num;
	}
	public Float getGoods_total() {
		return goods_total;
	}
	public void setGoods_total(Float goods_total) {
		this.goods_total = goods_total;
	}
	public String getOppen_id() {
		return oppen_id;
	}
	public void setOppen_id(String oppen_id) {
		this.oppen_id = oppen_id;
	}
	public Integer getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(Integer goods_id) {
		this.goods_id = goods_id;
	}
	public String getGoods_spe() {
		return goods_spe;
	}
	public void setGoods_spe(String goods_spe) {
		this.goods_spe = goods_spe;
	}
	
	
}
