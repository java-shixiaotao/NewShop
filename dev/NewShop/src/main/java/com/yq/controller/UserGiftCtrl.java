package com.yq.controller;

import com.yq.entity.*;
import com.yq.service.AddressService;
import com.yq.service.UserGiftServiceImpl;
import com.yq.service.WxSendMsgService;
import com.yq.util.StringUtil;
import com.yq.util.giftCode.GiftCodeGen;
import com.yq.util.orderID.OrderIDUtil;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.*;


@Controller
public class UserGiftCtrl extends StringUtil {

    @Autowired
    private UserGiftServiceImpl userGiftService;

    @Autowired
    private AddressService addressService;

    @Autowired
    private WxSendMsgService wxSendMsgService;

    /**
     * 我的电子券展示页面
     * @param session
     * @param isAll
     * @return
     */
    @RequestMapping(value = "/page/userGiftList")
    public ModelAndView userGiftListByOppenId(HttpSession session, @RequestParam(defaultValue = "0")int isAll) {
        ModelAndView ml = new ModelAndView();
        Map<String, Object> map = new HashMap<>();
        String oppen_id = getOppen_id(session);
        List<UserGiftBean> list = userGiftService.getUserGiftLstByOpenID(oppen_id);
        List<UserGiftBean> list2= userGiftService.getShareLstByOpenID(oppen_id);
        List<UserGiftBean> list0 = new ArrayList<>();
        List<UserGiftBean> list1 = new ArrayList<>();
        if (list.size() > 0) {
            for (int i = 0; i < list.size(); i++) {
                if (list.get(i).getStatus() == 0) {
                    list0.add(list.get(i));
                } else if (list.get(i).getStatus() == 1) {
                    list1.add(list.get(i));
                }
            }
        }
        map.put("list", list);
        map.put("list0", list0);
        map.put("list1", list1);
        map.put("list2", list2);
        map.put("isAll",isAll);
        ml.addObject("map", map);
        ml.setViewName("page/user-gift-list");
        return ml;
    }

    /**
     * 分享链接或者扫码兑换
     * @param share_id
     * @param addr_id
     * @param session
     * @return
     */
    @RequestMapping(value = "/page/conversionList")
    public ModelAndView conversionOrderList(String share_id, @RequestParam(defaultValue = "0") Integer addr_id, HttpSession session) {
        ModelAndView ml = new ModelAndView();
        String oppen_id = getOppen_id(session);
        Address address = new Address();
        List<Address> addr;
        if (addr_id == 0) {
            address.setOppen_id(oppen_id);
            addr = addressService.list(address);
        } else {
            address.setAddr_id(addr_id);
            addr = addressService.listById(address);
        }
        int order_type = 6;
        UserGiftBean bean;
        List<UserGiftBean> beanList = userGiftService.getUserGiftBeanByShareID(share_id);
        if (beanList == null || beanList.size()==0) {
            order_type = 7;
            bean = userGiftService.getViewGiftBeanByGiftID(share_id);
        }else {
            bean= beanList.get(0);
            bean.setGift_id(share_id);
            bean.setGoods_num(String.valueOf(beanList.size()));
        }
        ml.addObject("order_type", order_type);
        ml.addObject("addr", addr);
        ml.addObject("gift", bean);
        ml.addObject("addr_id", addr_id);
        ml.setViewName("page/conversion-list");
        return ml;
    }

    /**
     * 直接兑换
     * @param share_id
     * @param addr_id
     * @param session
     * @return
     */
    @RequestMapping(value = "/page/direct_conversionList")
    public ModelAndView direct_conversionList(String share_id, @RequestParam(defaultValue = "0") Integer addr_id, HttpSession session) {
        ModelAndView ml = new ModelAndView();
        String oppen_id = getOppen_id(session);
        Address address = new Address();
        List<Address> addr;
        if (addr_id == 0) {
            address.setOppen_id(oppen_id);
            addr = addressService.list(address);
        } else {
            address.setAddr_id(addr_id);
            addr = addressService.listById(address);
        }
        int order_type = 6;
        List<String> shareList;
        if(share_id.contains(",")){
            String[] split = share_id.split(",");
            shareList=Arrays.asList(split);
        }else {
            shareList=new ArrayList<>();
            shareList.add(share_id);
        }
        Map<String,Object> param=new HashMap<>();
        param.put("gift_ids",shareList);
        List<UserGiftBean> beanList = userGiftService.getUserGiftBeanByGiftID(param);
        UserGiftBean gift=beanList.get(0);
        gift.setGoods_num(String.valueOf(beanList.size()));
        gift.setGift_id(share_id);
        ml.addObject("order_type", order_type);
        ml.addObject("addr", addr);
        ml.addObject("gift", gift);
        ml.addObject("addr_id", addr_id);
        ml.setViewName("page/directConversion-list");
        return ml;
    }

    /**
     * 兑换地址页面
     * @param session
     * @param gift_id
     * @return
     */
    @RequestMapping(value = "/page/conversionAddressLst")
    public ModelAndView list(HttpSession session, String gift_id) {
        Address address = new Address();
        address.setOppen_id(getOppen_id(session));
        List<Address> list = addressService.list(address);
        ModelAndView ml = new ModelAndView();
        ml.addObject("list", list);
        ml.addObject("gift_id", gift_id);
        ml.setViewName("page/conversion-address-list");
        return ml;
    }


    private List<Goods> convertGiftToGoodLst(UserGiftBean bean) {
        List<Goods> goodsLst = new ArrayList<>();
        String[] id = bean.getGoods_id().split(",-=");
        String[] img = bean.getGoods_img().split(",-=");
        String[] name = bean.getGoods_name().split(",-=");
        String[] price = bean.getGoods_price().split(",-=");
        String[] num = bean.getGoods_num().split(",-=");
        String[] spe = bean.getGoods_spe().split(",-=");
        for (int i = 0; i < id.length; i++) {
            Goods goods = new Goods();
            goods.setGoods_id(Integer.valueOf(id[i]));
            goods.setGoods_name(name[i]);
            goods.setGoods_price(Float.valueOf(price[i]));
            goods.setGoods_img(img[i]);
            goods.setGoods_spe(spe[i]);
            goodsLst.add(goods);
        }
        return goodsLst;
    }

    /**
     * 直接下单兑换页面
     * @param goods_id
     * @param goods_name
     * @param goods_img
     * @param goods_spe
     * @param goods_price
     * @param goods_num
     * @param goods_total
     * @param addr_name
     * @param note
     * @param spe_type
     * @param order_type
     * @param gift_id
     * @param session
     * @return
     * @throws UnsupportedEncodingException
     */
    @ResponseBody
    @RequestMapping(value = "/page/direct_conversion", method = RequestMethod.POST)
    public Map<String, String> direct_conversion(String goods_id, String goods_name, String goods_img,
                                          String goods_spe, String goods_price,String goods_num,
                                          Float goods_total,String addr_name, String note,
                                          int spe_type,int order_type, String gift_id, HttpSession session) throws UnsupportedEncodingException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String add_time = sdf.format(new Date());
        String oppen_id = getOppen_id(session);

        Order order = new Order();
        String order_id = OrderIDUtil.getOrderID();
        if (StringUtils.isNotEmpty(goods_name)) {
            goods_name = java.net.URLDecoder.decode(goods_name, "utf-8");
        }
        if (StringUtils.isNotEmpty(goods_spe)) {
            goods_spe = java.net.URLDecoder.decode(goods_spe, "utf-8");
        }
        if (StringUtils.isNotEmpty(addr_name)) {
            addr_name = java.net.URLDecoder.decode(addr_name, "utf-8");
        }
        if (StringUtils.isNotEmpty(note)) {
            note = java.net.URLDecoder.decode(note, "utf-8");
        }
        order.setOrder_id(order_id);
        order.setGoods_id(goods_id);
        order.setGoods_name(goods_name);
        order.setGoods_img(goods_img);
        order.setGoods_spe(goods_spe);
        order.setSpe_type(spe_type);
        order.setGoods_price(goods_price);
        order.setGoods_num(goods_num);
        order.setGoods_total(0f);
        order.setAddr_name(addr_name);
        order.setOppen_id(oppen_id);
        order.setAdd_time(add_time);
        order.setUpdate_time(add_time);
        order.setGoods_total(goods_total);
        order.setStatus(1);
        order.setNote(note);
        order.setOrder_type(order_type);
        order.setGift_id(gift_id);
        Map<String, String> map = new HashMap<>();
        try {
            int update = userGiftService.direct_conversion(order);
            if (update == 0) {
                map.put("result", "券已兑换，不可重复兑换");
            } else {
                map.put("result", "兑换成功");
                //微信发送 电子券兑换成功 消息
                wxSendMsgService.conversionMsg(order_id);
            }
        } catch (Exception e) {
            map.put("result", "券已兑换，不可重复兑换");
        }
        return map;
    }

    /**
     * 分享兑换或者扫码兑换页面
     * @param goods_id
     * @param goods_name
     * @param goods_img
     * @param goods_spe
     * @param goods_price
     * @param goods_num
     * @param goods_total
     * @param addr_name
     * @param note
     * @param spe_type
     * @param order_type
     * @param gift_id
     * @param session
     * @return
     * @throws UnsupportedEncodingException
     */
    @ResponseBody
    @RequestMapping(value = "/page/conversion", method = RequestMethod.POST)
    public Map<String, String> conversion(String goods_id, String goods_name, String goods_img,
                                          String goods_spe, String goods_price,String goods_num,
                                          Float goods_total,String addr_name, String note,
                                          int spe_type,int order_type, String gift_id, HttpSession session) throws UnsupportedEncodingException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String add_time = sdf.format(new Date());
        String oppen_id = getOppen_id(session);

        Order order = new Order();
        String order_id = OrderIDUtil.getOrderID();
        if (StringUtils.isNotEmpty(goods_name)) {
            goods_name = java.net.URLDecoder.decode(goods_name, "utf-8");
        }
        if (StringUtils.isNotEmpty(goods_spe)) {
            goods_spe = java.net.URLDecoder.decode(goods_spe, "utf-8");
        }
        if (StringUtils.isNotEmpty(addr_name)) {
            addr_name = java.net.URLDecoder.decode(addr_name, "utf-8");
        }
        if (StringUtils.isNotEmpty(note)) {
            note = java.net.URLDecoder.decode(note, "utf-8");
        }
        order.setOrder_id(order_id);
        order.setGoods_id(goods_id);
        order.setGoods_name(goods_name);
        order.setGoods_img(goods_img);
        order.setGoods_spe(goods_spe);
        order.setSpe_type(spe_type);
        order.setGoods_price(goods_price);
        order.setGoods_num(goods_num);
        order.setGoods_total(0f);
        order.setAddr_name(addr_name);
        order.setOppen_id(oppen_id);
        order.setAdd_time(add_time);
        order.setUpdate_time(add_time);
        order.setGoods_total(goods_total);
        order.setStatus(1);
        order.setNote(note);
        order.setOrder_type(order_type);
        order.setGift_id(gift_id);
        Map<String, String> map = new HashMap<>();
        try {
            int update = userGiftService.conversion(order);
            if (update == 0) {
                map.put("result", "券已兑换，不可重复兑换");
            } else {
                map.put("result", "兑换成功");
                //微信发送 电子券兑换成功 消息
                wxSendMsgService.conversionMsg(order_id);
            }
        } catch (Exception e) {
            map.put("result", "系统异常");
        }
        return map;
    }

    /**
     * 电子券打包页面
     * @param session
     * @param gift_ids
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/page/giftPackage")
    public Object giftPackage(HttpSession session, String gift_ids) {
        List<String> ids=new ArrayList<>();
        if(gift_ids.contains(",")){
            ids=Arrays.asList(gift_ids.split(","));
        }else {
            ids.add(gift_ids);
        }
        Map<String,Object> param=new HashMap<>();
        Map<String,Object> result=new HashMap<>();
        param.put("gift_ids",ids);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = sdf.format(new Date());
        List<UserGiftBean> giftBeans=userGiftService.getUserGiftLstByGift_ids(param);
        Share share=new Share();
        share.setOppen_id(getOppen_id(session));
        share.setCreate_time(time);
        share.setUpdate_time(time);
        share.setIs_exchange(0);
        share.setIs_validate(1);
        share.setId(GiftCodeGen.getGiftCodeLst(0, 1, 16).get(0));
        for(UserGiftBean gift:giftBeans){
            if(gift.getSpe_type()==0){
                share.setShare_box_num(share.getShare_box_num()+1);
            }else {
                share.setShare_pot_num(share.getShare_pot_num()+1);
            }
            if(gift.getStatus()==1){
                result.put("code","failed");
                result.put("msg","您打包的券已兑换");
                return result;
            }else if(gift.getStatus()==2){
                result.put("code","failed");
                result.put("msg","您打包的券已分享");
                return result;
            }
        }
        param.put("share_id",share.getId());
        userGiftService.updateGiftStatusByGiftIDs(param);
        userGiftService.insertShare(share);
        result.put("code","success");
        result.put("share",share);
        return result;
    }

    /**
     * 取消打包功能
     * @param shareID
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/page/cancelGiftPackage")
    public Object cancelGiftPackage(String shareID) {
        Map<String,Object> map=new HashMap<>();
        Map<String,Object> param=new HashMap();
        param.put("share_id",shareID);
        param.put("status",0);
        int result=userGiftService.cancelGiftPackage(shareID);
        if(result==0){
            map.put("code","failed");
            map.put("msg","撤销失败，券包已失效或已兑换");
        }else {
            userGiftService.updateUserGiftStatusByMap(param);
            map.put("code","success");
            map.put("msg","撤销成功");
        }
        return map;
    }
}
