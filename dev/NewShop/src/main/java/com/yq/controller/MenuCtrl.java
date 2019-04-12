package com.yq.controller;

import com.google.gson.Gson;
import com.yq.entity.Cart;
import com.yq.entity.Goods;
import com.yq.entity.User;
import com.yq.service.CartService;
import com.yq.service.GoodsService;
import com.yq.service.UserService;
import com.yq.util.PageUtil;
import com.yq.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping
public class MenuCtrl extends StringUtil {
	@Autowired
	private GoodsService goodsService;

	@Autowired
	private CartService cartService;

	@Autowired
	private UserService userService;

	private static Gson gson = new Gson();


	@RequestMapping(value = "/main/menuAddjsp")
	public ModelAndView addjsp() {
		ModelAndView ml = new ModelAndView();
		ml.setViewName("main/menu/add");
		return ml;
	}

	@ResponseBody
	@RequestMapping(value = "/main/menuInsert")
	public String insert(String goods_name, String goods_img, Float goods_price, String goods_spe, String goods_detail,
			Integer ctg_id, Integer status, Integer type) {
		Map<String, Object> map = new HashMap<String, Object>();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		String add_time = sf.format(new Date());
		map.put("goods_name", goods_name);
		map.put("goods_img", goods_img);
		map.put("goods_spe", goods_spe);
		map.put("goods_price", goods_price);
		map.put("goods_detail", goods_detail);
		map.put("add_time", add_time);
		map.put("ctg_id", ctg_id);
		map.put("status", 1);
		map.put("type", 2);
		return goodsService.insert(map) + "";

	}

	@ResponseBody
	@RequestMapping(value = "/page/menuCartInsert")
	public void insert(Integer goods_id, String goods_name, String goods_img, String goods_spe, Float goods_price,
                       Float goods_total, @RequestParam(defaultValue = "1") Integer goods_num, String oppen_id,
                       HttpServletResponse response, HttpSession session) {
		try {
			int rs = 0;
			int cart_num = Integer.parseInt(session.getAttribute("cart_num").toString())+1;
			session.setAttribute("cart_num", cart_num);
			Map<String, Object> map2 = new HashMap<String, Object>();
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
			// setOppen_id("111", session);//测试代码，模仿登录
			oppen_id = getOppen_id(session);
			String datetime = sf.format(new Date());
			User user = new User();
			user.setOppen_id(oppen_id);
			user.setMember_time(datetime);
			if (userService.isMember(user) == 1) {
				Map<String, Object> map = new HashMap<String, Object>();
				Cart cart = new Cart();
				map.put("goods_id", goods_id);
				map.put("goods_name", goods_name);
				map.put("goods_img", goods_img);
				map.put("goods_spe", goods_spe);
				map.put("goods_price", goods_price);

				map.put("oppen_id", oppen_id);
				cart.setGoods_id(goods_id);
				cart.setOppen_id(oppen_id);
				int total = cartService.count(cart);
				
//
				if (total > 0) {
					 goods_num=cartService.goodsnum(cart)+1;
					 goods_total = goods_price*goods_num ;
					 map.put("goods_total", goods_total);
					 map.put("goods_num", goods_num);
					 rs  = cartService.update(map);
				//	rs = 1;
				} else {
					
					goods_total = goods_price * goods_num;
					map.put("goods_total", goods_total);
					map.put("goods_num", goods_num);
					rs = cartService.insert(map);
				}

			} else {
				rs = -1;
			}
			map2.put("rs_code", rs);
			map2.put("cart_num", cart_num);

			response.getWriter().write(gson.toJson(map2));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@ResponseBody
	@RequestMapping(value = "/main/menuUpdate")
	public Object update(String goods_name, String goods_img, Float goods_price, String goods_spe, String goods_detail,
			String add_time, Integer ctg_id, Integer goods_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("goods_name", goods_name);
		map.put("goods_img", goods_img);
		map.put("goods_spe", goods_spe);
		map.put("goods_price", goods_price);
		map.put("goods_detail", goods_detail);
		map.put("add_time", add_time);
		map.put("ctg_id", ctg_id);
		map.put("goods_id", goods_id);
		map.put("type", 2);
		return goodsService.update(map) + "";

	}

	@ResponseBody
	@RequestMapping(value = "/main/menuUpstatus")
	public Object upstatus(Integer goods_id, Integer status) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", status);
		map.put("goods_id", goods_id);
		return goodsService.upstatus(map) + "";
	}

	@RequestMapping(value = "/main/menuList")
	public ModelAndView list(@RequestParam(defaultValue = "1") Integer status,
                             @RequestParam(defaultValue = "1") Integer currentPage, HttpServletRequest request) {
		Goods goods = new Goods();
		goods.setStatus(status);
		goods.setType(2);
		int total = goodsService.count(goods);
		PageUtil.pager(currentPage, pagesize_1, total, request);
		goods.setPageSize(pagesize_1);
		goods.setCurrentNum(PageUtil.currentNum(currentPage, pagesize_1));
		List<Goods> list = goodsService.list(goods);
		ModelAndView ml = new ModelAndView();
		ml.addObject("goods", list);
		ml.setViewName("main/menu/list");
		return ml;
	}

	@RequestMapping(value = "/main/menuListById")
	public ModelAndView listById(Integer goods_id) {
		// addjsp();
		Goods goods = new Goods();
		goods.setGoods_id(goods_id);
		List<Goods> list = goodsService.listById(goods);
		ModelAndView ml = new ModelAndView();

		ml.addObject("list", list);
		ml.setViewName("main/menu/info");
		return ml;
	}

	@RequestMapping(value = "/page/menuList")
	public ModelAndView menuList(@RequestParam(defaultValue = "1") Integer status) {
		Goods goods = new Goods();
		goods.setType(2);
		goods.setStatus(status);
		List<Goods> list = goodsService.list(goods);
		ModelAndView ml = new ModelAndView();
		ml.addObject("goods", list);
		ml.setViewName("page/menu-list");
		return ml;
	}

	/**
	 * 根据商品id查询商品详情
	 * 
	 * @param goods_id
	 * @return
	 */
	@RequestMapping(value = "/page/menuListById")
	public ModelAndView menuListById(Integer goods_id) {
		Goods goods = new Goods();
		goods.setGoods_id(goods_id);
		List<Goods> list = goodsService.listById(goods);
		ModelAndView ml = new ModelAndView();
		ml.addObject("list", list);
		ml.addObject("goods_id", goods_id);
		ml.setViewName("page/menu-info");
		return ml;
	}
}
