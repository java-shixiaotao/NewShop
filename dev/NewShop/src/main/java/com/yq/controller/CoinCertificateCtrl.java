package com.yq.controller;

import com.yq.entity.Category;
import com.yq.entity.Goods;
import com.yq.service.CategoryService;
import com.yq.service.GoodsService;
import com.yq.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping
public class CoinCertificateCtrl extends StringUtil {
    @Autowired
    private GoodsService goodsService;
    @Autowired
    private CategoryService categoryService;

    @RequestMapping(value = "/main/coinCertificateList")
    public ModelAndView list(
            @RequestParam(defaultValue = "1") Integer currentPage,
            HttpServletRequest request) {

        ModelAndView ml = new ModelAndView();
        ml.addObject("cps", null);
        ml.setViewName("main/coincertificate/list");
        return ml;
    }

    @RequestMapping(value = "/main/coinCertificateAdd")
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
        ml.setViewName("main/coincertificate/add");
        return ml;
    }

    @ResponseBody
    @RequestMapping(value = "/main/goodsListByCtgid1")
    public  Map<String,Object>  listByCtgid(HttpServletRequest req) {
        Integer ctg_id=Integer.parseInt(req.getParameter("ctg_id").toString());
        Map<String,Object> map = new HashMap<>();
        Goods goods = new Goods();
        goods.setType(1);
        List<Goods> goodslist = goodsService.listByCtgid(goods);
        map.put("goods", goodslist);
        return map;
    }
}
