package com.yq.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;






import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yq.entity.Banner;
import com.yq.service.BannerService;

@Controller
@RequestMapping("/")
public class BannerCtrl {
	@Autowired
	private BannerService bannerService;

	@RequestMapping(value = "/main/banAddjsp.html")
	public ModelAndView addjsp() {
		return new ModelAndView("main/banner/add");
	}
	
	@ResponseBody
	@RequestMapping(value = "/main/banInsert.html")
	public String insert(String ban_img,String url,Integer status,
			Integer sort,Integer type) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("url", url);
			map.put("type", type);
			map.put("ban_img", ban_img);
			map.put("status", 1);
			map.put("sort", 0);
			return bannerService.insert(map)+"";
	}
	@ResponseBody
	@RequestMapping(value = "/main/banUpdate.html")
	public Object update(Integer ban_id,String ban_img,String url) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("url", url);
		map.put("ban_img", ban_img);
		map.put("ban_id", ban_id);
		return bannerService.update(map)+"";
		
	}
	@ResponseBody
	@RequestMapping(value = "/main/banUpstatus.html")
	public Object upstatus(Integer ban_id,Integer status) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", status);
		map.put("ban_id", ban_id);
		return bannerService.upstatus(map)+"";
	}
	
	@ResponseBody
	@RequestMapping(value = "/main/banSort.html")
	public Object sort(Integer ban_id,Integer sort) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sort", sort);
		map.put("ban_id", ban_id);
		return bannerService.sort(map)+"";
	}
	
	@RequestMapping(value = "/main/banList.html")
	public ModelAndView list(Integer status) {
		Banner banner= new Banner();
		banner.setStatus(status);
		List<Banner> list = bannerService.list(banner);
		ModelAndView ml = new ModelAndView();
		ml.addObject("list", list);
		ml.setViewName("main/banner/list");
		return ml;
	}
	@RequestMapping(value = "/main/banListById.html")
	public ModelAndView listById(Integer ban_id) {
		Banner banner= new Banner();
		banner.setBan_id(ban_id);
		List<Banner> list = bannerService.listById(banner);
		ModelAndView ml = new ModelAndView();
		ml.addObject("list", list);
		ml.setViewName("main/banner/info");
		return ml;
	}
}
