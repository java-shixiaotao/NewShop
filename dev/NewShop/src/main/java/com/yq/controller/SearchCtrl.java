package com.yq.controller;

import com.yq.entity.Search;
import com.yq.service.SearchService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("/")
public class SearchCtrl {
	@Autowired
	private SearchService searchService;

	@RequestMapping(value = "main/secAddjsp")
	public ModelAndView addjsp() {
		return new ModelAndView("main/search/add");
	}
	
	@ResponseBody
	@RequestMapping(value = "main/secInsert")
	public String insert(String sec_name, Integer sort, Integer status) throws UnsupportedEncodingException {
		if(StringUtils.isNotEmpty(sec_name)){
			sec_name = java.net.URLDecoder.decode(sec_name,"utf-8") ;
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sec_name",sec_name);
		map.put("status",1);
		map.put("sort", 0);
		return searchService.insert(map)+"";
	}
	
	@ResponseBody
	@RequestMapping(value = "main/secUpdate")
	public Object update(Integer sec_id,String sec_name) throws UnsupportedEncodingException {
		if(StringUtils.isNotEmpty(sec_name)){
			sec_name = java.net.URLDecoder.decode(sec_name,"utf-8") ;
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sec_name", sec_name);
		map.put("sec_id", sec_id);
		return searchService.update(map)+"";
		
	}
	
	@ResponseBody
	/*@RequestMapping(value = "main/secUpstatus")*/
	public Object upstatus(Integer sec_id,Integer status) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", status);
		map.put("sec_id", sec_id);
		return searchService.upstatus(map)+"";
	}
	
	@ResponseBody
	@RequestMapping(value = "main/secSort")
	public Object sort(Integer sec_id,Integer sort) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sort", sort);
		map.put("sec_id", sec_id);
		return searchService.sort(map)+"";
	}
	
	@RequestMapping(value = "main/secList")
	public ModelAndView list(@RequestParam(defaultValue="1")Integer status) {
		Search search= new Search();
		search.setStatus(status);
		List<Search> list = searchService.list(search);
		ModelAndView ml = new ModelAndView();
		ml.addObject("list", list);
		ml.setViewName("main/search/list");
		return ml;
	}
	@RequestMapping(value = "main/secListById")
	public ModelAndView listById(Integer sec_id) {
		Search search= new Search();
		search.setSec_id(sec_id);
		List<Search> list = searchService.listById(search);
		ModelAndView ml = new ModelAndView();
		ml.addObject("list", list);
		ml.setViewName("main/search/info");
		return ml;
	}
	@RequestMapping(value = "page/secList")
	public ModelAndView searchlist(@RequestParam(defaultValue="1")Integer status) {
		Search search= new Search();
		search.setStatus(status);
		List<Search> list = searchService.list(search);
		ModelAndView ml = new ModelAndView();
		ml.addObject("list", list);
		ml.setViewName("page/search");
		return ml;
	}
}
