package com.yq.controller;

import com.weixin.util.WxUtil;
import com.yq.entity.Cart;
import com.yq.entity.Membership;
import com.yq.entity.User;
import com.yq.service.CartService;
import com.yq.service.UserService;
import com.yq.util.PageUtil;
import com.yq.util.StringUtil;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping
public class UserCtrl extends StringUtil {
	@Autowired
	private UserService userService;
	private User user = new User();
	@Autowired
	private  CartService  cartService;
	private Cart cart= new Cart();
	Map<String, Object> map = new HashMap<String, Object>();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
	@RequestMapping(value = "/userAddjsp")
	public ModelAndView addjsp() {
		ModelAndView ml = new ModelAndView();
		ml.setViewName("main/user/add");
		return ml;
	}

	@RequestMapping(value = "/page/userInsert")
	public ModelAndView insert(String url, HttpServletRequest request, HttpSession session) {
		System.out.println("系统进入用户更新后台！！！！！！！");
		System.out.println("session中的openid:>>>>"+session.getAttribute("oppen_id"));
		String oppen_id = "";
		String username = "";
		String add_time =sf.format(new Date());
		int isUrl = 0;
		if (session.getAttribute("oppen_id") == null) {
			System.out.println("系统开始，检查oppen_id="
					+ session.getAttribute("oppen_id"));
			map = WxUtil.oppenIdInfo(request, session);
			oppen_id = (String) map.get("oppen_id");
			
			if (StringUtils.isNotEmpty(oppen_id)) {
				map.put("oppen_id", oppen_id);
				map.put("username", username);
				map.put("realname", map.get("realname"));
				map.put("head_img", map.get("head_img"));
				map.put("add_time", add_time);
				map.put("status", 1);
				session.setAttribute("oppen_id",oppen_id);
//				session.setAttribute("realname",map.get("realname"));
//				session.setAttribute("head_img",map.get("head_img"));
				user.setOppen_id(oppen_id);
				if (userService.listById(user).size()!= 0) {
					System.out.println("用户存在，则update" );
					isUrl= userService.update(map);
					isUrl = 1;
				} else {
					System.out.println("用户不存在，则insert" );
					try {
						isUrl= userService.insert(map);
					}catch(Exception e){
						e.printStackTrace();
					}
				}
				cart.setOppen_id(oppen_id);
				int cart_num = cartService.goodstotalnum(cart);
				session.setAttribute("cart_num", cart_num);
				
			} else {
				System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>" );
				System.out.println("oppen_id==null" );
				isUrl= -1;
			}
		} else {
			isUrl= 1;
		}
	
		url="redirect:"+url;
		String reUrl = (isUrl==1)? url:"page/error";
		return new ModelAndView(reUrl);
	}

	@ResponseBody
	@RequestMapping(value = "/page/userUpdate")
	public Object update(String realname, String head_img, String oppen_id) {
		map.put("realname", realname);
		map.put("head_img", head_img);
		map.put("oppen_id", oppen_id);
		return userService.update(map) + "";

	}

	@ResponseBody
	@RequestMapping(value = "/main/userUpstatus")
	public Object upstatus(String oppen_id, Integer status) {
		map.put("status", status);
		map.put("oppen_id", oppen_id);
		return userService.upstatus(map) + "";
	}

	@ResponseBody
	@RequestMapping(value = "/page/userUparea")
	public Object uparea(Integer area_id, String area_name, String oppen_id) {
		map.put("area_id", area_id);
		map.put("area_name", area_name);
		map.put("oppen_id", oppen_id);
		return userService.uparea(map) + "";
	}

	@ResponseBody
	@RequestMapping(value = "/main/userUpmbertime")
	public Object upmbertime(String oppen_id, String member_time) {
		map.put("member_time", member_time);
		map.put("oppen_id", oppen_id);
		return userService.upmbertime(map) + "";
	}

	@RequestMapping(value = "/main/userList")
	public ModelAndView list(String realname,
                             @RequestParam(defaultValue = "1") Integer status,
                             @RequestParam(defaultValue = "1") Integer currentPage,
                             HttpServletRequest request) {
		user.setStatus(status);
		try {
			if (StringUtils.isNotEmpty(realname)) {

				realname = new String(realname.getBytes("iso8859-1"), "utf-8");
			}
			user.setRealname(realname);
			int total = userService.count(user);
			PageUtil.pager(currentPage, pagesize_1, total, request);
			user.setPageSize(pagesize_1);
			user.setCurrentNum(PageUtil.currentNum(currentPage, pagesize_1));
			List<User> list = userService.list(user);
			ModelAndView ml = new ModelAndView();
			ml.addObject("list", list);
			ml.addObject("realname", realname);
			ml.setViewName("main/user/list");
			return ml;
		}

		catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	@RequestMapping(value = "/main/userListById")
	public ModelAndView listById(String oppen_id) {
		user.setOppen_id(oppen_id);
		List<User> list = userService.listById(user);
		ModelAndView ml = new ModelAndView();
		ml.addObject("list", list);
		ml.setViewName("main/user/info");
		return ml;
	}

	@RequestMapping(value = "/page/center")
	public ModelAndView userListById(HttpSession session) {
		String oppen_id = getOppen_id(session);
		user.setOppen_id(oppen_id);
		List<User> list = userService.listById(user);
		ModelAndView ml = new ModelAndView();
		ml.addObject("user", list);
		if(list.size()>0){
			ml.addObject("member_code",list.get(0).getMember_code());
		}else{
			ml.addObject("member_code","");
		}
		ml.setViewName("page/center");
		return ml;
	}

	//判断经销商是否存在
	@ResponseBody
	@RequestMapping(value = "/page/isMemberCodeExit")
	public Object isMemberCodeExit(String memberCode) {
		Membership mem=userService.selectMemberByMemberCode(memberCode);
		Map<String,Object> map=new HashMap<>();
		if(mem!=null){
			map.put("result","success");
		}else {
			map.put("result","failed");
		}
		return map;
	}

	@ResponseBody
	@RequestMapping(value = "/page/updateMemberCode")
	public Object updateMemberCode(String member_code, HttpSession session) {
		String oppen_id = getOppen_id(session);
		Map<String,Object> param=new HashMap<>();
		param.put("member_code",member_code);
		param.put("oppen_id",oppen_id);
		int result=userService.updateMemberCodeByOppenID(param);
		Map<String,Object> map=new HashMap<>();
		map.put("result","success");
		return map;
	}


}
