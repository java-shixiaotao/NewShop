package com.yq.controller;

import com.weixin.service.WxSettingService;
import com.yq.entity.GoodsPic;
import com.yq.service.GoodsPicService;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.util.Date;

@Controller
@RequestMapping("/main")
public class FileCtrl {
	@Autowired
	private WxSettingService wxSettingService;
	@Autowired
	private GoodsPicService goodsPicService;
	@ResponseBody
	@RequestMapping(value="/upload")
	public Object upload(@RequestParam MultipartFile file, HttpServletRequest request){
			String realpath = request.getSession().getServletContext().getRealPath(""); 
			String path = realpath+"/upload";
			String suffix="";
			String fileName=((DiskFileItem) ((CommonsMultipartFile) file).getFileItem()).getName();
			if(fileName.contains(".")){
				suffix=fileName.substring(fileName.lastIndexOf("."),fileName.length());
			}
	        fileName = new Date().getTime()+suffix;
	        File targetFile = new File(path, fileName);  
	        if(!targetFile.exists()){  
	            targetFile.mkdirs();  
	        }
	        //保存  
	        try {  
	            file.transferTo(targetFile);
	            //保存到数据库中
				FileInputStream fis = new FileInputStream(targetFile);
				ByteArrayOutputStream bos = new ByteArrayOutputStream();
				byte[] b = new byte[1024];
				int n;
				while ((n = fis.read(b)) != -1)
				{
					bos.write(b, 0, n);
				}
				fis.close();
				bos.close();
				GoodsPic goodsPic=new GoodsPic();
				goodsPic.setFilename(fileName);
				goodsPic.setContent( bos.toByteArray());
				goodsPicService.insertPic(goodsPic);
	        } catch (Exception e) {  
	            e.printStackTrace();  
	        } 
//	        WxSetting ws = wxSettingService.selectByPrimaryKey(1);
//	        String link = ws.getLink();
//	        if(StringUtils.isNotEmpty(link)){
//	        	link = link.replace("/chihaodian", "");
//	        }
	        String url = "/getPic?filename="+fileName;
//	        StringBuffer url = request.getRequestURL();  
//			String tempContextUrl = url.delete(url.length() - request.getRequestURI().length(), url.length()).append("/").append("upload/")
//					.append(fileName).toString();
			System.out.println(url);
			return url;  
	}
}
