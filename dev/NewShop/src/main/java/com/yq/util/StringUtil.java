package com.yq.util;

import javax.servlet.http.HttpSession;

public class StringUtil {

	protected Integer pagesize_1 = 10;


	public String getOppen_id(HttpSession session) {
//		return (String) session.getAttribute("oppen_id");
		System.out.println("打印信息");
		return "oyqTtw9S7JFtTgx6-3qpSG66w7QU";
	}
	public void setOppen_id(String oppen_id, HttpSession session){
		
		session.setAttribute("oppen_id", oppen_id);
	}

	public Integer getPagesize_1() {
		return pagesize_1;
	}

	public void setPagesize_1(Integer pagesize_1) {
		this.pagesize_1 = pagesize_1;
	}

//	public String getAdd_time() {
//		return add_time;
//	}
//
//	public void setAdd_time(String add_time) {
//		this.add_time = add_time;
//	}

}
