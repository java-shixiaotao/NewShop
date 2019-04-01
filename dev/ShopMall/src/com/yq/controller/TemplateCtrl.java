package com.yq.controller;

import com.yq.entity.*;
import com.yq.service.CategoryService;
import com.yq.service.GoodsService;
import com.yq.service.TemplateService;
import com.yq.util.PageUtil;
import com.yq.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/")
public class TemplateCtrl extends StringUtil {
    @Autowired
    private TemplateService templateService;
    @Autowired
    private GoodsService goodsService;
    @Autowired
    private CategoryService categoryService;

    /**
     * 通过id获取兑换券模板信息
     * @param template_id
     * @return
     */
    @RequestMapping(value = "/main/templateListById.html")
    public ModelAndView listById(String template_id) {
        Template tem=new Template();
        tem.setTemplate_id(Integer.parseInt(template_id));
        List<TemplateDetails> list = templateService.listById(tem);
        ModelAndView ml = new ModelAndView();
        ml.addObject("tempaltedlist", list);
        ml.setViewName("main/template/templatedetailslist");
        return ml;
    }

    /**
     * 新增兑换券模板
     * @param templateName
     * @param goods_id
     * @param goods_name
     * @param goods_img
     * @param goods_num
     * @param goods_spe
     * @param goods_price
     * @param goods_total_num
     * @param goods_total
     * @return
     * @throws UnsupportedEncodingException
     */
    @ResponseBody
    @RequestMapping(value = "/main/templateInsert.html")
    public String insert(String templateName, String goods_id,String goods_name,String goods_img,
                         String goods_num,String goods_spe,String goods_price,Float goods_total_num,
                         Float goods_total) throws UnsupportedEncodingException  {
        Map<String, Object> map = new HashMap<String, Object>();
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
        String createTime =sf.format(new Date());
        String actionTime =sf.format(new Date());

        templateName = java.net.URLDecoder.decode(templateName,"utf-8") ;
        map.put("templateName", templateName);
        map.put("goods_id", goods_id);
        map.put("goods_name", java.net.URLDecoder.decode(goods_name,"utf-8"));
        map.put("goods_img", goods_img);
        map.put("goods_num", goods_num);
        map.put("goods_spe", java.net.URLDecoder.decode(goods_spe,"utf-8"));
        map.put("goods_price", goods_price);
        map.put("goods_total_num", goods_total_num);
        map.put("goods_total", goods_total);
        map.put("createTime", createTime);
        map.put("actionTime", actionTime);
        return templateService.inserttemp(map) + "";
    }

    /**
     * 修改兑换券模板
     * @param template_id
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/main/templateUpstatus.html")
    public Object upstatus(Integer template_id) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("template_id", template_id);
        return templateService.upstatus(map) + "";
    }

    /**
     * 所有兑换券列表
     * @param status
     * @param templateName
     * @param currentPage
     * @param request
     * @return
     * @throws UnsupportedEncodingException
     */
    @RequestMapping(value = "/main/templateList.html")
    public ModelAndView list(Integer status,@RequestParam(defaultValue = "") String templateName,
                             @RequestParam(defaultValue = "1") Integer currentPage,
                             HttpServletRequest request)throws UnsupportedEncodingException {
        Template tem=new Template();
        templateName = java.net.URLDecoder.decode(templateName,"utf-8") ;

        tem.setTemplateName(templateName);

        int total = templateService.count(tem);
        PageUtil.pager(currentPage, pagesize_1, total, request);
        tem.setPageSize(pagesize_1);
        tem.setCurrentNum(PageUtil.currentNum(currentPage, pagesize_1));
        List<Template> list = templateService.list(tem);

        ModelAndView ml = new ModelAndView();
        ml.addObject("templates", list);
        ml.setViewName("main/template/templatelist");
        return ml;
    }

    /**
     * 获取商品信息
     * @param req
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/main/goodsListByCtgid.html")
    public  Map<String,Object>  listByCtgid(HttpServletRequest req) {
        Integer ctg_id=Integer.parseInt(req.getParameter("ctg_id").toString());
        Map<String,Object> map = new HashMap<>();
        Goods goods = new Goods();
        goods.setType(1);
        List<Goods> goodslist = goodsService.listByCtgid(goods);
        map.put("goods", goodslist);
        return map;
    }

    /**
     * 跳转到新增模板界面
     * @return
     */
    @RequestMapping(value = "/main/templateAdd.html")
    public ModelAndView addjsp() {
        ModelAndView ml = new ModelAndView();
        Goods goods = new Goods();
        Category category = new Category();
        category.setStatus(1);
        goods.setStatus(1);
        goods.setType(1);
        List<Category> list = categoryService.list(category);
        List<Goods> goodsList=goodsService.list(goods);
        ml.addObject("category", list);
        ml.addObject("goods", goodsList);
        ml.setViewName("main/template/templateadd");
        return ml;
    }
}
