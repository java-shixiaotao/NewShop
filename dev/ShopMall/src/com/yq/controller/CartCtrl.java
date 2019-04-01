package com.yq.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.yq.entity.Cart;
import com.yq.entity.User;
import com.yq.service.CartService;
import com.yq.service.UserService;
import com.yq.util.StringUtil;
@Controller
@RequestMapping
public class CartCtrl extends StringUtil{
	@Autowired
	private  CartService  cartService;
	@Autowired
	private UserService userService;
	private static Gson gson=new Gson();

	@ResponseBody
	@RequestMapping(value = "/page/cartInsert.html")
	public void insert(Integer goods_id,String goods_name,String goods_img,String goods_spe,Float goods_price,Float goods_total,
			@RequestParam(defaultValue="1")Integer goods_num,String oppen_id,HttpServletResponse response,HttpSession session) {
		try {
			Cart cart= new Cart();
			Map<String, Object> map = new HashMap<String, Object>();
			goods_name = java.net.URLDecoder.decode(goods_name,"utf-8") ;
			map.put("goods_id", goods_id);
			map.put("goods_name", goods_name);
			map.put("goods_img", goods_img);
			map.put("goods_spe", goods_spe);
			map.put("goods_price", goods_price);
			oppen_id=getOppen_id(session);
			map.put("oppen_id",oppen_id);
			cart.setGoods_id(goods_id);
			cart.setOppen_id(oppen_id);
			int total = cartService.count(cart);
			int cart_num =Integer.parseInt(session.getAttribute("cart_num").toString())+1;
			session.setAttribute("cart_num", cart_num);
			Map<String, Object> map2 = new HashMap<String, Object>();
			int rs = 0 ;
			if(total>0){
				goods_num=cartService.goodsnum(cart)+1;
				goods_total = goods_price*goods_num ;
				map.put("goods_total", goods_total);
				map.put("goods_num", goods_num);
				rs = cartService.update(map);
			}else{
				goods_total = goods_price*goods_num ;
				map.put("goods_total", goods_total);
				map.put("goods_num", goods_num);
				rs  = cartService.insert(map);
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
	@RequestMapping(value = "/page/cartUpdate.html")
	public void update(Float goods_price,Float goods_total,Integer goods_num,Integer goods_id,Integer s,HttpServletResponse response,HttpSession session) {
		try {	
//		setOppen_id("111", session);//测试代码，模仿登录
		 Map<String, Object> map = new HashMap<>();
		map.put("oppen_id", getOppen_id(session));
		map.put("goods_num", goods_num);
		map.put("goods_total", goods_num*goods_price);
		map.put("goods_id", goods_id);
		int cart_num =Integer.parseInt(session.getAttribute("cart_num").toString());
		if(s==1){
			cart_num= cart_num+1 ;
		}else{
			cart_num= cart_num-1 ;
		}
		session.setAttribute("cart_num", cart_num);
		Map<String, Object> map2 = new HashMap<String, Object>();
		int rs = 0;
		if(goods_num<1){
			rs =  cartService.delete(map);
		}else{
			rs =  cartService.update(map);
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
	@RequestMapping(value = "/page/cartDel.html")
	public void delete(Integer goods_id,HttpSession session,HttpServletResponse response) {
		int cart_num =Integer.parseInt(session.getAttribute("cart_num").toString())-1;
		session.setAttribute("cart_num", cart_num);
		Map<String, Object> map = new HashMap<String, Object>();
		int rs  = cartService.delete(map);
		Map<String, Object> map2 = new HashMap<String, Object>();
		map.put("goods_id", goods_id);
		map2.put("rs_code", rs);
		map2.put("cart_num", cart_num);
		try {
			response.getWriter().write(gson.toJson(map2));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/page/cartList.html")
	public ModelAndView list(String oppen_id,HttpSession session) {
//		setOppen_id("111", session);//测试代码，模仿登录
		Cart cart= new Cart();
		cart.setOppen_id(getOppen_id(session));
		List<Cart> list = cartService.list(cart);
		Float tprice = cartService.goodstotalprice(cart);
		int  tnum = cartService.goodstotalnum(cart);
		ModelAndView ml = new ModelAndView();
		ml.addObject("goods", list);
		ml.addObject("tprice", tprice.toString());
		ml.addObject("tnum", tnum);
		ml.setViewName("page/cart");
		return ml;
	}
	@ResponseBody
	@RequestMapping(value = "/page/getCartNum.html")
	public Map<String,Integer> getCartNum(HttpSession session) {
		Cart cart= new Cart();
		cart.setOppen_id(getOppen_id(session));
		int  tnum = cartService.goodstotalnum(cart);
		Map<String,Integer> map=new HashMap<>();
		map.put("cart_num",tnum);
		return map;
	}
}
