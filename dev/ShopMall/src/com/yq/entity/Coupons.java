package com.yq.entity;

public class Coupons extends Page{

	Integer cps_id; // int(11) NOT NULL AUTO_INCREMENT,
	String cps_name; // varchar(255) DEFAULT NULL,
	String cps_code; // varchar(255) DEFAULT NULL COMMENT '优惠券兑换码',
	Float cps_price; // float DEFAULT NULL,
	String cps_time; // varchar(255) DEFAULT NULL,
	Integer cps_level; // int(11) DEFAULT NULL COMMENT '0系统总优惠券，!0用户优惠券',
	String oppen_id; // 
	int status ;
	public Integer getCps_id() {
		return cps_id;
	}

	public void setCps_id(Integer cps_id) {
		this.cps_id = cps_id;
	}

	public String getCps_name() {
		return cps_name;
	}

	public void setCps_name(String cps_name) {
		this.cps_name = cps_name;
	}

	public String getCps_code() {
		return cps_code;
	}

	public void setCps_code(String cps_code) {
		this.cps_code = cps_code;
	}

	public Float getCps_price() {
		return cps_price;
	}

	public void setCps_price(Float cps_price) {
		this.cps_price = cps_price;
	}

	public String getCps_time() {
		return cps_time;
	}

	public void setCps_time(String cps_time) {
		this.cps_time = cps_time;
	}

	public Integer getCps_level() {
		return cps_level;
	}

	public void setCps_level(Integer cps_level) {
		this.cps_level = cps_level;
	}

	public String getOppen_id() {
		return oppen_id;
	}

	public void setOppen_id(String oppen_id) {
		this.oppen_id = oppen_id;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

}
