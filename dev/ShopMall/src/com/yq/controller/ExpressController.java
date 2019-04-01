package com.yq.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yq.entity.Express;
import com.yq.entity.Order;
import com.yq.service.ExpressService;
import com.yq.service.OrderService;
import com.yq.util.KdniaoTrackQueryAPI;

@Controller
public class ExpressController {
	@Autowired
	private ExpressService expressService;
	@Autowired
	private OrderService orderService;

	@RequestMapping("/main/exp_add")
	public ModelAndView insert(ModelAndView ml){
		ml.setViewName("main/express/add");
		return ml;
	}
	
	@ResponseBody
	@RequestMapping("/main/exp_insert")
	public String insert(Express express) throws UnsupportedEncodingException{
		express.setExpress_name(java.net.URLDecoder.decode(express.getExpress_name(),"utf-8"));
		return expressService.insert(express)+"";
	}
	
	@ResponseBody
	@RequestMapping("/main/exp_update")
	public String update(Express express) throws UnsupportedEncodingException{
		express.setExpress_name(java.net.URLDecoder.decode(express.getExpress_name(),"utf-8"));
		return expressService.updateByPrimaryKey(express)+"";
	}
	
	@ResponseBody
	@RequestMapping("/main/exp_delete")
	public String delete(Integer express_id){
		return expressService.deleteByPrimaryKey(express_id)+"";
	}
	
	@RequestMapping("/main/exp_list")
	public ModelAndView list(ModelAndView ml ,Express express){
		List<Express> list = expressService.select(express);
		ml.addObject("list",list);
		ml.setViewName("main/express/list");
		return ml;
	}
	
	@RequestMapping("/main/express")
	public ModelAndView listById(ModelAndView ml ,Integer express_id){
		Express express = expressService.selectByPrimaryKey(express_id);
		ml.addObject("express",express);
		ml.setViewName("main/express/info");
		return ml;
	}
	
	@RequestMapping("/main/exp_choose")
	public ModelAndView exp_choose(ModelAndView ml ,Express express,String order_id){
		List<Express> list = expressService.select(express);

		Order order = new Order();
		order.setOrder_id(order_id);
		ml.addObject("order",orderService.listById(order).get(0));
		String express_dm = orderService.listById(order).get(0).getExpress_dm();
		String express_hm = orderService.listById(order).get(0).getExpress_hm();
		if(StringUtils.isNotEmpty(express_dm)&&StringUtils.isNotEmpty(express_hm)){
			ml.addObject("result",exp_show(express_dm, express_hm));
		}
		else{
			ml.addObject("result","暂无记录");
		}
		ml.addObject("list",list);
		
		ml.addObject("order_id",order_id);
		ml.setViewName("main/order/info");
		return ml;
	}
	@ResponseBody
	@RequestMapping("/main/exp_show")
	public String exp_show(String express_dm,String express_hm){
		KdniaoTrackQueryAPI kdniaoTrackQueryAPI = new KdniaoTrackQueryAPI();
		String result = kdniaoTrackQueryAPI.getOrderTracesByJson(express_dm, express_hm);
		System.out.println(result);
		return result;
	}
}
