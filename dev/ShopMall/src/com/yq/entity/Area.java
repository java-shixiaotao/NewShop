package com.yq.entity;

public class Area {
	 Integer area_id;//int(11) NOT NULL AUTO_INCREMENT,
	 String area_name;//varchar(255) DEFAULT NULL,
	 Integer level;//int(11) DEFAULT NULL,
	 Integer status;//int(255) DEFAULT NULL,
	 Integer sort;//int(255) DEFAULT NULL,

	public Integer getArea_id() {
		return area_id;
	}
	public void setArea_id(Integer area_id) {
		this.area_id = area_id;
	}
	public String getArea_name() {
		return area_name;
	}
	public void setArea_name(String area_name) {
		this.area_name = area_name;
	}
	public Integer getLevel() {
		return level;
	}
	public void setLevel(Integer level) {
		this.level = level;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getSort() {
		return sort;
	}
	public void setSort(Integer sort) {
		this.sort = sort;
	}
	
}
