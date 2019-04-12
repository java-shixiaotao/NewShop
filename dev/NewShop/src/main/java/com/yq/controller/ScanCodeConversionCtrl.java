package com.yq.controller;

import com.google.gson.Gson;
import com.weixin.util.JsSignUtil;
import com.yq.entity.ViewGiftDetail;
import com.yq.service.ScancodeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/")
public class ScanCodeConversionCtrl {

    @Autowired
    private ScancodeService scancodeService;

    /**
     * 页面接入jssdk，通过ajax调用
     * @param url
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/page/jsSignIn",method = RequestMethod.POST)
    public String jsSignIn(String url) {
        Gson retJson =  new Gson();
        Map<String, String> signMap = JsSignUtil.sign(url);
        return retJson.toJson(signMap);
    }

    /**
     * 微信公众号--》米城--》我的--》扫码兑换
     * @param request
     * @param session
     * @return
     */
    @RequestMapping(value = "/page/scanCode")
    public ModelAndView toScanCodeHtml(HttpServletRequest request, HttpSession session) {
        String url = request.getRequestURI() ;
        Map<String, String> signMap = JsSignUtil.sign(url);
        ModelAndView ml = new ModelAndView();
        ml.addObject("signMap", signMap);
        ml.setViewName("page/scancode");
        return ml;
    }

    /**
     * 判断是否可用 券码
     * @param scancode
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/page/checkScanCode",method = RequestMethod.POST)
    public String checkScanCode(String scancode) {
        Gson retJson =  new Gson();
        Map<String,String> retMap = new HashMap<String,String>();
        List<ViewGiftDetail> cpsList = scancodeService.selectByGiftId(scancode);
        boolean flag = false;
        if(cpsList !=null && cpsList.size() > 0){
            //取得券码
            ViewGiftDetail tempGift = cpsList.get(0);
            String tempStatus = tempGift.getStatus();
            //券码未兑换 0
            if("0".equals(tempStatus)){
                flag = true;
            }
        }
        if(flag){
            retMap.put("flag","true");
        }else{
            retMap.put("flag","false");
        }
        return retJson.toJson(retMap);
    }



    /**
     * 扫描后或者直接点兑换 ，根据传来的优惠券码跳转到订单页面（与原来的js页面不同）
     * @param cpsCode 优惠券码
     * @param request
     * @param session
     * @return
     */
//    @RequestMapping(value = "/page/afterScanCode")
//    public ModelAndView afterScanHtml(String cpsCode,HttpServletRequest request, HttpSession session){
//        //根据传来的优惠码，查询优惠码视图，
//        System.out.println("兑换页面");
//        return null;
//    }

}
