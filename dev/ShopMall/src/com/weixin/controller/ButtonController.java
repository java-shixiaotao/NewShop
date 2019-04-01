package com.weixin.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.weixin.entity.Button;
import com.weixin.entity.ViewButton;
import com.weixin.service.ButtonService;
import com.weixin.util.MenuUtil;

@Controller
@RequestMapping
public class ButtonController {
	@Autowired
	private ButtonService buttonService ;
//	private Button button;
	private Map<String,Object> map = new HashMap<String, Object>();
	Gson gson = new Gson();
	@ResponseBody
	@RequestMapping(value="/main/buttonInsert.html")
	public String insert(Button button){
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String id =Long.toString(new Date().getTime());
		String message="";
		int rs  =0;
		button.setId(id);
		int count=0;
		if(button.getLevel()==1){
			button.setSuper_id(null);
			count =	buttonService.selectCount(button);
			if(count>=3){
				message="button is already >= 3";
			}
			else{
				button.setSuper_id(id);
				button.setAdd_time(sf.format(new Date()));
				rs  =	buttonService.insert(button);
			}
		}else{
			//button.setSuper_id(id);
			count =	buttonService.selectCount(button);
			if(count>=5){
				message="button is already >= 5";
			}else{
				button.setAdd_time(sf.format(new Date()));
				rs  =	buttonService.insert(button);
			}
		}
		if(rs==-1){
			message="insert button error!";
		}
		map.put("rs",rs);
		map.put("message",message);
		return gson.toJson(map);
	}
	@ResponseBody
	@RequestMapping(value="/main/buttonUpdate.html")
	public String update(Button button){
		int  rs  =	buttonService.updateByPrimaryKeySelective(button);
		if(rs==-1){
			map.put("message","update button is error!");
		}
		map.put("rs",rs);
		return gson.toJson(map);
	}
	
	@ResponseBody
	@RequestMapping(value="/main/buttonSort.html")
	public String sort(Button button){
		int  rs  =	buttonService.sort(button);
		if(rs==-1){
			map.put("message","sort is error!");
		}
		map.put("rs",rs);
		return gson.toJson(map);
	}
	@ResponseBody
	@RequestMapping(value="/main/buttonDelete.html")
	public String delete(Button button){
		int  rs  = 0 ;
		String message="";
		if(button.getLevel()==1){
			button.setLevel(2);
			button.setSuper_id(button.getId());
			if(buttonService.selectCount(button)>0){
				rs = -5 ;
				message = "此主菜单下有子菜单，请先删除该下子菜单!";
			}else{
				rs  =	buttonService.deleteByPrimaryKey(button.getId());
			}
		}else{
			rs  =	buttonService.deleteByPrimaryKey(button.getId());
		}
		
		if(rs==-1){
			message = "sort is error!";
		}
		map.put("rs",rs);
		map.put("message",message);
		return gson.toJson(map);
	}
	
	@RequestMapping(value="/main/buttonById.html")
	public ModelAndView getButton(String id,ModelAndView ml){
		ml.addObject("list",buttonService.selectByPrimaryKey(id));
		ml.setViewName("main/button/info");
		return  ml ;
	}
	
	@RequestMapping(value="/main/buttonList.html")
	public ModelAndView getList(Button button,ModelAndView ml){
		button.setLevel(1);
		List<Button> mainBtn =	buttonService.select(button);
		for(int i = 0;i < mainBtn.size();i++){
			button.setLevel(2);
			button.setSuper_id(mainBtn.get(i).getId());
			List<Button> btn =	buttonService.select(button);
			map.put("btn"+i, btn);
		}
		map.put("mainBtn", mainBtn);
		ml.addObject("map",map);
		ml.setViewName("main/button/list");
		return  ml ;
	}
	@RequestMapping(value="/main/addButton.html")
	public ModelAndView addButton(Button button,ModelAndView ml){
		button.setLevel(1);
		List<Button> list =	buttonService.select(button);
		ml.addObject("list",list);
		ml.setViewName("main/button/add");
		return  ml ;
	}
	
	@ResponseBody
	@RequestMapping(value = "/main/cMenu.html")
	public String cMenu(Button button){
		button.setLevel(1);
		List<Button> mainBtn =	buttonService.select(button);
		button.setLevel(2);
		Map<String,Object> map = new HashMap<String, Object>();
		for(int i = 0;i < mainBtn.size();i++){
			button.setSuper_id(mainBtn.get(i).getId());
			List<Button> btn =	buttonService.select(button);
			List<Object> vl = new ArrayList<Object>();
			if(btn.size()==0){
				mainBtn.get(i).setUrl(mainBtn.get(i).getValue());
			}
			else{
			for(int m = 0;m < btn.size();m++){
			if(btn.get(m).getType().equals("view")){
				ViewButton vb = new ViewButton();
				vb.setName(btn.get(m).getName());
				vb.setType(btn.get(m).getType());
				vb.setUrl(btn.get(m).getValue());
				vl.add(vb);
				}
			}
			mainBtn.get(i).setSub_button(vl);
			}
		}
		map.put("button",mainBtn);
		return gson.toJson(MenuUtil.createMenu(map));
	}
}
