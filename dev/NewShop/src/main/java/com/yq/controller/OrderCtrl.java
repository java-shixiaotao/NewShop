package com.yq.controller;

import com.weixin.pay.action.TopayServlet;
import com.yq.entity.*;
import com.yq.service.*;
import com.yq.util.PageUtil;
import com.yq.util.StringUtil;
import com.yq.util.orderID.OrderIDUtil;
import net.sf.json.JSONArray;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping
public class OrderCtrl extends StringUtil {
    @Autowired
    private OrderService orderService;

    @Autowired
    private CartService cartService;

    @Autowired
    private CouponsService couponsService;

    @Autowired
    private AddressService addressService;

    @Autowired
    private FreightService freightService;

    @Autowired
    private UserService userService;

    @Autowired
    private AreaService areaService;

    @Autowired
    private GoodsService goodsService;

    @Autowired
    private WxSendMsgService wxSendMsgService;

    @Autowired
    private MembershipService membershipService;

    @Autowired
    private UserGiftService userGiftService;

    SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");

    private Logger log = Logger.getLogger(this.getClass());
//	WechatPushMassage wechatPushMassage = new WechatPushMassage();

    /**
     * 订单插入页面
     * @param goods_id
     * @param goods_name
     * @param goods_img
     * @param goods_spe
     * @param spe_type
     * @param goods_price
     * @param goods_num
     * @param goods_total
     * @param addr_name
     * @param memberCode
     * @param type
     * @param note
     * @param session
     * @return
     * @throws UnsupportedEncodingException
     */
    @ResponseBody
    @RequestMapping(value = "/page/orderInsert.html")
    public Map insert(String goods_id, String goods_name, String goods_img,
                         String goods_spe, int spe_type, String goods_price,
                         String goods_num, double goods_total,
                         String addr_name, String memberCode,int type,
                         String note, HttpSession session) throws UnsupportedEncodingException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Map<String, Object> result = new HashMap<>();
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
        order.setGoods_price(goods_price);
        order.setGoods_num(goods_num);
        order.setGoods_total(goods_total);
        order.setAddr_name(addr_name);
        order.setOppen_id(oppen_id);
        order.setAdd_time(add_time);
        order.setStatus(0);
        order.setNote(note);
        order.setSpe_type(spe_type);
        order.setUpdate_time(add_time);
        if(StringUtils.isBlank(memberCode)){
            order.setMember_id(0);
            if(type==0){
                //消费者向公司购买实物
                order.setOrder_type(0);
            }else{
                //消费者向公司购买电子券
                order.setOrder_type(1);
            }
        }else{
            long memberID=membershipService.selectMemberIDByCode(memberCode);
            order.setMember_id(memberID);
            if(type==0){
                //消费者向经销商购买实物
                order.setOrder_type(2);
            }else{
                //消费者向经销商购买电子券
                order.setOrder_type(3);
            }
        }
        int insert = orderService.insert(order);
        if(insert==1){
            result.put("order_id",order_id);
        }
        return result;
    }

    @ResponseBody
    @RequestMapping(value = "/page/orderUpdate.html")
    public Object update(String order_id, @RequestParam(defaultValue = "1") Integer status, HttpSession session) {
        Map<String, Object> map = new HashMap<>();
        // setOppen_id("111", session);//测试代码，模仿登录
        // map.put("oppen_id", getOppen_id(session));
        map.put("order_id", order_id);
        map.put("status", status);
        return orderService.upstatus(map) + "";
    }

    @ResponseBody
    @RequestMapping(value = "/main/orderprice.html")
    public Object orderprice(String order_id, String goods_total, HttpSession session) {
        Map<String, Object> map = new HashMap<>();
        SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        String reorder_id = sf.format(new Date());
        map.put("status", 0);
//		map.put("order_id", order_id);
//		map.put("reorder_id", reorder_id);
//		orderService.upstatus(map);
        map.put("order_id", order_id);
        map.put("reorder_id", reorder_id);
        map.put("goods_total", goods_total);
        return orderService.upprice(map) + "";
    }

    @ResponseBody
    @RequestMapping(value = "/main/orderUpstatus.html")
    public Object upstatus(Integer status, String order_id, String express_dm, String express_hm, String express_name) throws UnsupportedEncodingException {
        if (StringUtils.isNotEmpty(express_name)) {
            express_name = java.net.URLDecoder.decode(express_name, "utf-8");
        }
        Map<String, Object> map = new HashMap<>();
        map.put("order_id", order_id);
        map.put("status", status);
        map.put("express_dm", express_dm);
        map.put("express_hm", express_hm);
        map.put("express_name", express_name);
        int rs = orderService.upstatus(map);
        //微信发送消息商家已经发货
        if (status == 2) {//发货
            wxSendMsgService.deliverGoodsMsg(order_id);
        } else if (status == -6) {
            //退款
            //把对应的电子券改成不可用状态
            Order queryOrder = new Order();
            queryOrder.setOrder_id(order_id);
            List<Order> orderList = orderService.listById(queryOrder);
            if (orderList.size() > 0) {
                //电子券id
                HashMap<String, Object> updateMap = new HashMap<String, Object>();
                updateMap.put("status", 2);//已退款
                //不判断
                userGiftService.updateTemplateGiftStatusByMap(updateMap);
                userGiftService.updateUserGiftStatusByMap(updateMap);
            }
        }
//		if (rs == 1) {
//			order.setOrder_id(order_id);
//			List<Order> list = orderService.listById(order);
//			if (status == -6) {
//				map.put("result", "商家已同意退款");
//			} else {
//				map.put("result", "商家已发货");
//			}
//
//			map.put("body", list.get(0).getGoods_name().replace("-=", ""));
//			map.put("price", list.get(0).getGoods_total() + "");
//			map.put("oppen_id", list.get(0).getOppen_id());
////			wechatPushMassage.pushMessage(map);
//		}
        return rs + "";
    }

    @ResponseBody
    @RequestMapping(value = "/main/orderDel.html")
    public Object delete(String order_id) {
        Map<String, Object> map = new HashMap<>();
        map.put("order_id", order_id);
        return orderService.delete(map) + "";
    }

    /**
     * 前台订单展示页面
     * @param status
     * @param oppen_id
     * @param session
     * @return
     */
    @RequestMapping(value = "/page/orderList.html")
    public ModelAndView list(@RequestParam(defaultValue = "-2") Integer status, String oppen_id, HttpSession session) {
        // setOppen_id("111", session);// 测试代码，模仿登录
        Map<String, Object> map = new HashMap<>();
        Order order = new Order();
        order.setOppen_id(getOppen_id(session));
        order.setStatus(-2);
        order.setGoods_name("");
        order.setAddr_name("");
        List<Order> list = orderService.list(order); // 全部订单
        order.setStatus(0);
        List<Order> list0 = orderService.list(order);// 待付款订单
        order.setStatus(1);
        List<Order> list1 = orderService.list(order);// 已付款待发货订单
        order.setStatus(2);
        List<Order> list2 = orderService.list(order);// 已发货订单
        map.put("list", list);
        map.put("list0", list0);
        map.put("list1", list1);
        map.put("list2", list2);
        ModelAndView ml = new ModelAndView();
        ml.addObject("map", map);
        ml.setViewName("page/order-list");
        return ml;
    }

    @ResponseBody
    @RequestMapping(value = "/main/order.html")
    public void orderListJs(@RequestParam(value = "c", defaultValue = "1") Integer currentPage,
                            @RequestParam(value = "p", defaultValue = "0") Integer pageSize, HttpServletRequest request,
                            HttpServletResponse response) throws IOException {
        Order order = new Order();
        int total = orderService.listJsonCount(order);
        PageUtil.pager(currentPage, pageSize, total, request);
        order.setPageSize(pageSize);
        order.setCurrentNum(PageUtil.currentNum(currentPage, pageSize));
        List<Order> list = orderService.listJson(order);
        List<GoodsOther> goList = new ArrayList<GoodsOther>();
        if (list.size() > 0) {
            for (int i = 0; i < list.size(); i++) {
                List<GoodsJson> goodsList = new ArrayList<GoodsJson>();
                String[] gName = list.get(i).getGoods_name().split(",-=");
                String[] gNum = list.get(i).getGoods_num().split(",-=");
                String[] gPrice = list.get(i).getGoods_price().split(",-=");
                for (int m = 0; m < gName.length; m++) {
                    GoodsJson gj = new GoodsJson();
                    gj.setGoods_name(gName[m]);
                    gj.setGoods_num(gNum[m]);
                    gj.setGoods_price(gPrice[m]);
                    goodsList.add(gj);
                }
                GoodsOther go = new GoodsOther();
                go.setAddr_name(list.get(i).getAddr_name());
                go.setNote(list.get(i).getNote());
                go.setAdd_time(list.get(i).getAdd_time());
                go.setGoodsList(goodsList);
                go.setTotal(total);
                goList.add(go);
            }
        }
        JSONArray json = JSONArray.fromObject(goList);
//		return gson.toJson(map);
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json.toString());
    }

    /**
     * 后台订单展示页面
     * @param currentPage
     * @param status
     * @param start_time
     * @param end_time
     * @param ctg_name
     * @param goods_name
     * @param addr_name
     * @param request
     * @param session
     * @return
     * @throws UnsupportedEncodingException
     */
    @RequestMapping(value = "/main/orderList.html")
    public ModelAndView orderList(@RequestParam(defaultValue = "1") Integer currentPage,
                                  @RequestParam(defaultValue = "-2") Integer status, @RequestParam(defaultValue = "") String start_time,
                                  @RequestParam(defaultValue = "") String end_time, @RequestParam(defaultValue = "") String ctg_name,
                                  @RequestParam(defaultValue = "") String goods_name, @RequestParam(defaultValue = "") String addr_name,
                                  HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
        Map<String, Object> map = new HashMap<>();
        Order order = new Order();
        start_time = java.net.URLDecoder.decode(start_time, "utf-8");
        end_time = java.net.URLDecoder.decode(end_time, "utf-8");
        ctg_name = java.net.URLDecoder.decode(ctg_name, "utf-8");
        goods_name = java.net.URLDecoder.decode(goods_name, "utf-8");
        addr_name = java.net.URLDecoder.decode(addr_name, "utf-8");
        order.setOppen_id("");
        order.setStatus(status);
        order.setGoods_name(goods_name);
        order.setAddr_name(addr_name);
        order.setStart_time("".equals(start_time)? "" : (start_time+ " 00:00:00"));
        order.setEnd_time("".equals(end_time) ? "" : (end_time+ " 23:59:59"));
        int total = orderService.count(order);
        PageUtil.pager(currentPage, pagesize_1, total, request);
        order.setPageSize(pagesize_1);
        order.setCurrentNum(PageUtil.currentNum(currentPage, pagesize_1));
        List<Order> list = orderService.list(order); // 全部订单
        if (list.size() > 0) {
            for (int i = 0; i < list.size(); i++) {
                List<Order> ordList = new ArrayList<Order>();
                String[] gId = list.get(i).getGoods_id().split(",-=");
                String[] gName = list.get(i).getGoods_name().split(",-=");
                String[] gImg = list.get(i).getGoods_img().split(",-=");
                String[] gPrice = list.get(i).getGoods_price().split(",-=");
                String[] gNum = list.get(i).getGoods_num().split(",-=");

                for (int m = 0; m < gId.length; m++) {
                    Order ord = new Order();
                    ord.setGoods_id(gId[m]);
                    ord.setGoods_name(gName[m]);
                    ord.setGoods_img(gImg[m]);
                    ord.setGoods_price(gPrice[m]);
                    ord.setGoods_num(gNum[m]);
                    ordList.add(ord);
                }
                map.put("ord" + i, ordList);
            }

        }
        map.put("list", list);
        ModelAndView ml = new ModelAndView();
        ml.addObject("map", map);
        ml.addObject("status", status);
        ml.addObject("start_time", start_time);
        ml.addObject("end_time", end_time);
        ml.addObject("ctg_name", ctg_name);
        ml.addObject("goods_name", goods_name);
        ml.addObject("addr_name", addr_name);
        ml.setViewName("main/order/list");
        return ml;
    }

    /**
     * 确认付款-根据id查询订单
     *
     * @param order_id
     * @param request
     * @param session
     * @return
     */
    @RequestMapping(value = "/page/payOrder.html")
    public ModelAndView payOrder(String order_id, HttpServletRequest request, HttpServletResponse response,
                                 HttpSession session) {
        Order order = orderService.selectOrderByOrderID(order_id);
        ModelAndView ml = new ModelAndView();
        TopayServlet.getPackage(order, request, response, session);
        ml.addObject("order", order);
        ml.setViewName("page/pay-order");
        return ml;


    }

    /**
     * 付款后微信返回信息，更改订单状态
     */
    @RequestMapping(value = "/page/noticeOrder.html")
    public void noticeOrder(HttpServletRequest request) {
//		Map<String, Object> map = new HashMap<>();
//		String xmlStr = NotifyServlet.getWxXml(request);
//		Map map2 = GetWxOrderno.doXMLParse(xmlStr);
//		String return_code = (String) map2.get("return_code");
//		String order_id = (String) map2.get("out_trade_no");
//		Order order=new Order();
//		order.setOrder_id(order_id);
//		List<Order> list = orderService.listById(order);
//		map.put("order_id", order_id);
//		map.put("status", 1);
//		log.info("微信返回 ---->"+xmlStr);
//		if (list.get(0).getStatus() == 0) {
//			if (return_code.equals("SUCCESS")) {
//				orderService.upstatus(map);
//				map.put("result", "订单支付成功");
//				map.put("body", list.get(0).getGoods_name().replace("-=", ""));
//				map.put("price", list.get(0).getGoods_total() + "");
//				map.put("oppen_id", list.get(0).getOppen_id());
//				wechatPushMassage.pushMessage(map);

//			}
//		}
        // return new ModelAndView("orderList.html");
    }

    /**
     * 从购物车获取订单
     *
     * @param oppen_id
     * @param session
     * @return
     */
    @RequestMapping(value = "/page/cartOrderList.html")
    public ModelAndView cartList(@RequestParam(defaultValue = "0") Integer cps_id,
                                 @RequestParam(defaultValue = "0") Integer addr_id, String cps_name,
                                 @RequestParam(defaultValue = "0") Float cps_price, String oppen_id, HttpSession session) {
        ModelAndView ml = new ModelAndView();
        // setOppen_id("111", session);// 测试代码，模仿登录
        oppen_id = getOppen_id(session);
        Cart cart = new Cart();
        cart.setOppen_id(oppen_id);
        List<Cart> list = cartService.list(cart); // 获取订单信息
        Float tprice = cartService.goodstotalprice(cart);// 总价
        ml.addObject("price", tprice); //
        int tnum = cartService.goodstotalnum(cart);// 总数量
        Coupons coupons = new Coupons();
        if (cps_id != null) {
            System.out.println(cps_id);
            if (cps_id != 0) {
                coupons.setCps_id(cps_id);
                List<Coupons> cps = couponsService.listById(coupons);// 优惠券
                if (cps.size() > 0) {
                    cps_price = cps.get(0).getCps_price(); // 如果优惠券大于0，统计出此优惠券价格
                }
                ml.addObject("cps", cps);
            }
        }
        Address address = new Address();
        List<Address> addr;
        if (addr_id == 0) {
            address.setOppen_id(oppen_id);
            addr = addressService.list(address);
        } else {
            address.setAddr_id(addr_id);
            addr = addressService.listById(address);
        }
        tprice = (tprice * 100 - cps_price * 100) / 100; // 使用优惠券的总价
//		if(tprice<0){
//			tprice = 0F;
//		}
        //20190218获取会员信息，计算是否折扣
        HashMap<String, Object> levelMap = membershipService.getLevelDetailByLevelId(oppen_id);
        //折扣力度reduction 默认 不打折
        Float reduction = 1f;
        //商品打折后价格
        Float reductionPrice = tprice;
        //实际支付总计
        Float acturalPrice = tprice;
        //已经注册会员
        if (levelMap != null) {
            //注册会员但是没有无会员信息不折扣
            if (levelMap.get("reduction") != null) {
                reduction = ((Float) levelMap.get("reduction")) / 10;
                reductionPrice = new BigDecimal(tprice * reduction).setScale(2, BigDecimal.ROUND_HALF_UP).floatValue();
            }
            ;
        }
        //计算页面需要展示的
        Freight freight = new Freight();
        List<Freight> fgt = freightService.list(freight);
        if (fgt.size() > 0) {
            if (tprice < fgt.get(0).getFree_price()) {
                tprice = tprice + fgt.get(0).getFgt_price(); // 如果总价小于免邮价，则加上运费
                acturalPrice = reductionPrice + fgt.get(0).getFgt_price(); // 如果总价小于免邮价，则加上运费
                ml.addObject("fgt_price", fgt.get(0).getFgt_price());
            } else {
                ml.addObject("fgt_price", 0);// 免运费
                acturalPrice = reductionPrice;
            }
        } else {
            //一般有默认数据，不会走这个
        }
        String add_time = sf.format(new Date());
        coupons.setOppen_id(oppen_id);
        coupons.setCps_level(-1);
        coupons.setCps_time(add_time);
        coupons.setStatus(1);
        List<Coupons> cps = couponsService.list(coupons); // 获取用户优惠券
        // user.setOppen_id(oppen_id);
        // List<User> userList = userService.listById(user);
        Area area = new Area();
        area.setStatus(1);
        area.setLevel(0);
        List<Area> areaList = areaService.list(area);
        ml.addObject("goods", list);
        ml.addObject("tprice", tprice);
        if (reduction != 1f) {
            ml.addObject("reduction", reduction * 10 + "折");
        } else {
            ml.addObject("reduction", "无折扣");
        }
        ml.addObject("reductionPrice", reductionPrice);
        ml.addObject("acturalPrice", acturalPrice);
        System.err.println("tprice" + tprice);
        ml.addObject("addr", addr);
        ml.addObject("tnum", tnum);
        ml.addObject("cpsCount", cps.size());
        ml.addObject("cps_id", cps_id);
        ml.addObject("addr_id", addr_id);
        // ml.addObject("userList", userList);
        ml.addObject("areaList", areaList);
        ml.setViewName("page/cart-order");
        return ml;
    }

    /**
     * 商品直接下订单
     *
     * @return
     */
    @RequestMapping(value = "/page/goodsOrderSure.html")
    public ModelAndView goodsOrder(@RequestParam(defaultValue = "0") Integer addr_id, Integer goods_id, String member_code, HttpSession session) {
        ModelAndView ml = new ModelAndView();

        //根据oppen_id查询地址的集合
        String oppen_id = getOppen_id(session);
        Address address = new Address();
        address.setOppen_id(oppen_id);
        List<Address> addr;
        if (addr_id == 0) {
            address.setOppen_id(oppen_id);
            addr = addressService.list(address);
        } else {
            address.setAddr_id(addr_id);
            addr = addressService.listById(address);
        }
        //根据goodsID获取goods的信息
        Goods goods = new Goods();
        goods.setGoods_id(goods_id);
        goods = goodsService.selectGoodsByGoodID(goods_id);
        if(StringUtils.isNotBlank(member_code)){
            goods.setGoods_price(goods.getGoods_price_d());
        }
        ml.addObject("addr_id", addr_id);
        ml.addObject("goods", goods);
        ml.addObject("addr", addr);
        ml.addObject("member_code", member_code);
        ml.setViewName("page/goods-order-sure");
        return ml;
    }

    @RequestMapping(value = "/page/order.html")
    public ModelAndView goodsOrder(String order_id) {
        ModelAndView ml = new ModelAndView();
        Order order = new Order();
        order.setOrder_id(order_id);
        ml.addObject("order", orderService.listById(order));
        ml.setViewName("page/express");
        return ml;
    }

    /**
     * 支付完成后更新库存，订单，电子券等信息。
     * @param order_id
     * @return
     * @throws UnsupportedEncodingException
     */
    @ResponseBody
    @RequestMapping(value = "/page/updateOrderStatusAndGiftAndInventory.html")
    public Map<String, String> updateOrderStatusAndGift(String order_id) throws UnsupportedEncodingException {
        Map<String, String> result = new HashMap<>();
        final Order order = orderService.selectOrderByOrderID(order_id);
        orderService.updateOrderStatusAndGiftAndInventory(order);
        result.put("result", "success");
        return result;
    }

}
