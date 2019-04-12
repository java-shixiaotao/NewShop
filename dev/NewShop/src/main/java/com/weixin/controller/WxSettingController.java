package com.weixin.controller;

import com.google.gson.Gson;
import com.weixin.entity.WxSetting;
import com.weixin.service.WxSettingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;

/**
 * 后台配置微信的appid，appsecret和微信支付相关数据的controller
 *
 */

@Controller
@RequestMapping
public class WxSettingController {
	@Autowired
	private WxSettingService wxSettingService;
	Map<String,Object> map = new HashMap<String, Object>();
	Gson gson = new Gson();
	@ResponseBody
	@RequestMapping(value="/main/wxSettingUpdate")
	public String update(WxSetting wxSetting){
		wxSetting.setId(1);
		int rs  =	wxSettingService.updateByPrimaryKeySelective(wxSetting);
		if(rs!=1){
			map.put("message","update button error!");
		}
		map.put("rs", rs);
		return gson.toJson(map);
	}
	
	@RequestMapping(value="/main/wxSettingList")
	public ModelAndView getList(ModelAndView ml){
		ml.addObject("list",wxSettingService.selectByPrimaryKey(1));
		ml.setViewName("main/setting/info");
		return  ml ;
	}
	
//	public WxSetting getSetting(){
//		return wxSettingService.selectByPrimaryKey(1);
//	}
}
