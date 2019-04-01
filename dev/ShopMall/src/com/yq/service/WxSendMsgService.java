package com.yq.service;

import com.weixin.entity.Token;
import com.weixin.util.CommonUtil;
import com.weixin.util.StringUtil;
import com.weixin.util.URLConnectionHelper;
import com.yq.dao.OrderDao;
import com.yq.entity.Order;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.LinkedHashMap;
import java.util.Map;


@Service
public class WxSendMsgService {

    @Autowired
    private OrderDao orderDao;

    /**
     * 后台点击发货时 ，推送模板消息给收货人的微信账号
     * @param orderNo 系统内订单id
     * @return
     */
    public void deliverGoodsMsg(String orderNo){
        //发货的订单
        Order order = orderDao.getOrderByOrderID(orderNo);
        //购买/兑换 人的微信id
        String openId = order.getOppen_id();
        String[] keyWordNameArr = new String[4];
        String[] keyWordValueArr = new String[4];
        String[] keyWordColorArr = new String[4];
        keyWordNameArr[0] = "first";
        keyWordValueArr[0] = "亲，宝贝已经启程了，好想快点来到你身边！";
        keyWordColorArr[0] = "#173177";
//        //订单号
//        keyWordNameArr[1] = "order_id";
//        keyWordValueArr[1] = order.getOrder_id();
//        keyWordColorArr[1] = "#173177";
        //快递公司
        keyWordNameArr[1] = "delivername";
        keyWordValueArr[1] = order.getExpress_name();
        keyWordColorArr[1] = "#173177";
        //快递订单号
        String packageNo = order.getExpress_hm();
        keyWordNameArr[2] = "ordername";
        keyWordValueArr[2] = packageNo;
        keyWordColorArr[2] = "#173177";
        //备注内容 名字 数量 规格
        String goodsNameStr = order.getGoods_name();
        String goodsNumStr = order.getGoods_num();
        String goodsSpeStr = order.getGoods_spe();
        StringBuilder remarkSb = new StringBuilder("商品清单：");
        String[] goodsNameArr = goodsNameStr.split(",-=");
        String[] goodsNumArr = goodsNumStr.split(",-=");
        String[] goodsSpeArr = goodsSpeStr.split(",-=");
        for(int i = 0 ; i < goodsNameArr.length ; i++){
            remarkSb.append(goodsNameArr[i]).append("*").append(goodsNumArr[i]).append(goodsSpeArr[i]);
            if(i<goodsNameArr.length-1){
                remarkSb.append("、");
            }
        }
        keyWordNameArr[3] = "remark";
        keyWordValueArr[3] = remarkSb.toString();
        keyWordColorArr[3] = "#173177";
        sendMessage(openId,StringUtil.template_id_deliverGoods,"",keyWordNameArr,keyWordValueArr,keyWordColorArr);
    }

    /**
     * 电子券兑换
     * @param orderNo
     */
    public void conversionMsg(String orderNo){
        //发货的订单
        Order order = orderDao.getOrderByOrderID(orderNo);
        //购买/兑换 人的微信id
        String openId = order.getOppen_id();
        String[] keyWordNameArr = new String[4];
        String[] keyWordValueArr = new String[4];
        String[] keyWordColorArr = new String[4];
        keyWordNameArr[0] = "first";
        keyWordValueArr[0] = "亲，您的电子券已经兑换成功，我们将尽快发货！";
        keyWordColorArr[0] = "#173177";
        //兑换实物
        String goodsNameStr = order.getGoods_name();
        String goodsNumStr = order.getGoods_num();
        String goodsSpeStr = order.getGoods_spe();
        StringBuilder remarkSb = new StringBuilder("");
        String[] goodsNameArr = goodsNameStr.split(",-=");
        String[] goodsNumArr = goodsNumStr.split(",-=");
        String[] goodsSpeArr = goodsSpeStr.split(",-=");
        for(int i = 0 ; i < goodsNameArr.length ; i++){
            remarkSb.append(goodsNameArr[i]).append("*").append(goodsNumArr[i]).append(goodsSpeArr[i]);
            if(i<goodsNameArr.length-1){
                remarkSb.append("、");
            }
        }
        keyWordNameArr[1] = "keyword1";
        keyWordValueArr[1] = remarkSb.toString();
        keyWordColorArr[1] = "#173177";
        //兑换时间
        keyWordNameArr[2] = "keyword2";
        keyWordValueArr[2] = order.getAdd_time();
        keyWordColorArr[2] = "#173177";
        //备注
        keyWordNameArr[3] = "remark";
        keyWordValueArr[3] = "";
        keyWordColorArr[3] = "#173177";
        sendMessage(openId,StringUtil.template_id_cpsCovertion,"",keyWordNameArr,keyWordValueArr,keyWordColorArr);
    }

    /**
     * 微信统一发消息接口
     * @param openId 微信id
     * @param templateId 需要在服务号配置模板
     * @param linkUrl 链接
     * @param keyWordNameArr 关键字关键字 键 （根据服务号模板配置定义）
     * @param keyWordValueArr 关键字值
     * @param keyWordColorArr 关键字字体颜色
     */
    public void sendMessage(String openId,String templateId, String linkUrl, String[] keyWordNameArr, String[] keyWordValueArr, String[] keyWordColorArr) {
        //准备消息数据
        CommonUtil commonUtil = new CommonUtil();
        StringUtil st = new StringUtil();
        //发送消息需要的参数
        Map totalMap = new LinkedHashMap<String, Object>();
        //消息模板id
        totalMap.put("template_id",templateId);
        //链接url
        totalMap.put("url",linkUrl);
        //模板主题颜色
        //map.put("topcolor", topcolor);
        //获取accesstoken
        Token token = commonUtil.getToken(st.getSetting().getAppid(), st.getSetting().getAppsecret());
        String accessToken = token.getAccessToken();
        //微信账户id
        totalMap.put("touser", openId);
        //数据组织
        Map dataMap = new LinkedHashMap<String, Object>();
        if(keyWordColorArr != null){
            for(int i = 0 ; i < keyWordNameArr.length ; i++){
                LinkedHashMap<String, String> tempMap = new LinkedHashMap<String, String>();
                tempMap.put("value",keyWordValueArr[i]);
                tempMap.put("color",keyWordColorArr[i]);
                dataMap.put(keyWordNameArr[i],tempMap);
            }
        }else{
            for(int i = 0 ; i < keyWordNameArr.length ; i++) {
                LinkedHashMap<String, String> tempMap = new LinkedHashMap<String, String>();
                tempMap.put("value", keyWordValueArr[i]);
                dataMap.put(keyWordNameArr[i], tempMap);
            }
        }
        totalMap.put("data",dataMap);
        JSONObject jsonObject = new JSONObject(totalMap);
        String jsonStrSend = URLConnectionHelper.sendPost(StringUtil.SENDMESSAGE_URL.replace("ACCESS_TOKEN",accessToken),jsonObject.toString());
            System.out.println(jsonStrSend);
    }
}
