package com.yq.controller;

import com.yq.entity.Category;
import com.yq.entity.Goods;
import com.yq.service.CategoryService;
import com.yq.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/")
public class CategoryCtrl {
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private  GoodsService  goodsService;

	@RequestMapping(value = "/main/ctgAddjsp")
	public ModelAndView addjsp() {
		return new ModelAndView("main/category/add");
	}
	
	@ResponseBody
	@RequestMapping(value = "/main/ctgInsert")
	public String insert(String ctg_name, String ctg_img, Integer status,
			Integer sort) throws UnsupportedEncodingException {
			Map<String, Object> map = new HashMap<String, Object>();
			ctg_name = java.net.URLDecoder.decode(ctg_name,"utf-8") ;
			map.put("ctg_name", ctg_name);
			map.put("ctg_img", ctg_img);
			map.put("status", 1);
			map.put("sort", 0);
			return categoryService.insert(map)+"";
	}
	@ResponseBody
	@RequestMapping(value = "/main/ctgUpdate")
	public Object update(Integer ctg_id, String ctg_img,String ctg_name) throws UnsupportedEncodingException {
		ctg_name = java.net.URLDecoder.decode(ctg_name,"utf-8") ;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ctg_name", ctg_name);
		map.put("ctg_img", ctg_img);
		map.put("ctg_id", ctg_id);
		return categoryService.update(map)+"";
		
	}
	@ResponseBody
	@RequestMapping(value = "/main/ctgUpstatus")
	public Object upstatus(Integer ctg_id,Integer status) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", status);
		map.put("ctg_id", ctg_id);
		return categoryService.upstatus(map)+"";
	}
	
	@ResponseBody
	@RequestMapping(value = "/main/ctgSort")
	public Object sort(Integer ctg_id,Integer sort) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sort", sort);
		map.put("ctg_id", ctg_id);
		return categoryService.sort(map)+"";
	}
	
	@RequestMapping(value = "/main/ctgList")
	public ModelAndView list(Integer status) {
		Category category= new Category();
		category.setStatus(status);
		List<Category> list = categoryService.list(category);
		ModelAndView ml = new ModelAndView();
		ml.addObject("list", list);
		ml.setViewName("main/category/list");
		return ml;
	}
	@RequestMapping(value = "/main/ctgListById")
	public ModelAndView listById(Integer ctg_id) {
		Category category= new Category();
		category.setCtg_id(ctg_id);
		List<Category> list = categoryService.listById(category);
		ModelAndView ml = new ModelAndView();
		ml.addObject("list", list);
		ml.setViewName("main/category/info");
		return ml;
	}
	@RequestMapping(value = "/page/category")
	public ModelAndView ctgList(@RequestParam(defaultValue="0") Integer ctg_id) {
		Goods goods= new Goods();
		Category category= new Category();
		category.setStatus(1);
		List<Category> ctgList = categoryService.list(category);
		List<Goods> goodsList = new ArrayList<Goods>();
		if(ctgList.size()>0){
			goods.setStatus(1);
		if(ctg_id==0){
			ctg_id=ctgList.get(0).getCtg_id();
		}
		goods.setType(1);
			goodsList =  goodsService.list(goods);
		}
		ModelAndView ml = new ModelAndView();
		ml.addObject("ctg_id", ctg_id);
		ml.addObject("ctgList", ctgList);
		ml.addObject("goodsList", goodsList);
		ml.setViewName("page/category");
		return ml;
	}
	
}
