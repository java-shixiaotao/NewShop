package com.yq.util;

import javax.servlet.http.HttpServletRequest;

public  class PageUtil {
	public  static void pager(int currentPage,int pageSize,int total,HttpServletRequest request){
		if(currentPage==0||currentPage<0){
			currentPage=1;
		}
		if(pageSize==0){
			pageSize=10;
		}
		int totalPage=0;
		if(total%pageSize==0){
			totalPage=total/pageSize;
		}else{
			totalPage=total/pageSize+1;
		}
	
		request.setAttribute("total",total);
		request.setAttribute("totalPage",totalPage);
		request.setAttribute("currentPage",currentPage);
	}
	public static void test(){
		System.out.println("*********************************");
	}
	public static int currentNum(int currentPage,int pageSize){
		if(currentPage==0||currentPage<0){
			currentPage=1;
		}
		return (currentPage-1)*pageSize;
	}
}
