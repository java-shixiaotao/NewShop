package com.yq.controller;

import com.yq.entity.*;
import com.yq.service.TemplateGiftService;
import com.yq.service.TemplateService;
import com.yq.util.PageUtil;
import com.yq.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/")
public class TemplateGiftListCtrl extends StringUtil {
    @Autowired
    private TemplateGiftService templateGiftService;
    @Autowired
    private TemplateService templateService;

    @RequestMapping(value = "/main/templategiftdetailListById.html")
    public ModelAndView listById(Integer tgID) {
        TemplateGiftDetail temg=new TemplateGiftDetail();
        temg.setTgID(tgID);
        List<TemplateGiftDetail> list = templateGiftService.listById(temg);
        ModelAndView ml = new ModelAndView();
        ml.addObject("tempaltegiftdetaillist", list);
        ml.setViewName("main/templategift/templategiftdetailslist");
        return ml;
    }

    /**
     * 下载二维码zip包
     * @param tgID
     * @return
     */
    @RequestMapping(value = "/main/templategiftdetaildownload.html")
    public ResponseEntity<byte[]> download(Integer tgID, HttpServletRequest request, HttpServletResponse response) throws Exception{
        TemplateGiftDetail temg=new TemplateGiftDetail();
        temg.setTgID(tgID);
        return templateGiftService.download(temg,request,response);

    }

    @RequestMapping(value = "/main/templategiftList.html")
    public ModelAndView list(@RequestParam(defaultValue = "") String templateName,
                             @RequestParam(defaultValue = "1") Integer currentPage,
                             HttpServletRequest request)throws UnsupportedEncodingException {

        TemplateGift temg=new TemplateGift();
        templateName = java.net.URLDecoder.decode(templateName,"utf-8");

        temg.setTemplateName(templateName);

        int total = templateGiftService.count(temg);
        PageUtil.pager(currentPage, pagesize_1, total, request);
        temg.setPageSize(pagesize_1);
        temg.setCurrentNum(PageUtil.currentNum(currentPage, pagesize_1));
        List<TemplateGift> list = templateGiftService.list(temg);

        ModelAndView ml = new ModelAndView();
        ml.addObject("templategs", list);
        ml.setViewName("main/templategift/templategiftlist");
        return ml;
    }

    @RequestMapping(value = "/main/templategiftAdd.html")
    public ModelAndView addjsp() {
        ModelAndView ml = new ModelAndView();
        Goods goods = new Goods();
        Template template = new Template();
        List<Template> list = templateService.list(template);
        ml.addObject("templates", list);
        ml.setViewName("main/templategift/templategiftadd");
        return ml;
    }

    @ResponseBody
    @RequestMapping(value = "/main/templategiftInsert.html")
    public String insert(String template_id, String num, String templateName) throws Exception  {
        Map<String, Object> map = new HashMap<String, Object>();
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String createTime =sf.format(new Date());
        String actionTime =sf.format(new Date());
        map.put("template_id",template_id);
        map.put("createTime",createTime);
        map.put("actionTime",actionTime);
        map.put("templateName",templateName);
        map.put("num",num);

        return templateGiftService.inserttempg(map) + "";
    }
}
