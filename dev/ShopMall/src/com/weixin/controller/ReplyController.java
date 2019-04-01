package com.weixin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
//import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



import com.weixin.entity.ClickText;
import com.weixin.entity.Item;
import com.weixin.entity.RequestTextMessage;
import com.weixin.service.ClickTextService;
import com.weixin.util.ReplyMessage;
import com.weixin.util.SHA1;

@Controller
@RequestMapping("/")
public class ReplyController {
    private static final Logger log =Logger.getLogger(ReplyController.class);
    private String TOKEN = "wcdmsc";
    //Pattern pattern = Pattern.compile("[0-9]*");
    //private Map<String, Object> map = new HashMap<>();
    @Autowired
    private ClickTextService clickTextService;

    @RequestMapping(value = "reply.html")
    public void repaly(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        System.out.println("token验证");
//		checkToken(request, response); //仅在认证微信开发者模式时调用一次即可
        try {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter pw = response.getWriter();
            String wxMsgXml =IOUtils.toString(request.getInputStream(), "utf-8");
            log.info("获取的数据信息>>>>>"+wxMsgXml);

            boolean eventType =wxMsgXml.contains("Event") ;// 如果包含，则是触发事件
            RequestTextMessage textMsg =null ;
            String returnXml = null;
            StringBuffer replyMsg = new StringBuffer();
            if(!eventType){ //信息交互事件
                textMsg = ReplyMessage.getRequestTextMessage(wxMsgXml);
                String receive = textMsg.getContent().trim();

                ClickText clickText = clickTextService.selectByPrimaryKey(receive);
                if (clickText.getType()==1) {
                    replyMsg.append(clickText.getContent());
                    returnXml = ReplyMessage.getReplyTextMessage(replyMsg.toString(), textMsg.getFromUserName(),
                            textMsg.getToUserName());
                }else if(clickText.getType()==2){
                    List<Item> articleList = new ArrayList<>();
                    Item item = null ;
                    if(clickText.getIntro().contains("-=")){//多条图文信息
                        String[] title =  clickText.getTitle().split("-=");
                        String[] intro =  clickText.getIntro().split("-=");
                        String[] pic_url =  clickText.getPic_url().split("-=");
                        String[] url =  clickText.getUrl().split("-=");
                        for(int i =0 ; i < intro.length; i++){
                            item = new Item();
                            item.setTitle(title[i]); //标题
                            item.setDescription(intro[i]);//介绍
                            item.setPicUrl(pic_url[i]);	//图片链接
                            item.setUrl(url[i]);        //链接指向
                            articleList.add(item);
                        }
                    }else{ //单条图文信息
                        item = new Item();
                        item.setTitle(clickText.getTitle()); //标题
                        item.setDescription(clickText.getIntro());//介绍
                        item.setPicUrl(clickText.getPic_url());	//图片链接
                        item.setUrl(clickText.getUrl());        //链接指向
                        articleList.add(item);
                    }
                    returnXml = ReplyMessage.getReplyTuwenMessage(textMsg.getFromUserName(), textMsg.getToUserName(),articleList);
                }
            }else{
                textMsg = ReplyMessage.getRequestFocus(wxMsgXml);
                if(textMsg.getEvent().equals("subscribe")){ //关注事件
                    ClickText clickText = clickTextService.selectByPrimaryKey("subscribe");
                    System.out.println();
                    replyMsg.append(clickText.getContent());
                    log.info("关注回复->"+clickText.getContent());
                    returnXml =
                            ReplyMessage.getReplyTextMessage(replyMsg.toString(), textMsg.getFromUserName(),
                                    textMsg.getToUserName());
                }
            }

            log.info("wxMsgXml>>>>>>>>>>>>>>"+wxMsgXml);
            log.info("returnXml>>>>>>>>>>>>>>"+returnXml);
            pw.println(returnXml);

        }
        catch (Exception e) {
            log.info(e.getMessage());
        }
    }

    /**
     * 微信token认证，使用时调用
     *
     * @param request
     * @param response
     * @throws IOException
     */

    public void checkToken(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // 微信加密签名
        String signature = request.getParameter("signature");
        // 随机字符串
        String echostr = request.getParameter("echostr");
        // 时间戳
        String timestamp = request.getParameter("timestamp");
        // 随机数
        String nonce = request.getParameter("nonce");

        String[] str = { TOKEN, timestamp, nonce };
        Arrays.sort(str); // 字典序排序
        String bigStr = str[0] + str[1] + str[2];
        // SHA1加密
        String digest = new SHA1().getDigestOfString(bigStr.getBytes()).toLowerCase();

        // 确认请求来至微信
        if (digest.equals(signature)) {
            response.getWriter().print(echostr);
        }
    }
}