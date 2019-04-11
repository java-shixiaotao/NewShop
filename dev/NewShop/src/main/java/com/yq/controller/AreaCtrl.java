package com.yq.controller;

import com.google.gson.Gson;
import com.yq.entity.Area;
import com.yq.service.AreaService;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/")
public class AreaCtrl {
	@Autowired
	private AreaService areaService;
	private static Gson gson=new Gson();

	@RequestMapping(value = "main/areaAddjsp.html")
	public ModelAndView addjsp() {
		return new ModelAndView("main/area/add");
	}
	
	@RequestMapping(value = "main/addrAddjsp.html")
	public ModelAndView addrAddjsp(Integer area_id) {
		ModelAndView ml = new ModelAndView();
		ml.addObject("area_id", area_id);
		ml.setViewName("main/area/addr-add");
		return ml;
	}
	@ResponseBody
	@RequestMapping(value = "main/areaInsert.html")
	public String insert(String area_name, Integer level, Integer status,
			Integer sort) throws UnsupportedEncodingException {
			area_name = java.net.URLDecoder.decode(area_name,"utf-8") ;
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("area_name", area_name);
			map.put("level", level);
			map.put("status", 1);
			map.put("sort", 0);
			return gson.toJson(areaService.insert(map));
	}
	@ResponseBody
	@RequestMapping(value = "main/areaUpdate.html")
	public Object update(Integer area_id,String area_name) throws UnsupportedEncodingException {
		area_name = java.net.URLDecoder.decode(area_name,"utf-8") ;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("area_name", area_name);
		map.put("area_id", area_id);
		return areaService.update(map)+"";
		
	}
	@ResponseBody
	@RequestMapping(value = "main/areaUpstatus.html")
	public Object upstatus(Integer area_id,Integer status) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", status);
		map.put("area_id", area_id);
		return areaService.upstatus(map)+"";
		
	}
	
	@ResponseBody
	@RequestMapping(value = "main/areaSort.html")
	public Object sort(Integer area_id,Integer sort) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sort", sort);
		map.put("area_id", area_id);
		return areaService.sort(map)+"";
		
	}
	
	@RequestMapping(value = "main/areaList.html")
	public ModelAndView list(Integer status, Integer level) {
		Area area= new Area();
		area.setStatus(status);
		area.setLevel(level);
		List<Area> list = areaService.list(area);
		ModelAndView ml = new ModelAndView();
		ml.addObject("list", list);
		ml.addObject("level", level);
		if(level==0){
		 ml.setViewName("main/area/area-list");
		}else{
			 ml.setViewName("main/area/addr-list");
		}
		return ml;
	}
	
	@RequestMapping(value = "page/areaList.html")
	public ModelAndView areaList(Integer status, Integer level) {
		Map<String, Object> map = new HashMap<String, Object>();
		ModelAndView ml = new ModelAndView();
		Area area= new Area();
		area.setLevel(0);
		area.setStatus(1);
		List<Area> areaList =areaService.list(area);
		for(int i = 0;i < areaList.size(); i++){
			area.setLevel(areaList.get(i).getArea_id());
			List<Area> addr =areaService.list(area);
			map.put("addr"+i, addr);
		}
		map.put("areaList",areaList);
		ml.addObject("map",map);
		ml.setViewName("page/area");
		return ml;
	}
	
	
	@RequestMapping(value = "main/areaListById.html")
	public ModelAndView listById(Integer area_id) {
		Area area= new Area();
		area.setArea_id(area_id);
		List<Area> list = areaService.listById(area);
		ModelAndView ml = new ModelAndView();
		ml.addObject("list", list);
		ml.setViewName("main/area/area-info");
		return ml;
	}
	@ResponseBody
	@RequestMapping(value = "page/areaJson.html")
	public void areaJson(Integer level, HttpServletResponse response) {
		try {
		Area area= new Area();
		area.setLevel(level);
		area.setStatus(1);
		List<Area> addr =areaService.list(area);
		JSONArray jsonStrs = JSONArray.fromObject(addr);
		 
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		System.out.println(jsonStrs);
		//return jsonStrs.toString();
		
//		System.out.println(gson.toJson(addr));
		response.getWriter().write(jsonStrs.toString());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
//			return null;
		}
//		return gson.toJson(addr);
		
	}
}
