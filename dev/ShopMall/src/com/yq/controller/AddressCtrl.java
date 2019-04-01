package com.yq.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yq.entity.Address;
import com.yq.service.AddressService;
import com.yq.util.StringUtil;
@Controller
@RequestMapping
public class AddressCtrl extends StringUtil{
	
	@Autowired
	private AddressService addressService;
	
	@RequestMapping(value = "/page/addrAddjsp.html")
	public ModelAndView addjsp() {
		return new ModelAndView("page/address-add");
	}

	@ResponseBody
	@RequestMapping(value = "/page/addrInsert.html")
	public String insert(String province , String city ,
	String area ,String addr_user,String addr_name,
			String addr_tel, String oppen_id,String sort,HttpSession session) {
//			setOppen_id("111", session);//测试代码，模仿登录
			oppen_id=getOppen_id(session);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("addr_user", addr_user);
			map.put("addr_name", addr_name);
			map.put("addr_tel", addr_tel);
			map.put("province", province);
			map.put("city", city);
			map.put("area", area);
//			map.put("sort", datetime);
			map.put("oppen_id",oppen_id);
			return addressService.insert(map)+"";
	}
	@ResponseBody
	@RequestMapping(value = "/page/addrUpdate.html")
	public String update(String province , String city ,
			String area ,String addr_user,String addr_name,
			String addr_tel, String oppen_id,Integer addr_id,HttpSession session) {
			Map<String, Object> map = new HashMap<String, Object>();
//			setOppen_id("111", session);//测试代码，模仿登录
//			oppen_id=getOppen_id(session);
			map.put("addr_user", addr_user);
			map.put("addr_name", addr_name);
			map.put("addr_tel", addr_tel);
			map.put("province", province);
			map.put("city", city);
			map.put("area", area);
			map.put("addr_id",addr_id);
			return addressService.update(map)+"";
	}
	
	@ResponseBody
	@RequestMapping(value = "/page/addrDel.html")
	public Object delete(Integer addr_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("addr_id",addr_id);
		return addressService.delete(map)+"";
	}
	
	@ResponseBody
	@RequestMapping(value = "/page/addrSort.html")
	public Object sort(Integer addr_id) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String datetime = sdf.format(new Date());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("addr_id",addr_id);
		map.put("sort",datetime);
		return addressService.sort(map)+"";
	}

	/**
	 * 购物车结算下单页面
	 * @param addr_id
	 * @param cps_id
	 * @param oppen_id
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/page/addrList.html")
	public ModelAndView list(Integer addr_id,Integer cps_id,String oppen_id,HttpSession session) {
		Address address = new Address();
		address.setOppen_id(getOppen_id(session));
		List<Address> list = addressService.list(address);
		ModelAndView ml = new ModelAndView();
		ml.addObject("list", list);
		ml.addObject("cps_id", cps_id);
		ml.addObject("addr_id", addr_id);
		ml.setViewName("page/address-list");
		return ml;
	}

	/**
	 * 直接購物结算下单页面
	 * @param addr_id
	 * @param cps_id
	 * @param oppen_id
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/page/directBuyAddrList.html")
	public ModelAndView directBuyAddrList(Integer addr_id,String goods_id,String member_code,String goods_price,String oppen_id,HttpSession session) {
		Address address = new Address();
		address.setOppen_id(getOppen_id(session));
		List<Address> list = addressService.list(address);
		ModelAndView ml = new ModelAndView();
		ml.addObject("list", list);
		ml.addObject("addr_id", addr_id);
		ml.addObject("goods_id", goods_id);
		ml.addObject("goods_price", goods_price);
		ml.addObject("member_code", member_code);
		ml.setViewName("page/address-list-directBuy");
		return ml;
	}

	//会员注册页面的
	@RequestMapping(value = "/page/membershipAddrList.html")
	public ModelAndView membershipAddrList(Integer addr_id, @RequestParam(defaultValue = "0") Integer cps_id, String oppen_id, HttpSession session) {
		Address address = new Address();
		address.setOppen_id(getOppen_id(session));
		List<Address> list = addressService.list(address);
		ModelAndView ml = new ModelAndView();
		ml.addObject("list", list);
		ml.addObject("cps_id", cps_id);
		ml.addObject("addr_id", addr_id);
		ml.setViewName("page/membershipAddr-list");
		return ml;
	}
	//会员修改页面的
	@RequestMapping(value = "/page/modifyMembershipAddrList.html")
	public ModelAndView modifyMembershipAddrList(Integer addr_id, @RequestParam(defaultValue = "0") Integer cps_id, String oppen_id, HttpSession session) {
		Address address = new Address();
		address.setOppen_id(getOppen_id(session));
		List<Address> list = addressService.list(address);
		ModelAndView ml = new ModelAndView();
		ml.addObject("list", list);
		ml.addObject("cps_id", cps_id);
		ml.addObject("addr_id", addr_id);
		ml.setViewName("page/modifyMembershipAddr-list");
		return ml;
	}

	@RequestMapping(value = "/page/addrListTwo.html")
	public ModelAndView listTwo(Integer goods_id,Integer goods_num,Integer addr_id,Integer cps_id,String oppen_id,HttpSession session) {
		Address address = new Address();
		address.setOppen_id(getOppen_id(session));
		List<Address> list = addressService.list(address);
		ModelAndView ml = new ModelAndView();
		ml.addObject("list", list);
		ml.addObject("cps_id", cps_id);
		ml.addObject("addr_id", addr_id);
		ml.addObject("goods_id", goods_id);
		ml.addObject("goods_num", goods_num);
		ml.setViewName("page/address-list-two");
		return ml;
	}
	
	@RequestMapping(value = "/page/addressList.html")
	public ModelAndView addrList(String oppen_id,HttpSession session) {
//		setOppen_id("111", session);//测试代码，模仿登录
		Address address = new Address();
		address.setOppen_id(getOppen_id(session));
		List<Address> list = addressService.list(address);
		ModelAndView ml = new ModelAndView();
		ml.addObject("list", list);
		ml.setViewName("page/addr-list");
		return ml;
	}
	
	@RequestMapping(value = "/page/addrListById.html")
	public ModelAndView listById(Integer addr_id) {
		Address address = new Address();
		address.setAddr_id(addr_id);
		List<Address> list = addressService.listById(address);
		ModelAndView ml = new ModelAndView();
		ml.addObject("list", list);
		ml.addObject("addr_id", addr_id);
		ml.setViewName("page/addr-info");
		return ml;
	}
}
