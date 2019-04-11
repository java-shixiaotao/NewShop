package com.yq.controller;

import com.yq.entity.*;
import com.yq.service.*;
import com.yq.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/")
public class GoodsPicCtrl extends StringUtil {
	@Autowired
	private GoodsPicService goodsPicService;
	@RequestMapping(value = "getPic.html")
	public ModelAndView getPic(HttpServletRequest request) {
		String fileName=request.getParameter("filename");
		String filePath = request.getSession().getServletContext().getRealPath("/")+ "/upload/" + fileName;
		File f= new File(filePath);
		if(!f.exists()){
			Map<String,Object> params = new HashMap<String, Object>();
			params.put("filename",request.getParameter("filename"));
			GoodsPic goodsPic = goodsPicService.getByFileName(params);
			FileOutputStream fos = null;
			try {
				fos = new FileOutputStream(f);
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			}
			BufferedOutputStream bos = new BufferedOutputStream(fos);
			try {
				bos.write(goodsPic.getContent());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return new ModelAndView("redirect:/upload/"+fileName);

	}




}
