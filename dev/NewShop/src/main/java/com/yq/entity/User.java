package com.yq.entity;

public class User extends Page{
	 int user_id;//int(11) NOT NULL AUTO_INCREMENT,
	 String oppen_id;//varchar(255) NOT NULL,
	 String username;//varchar(255) DEFAULT NULL COMMENT '微信账号名称',
	 String realname;//varchar(255) DEFAULT NULL COMMENT '昵称',
	 String password;//varchar(255) DEFAULT NULL,
	 String head_img;//varchar(255) DEFAULT NULL,
	 Integer area_id;
	 String area_name;
	 String add_time;
	 String member_time;
	 int status;
	 String member_code;

	public String getMember_code() {
		return member_code;
	}

	public void setMember_code(String member_code) {
		this.member_code = member_code;
	}

	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getOppen_id() {
		return oppen_id;
	}
	public void setOppen_id(String oppen_id) {
		this.oppen_id = oppen_id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getHead_img() {
		return head_img;
	}
	public void setHead_img(String head_img) {
		this.head_img = head_img;
	}
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
	public String getAdd_time() {
		return add_time;
	}
	public void setAdd_time(String add_time) {
		this.add_time = add_time;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getMember_time() {
		return member_time;
	}
	public void setMember_time(String member_time) {
		this.member_time = member_time;
	}

}
