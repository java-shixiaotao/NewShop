package com.yq.controller;


import com.yq.entity.User;
import com.yq.service.UserService;
import com.yq.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/")
public class IndexCtrl extends StringUtil{
	@Autowired
	private UserService userService;

	@RequestMapping(value="/main/main")
	public ModelAndView mainindex(){
		return new ModelAndView("main/index");
	}

	@RequestMapping(value="/page/index")
	public ModelAndView index(HttpServletRequest request, HttpSession session){
		//是否弹菜单
		String showGoumai = request.getParameter("showGoumai");
		String oppen_id = getOppen_id(session);
		User user = new User();
		user.setOppen_id(oppen_id);
		List<User> list = userService.listById(user);
		ModelAndView ml = new ModelAndView();
		if(list.size()>0){
			ml.addObject("member_code",list.get(0).getMember_code());
		}else{
			ml.addObject("member_code","");
		}
		ml.addObject("showGoumai",showGoumai);
		ml.setViewName("page/index");
		return ml;
	}

	
}
