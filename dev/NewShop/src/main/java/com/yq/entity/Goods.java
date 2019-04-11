package com.yq.entity;

public class Goods extends Page{
	Integer goods_id;
	String goods_name;
	String goods_img;
	String goods_spe;
	int spe_type;
	double goods_price;
	double goods_price_d;
	String goods_detail;
	String add_time;
	Integer status;
	Integer type;

	public double getGoods_price_d() {
		return goods_price_d;
	}

	public void setGoods_price_d(double goods_price_d) {
		this.goods_price_d = goods_price_d;
	}
	public int getSpe_type() {
		return spe_type;
	}

	public void setSpe_type(int spe_type) {
		this.spe_type = spe_type;
	}

	public Integer getGoods_id() {
		return goods_id;
	}

	public void setGoods_id(Integer goods_id) {
		this.goods_id = goods_id;
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

	public String getGoods_spe() {
		return goods_spe;
	}

	public void setGoods_spe(String goods_spe) {
		this.goods_spe = goods_spe;
	}

	public double getGoods_price() {
		return goods_price;
	}

	public void setGoods_price(double goods_price) {
		this.goods_price = goods_price;
	}

	public String getGoods_detail() {
		return goods_detail;
	}

	public void setGoods_detail(String goods_detail) {
		this.goods_detail = goods_detail;
	}

	public String getAdd_time() {
		return add_time;
	}

	public void setAdd_time(String add_time) {
		this.add_time = add_time;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}
}
