package com.yq.controller;

import com.yq.entity.*;
import com.yq.service.*;
import com.yq.util.StringUtil;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
public class MembershipCtrl extends StringUtil {
    @Autowired
    private UserService userService;

    @Autowired
    private MembershipService membershipService;

    @Autowired
    private AddressService addressService;

    //“我的”页面 点击会员中心
    @RequestMapping(value="/page/membershipindex")
    public ModelAndView membershipindex(@RequestParam(defaultValue = "0") Integer addr_id, HttpSession session){
        boolean ifMembershipFlag = false;
        //微信用户标识id
        String	oppen_id=getOppen_id(session);
        //微信用户查询
        User queryUser = new User();
        queryUser.setOppen_id(oppen_id);
        List<User> userList = userService.listById(queryUser);
        User user = userList.get(0);
        //判断是不是会员即 会员表里有没有记录
        Membership queryMembership = new Membership();
        queryMembership.setOppen_id(oppen_id);
        List<Membership> membershipList = membershipService.listByIdForMemberShip(queryMembership);
        if (membershipList.size()!= 0) {
            System.out.println("会员存在，则update" );
            Map updateMap = new HashMap<String,Object>();
            updateMap.put("oppen_id", oppen_id);
            updateMap.put("realname",user.getRealname());
            updateMap.put("head_img", user.getHead_img());
            membershipService.updateWxbf(updateMap);
            ifMembershipFlag = true;
        } else {
            System.out.println("不是会员" );
        }
        ModelAndView ml = new ModelAndView();
        Address address=new Address();
        List<Address> addr ;
        if(ifMembershipFlag){//是会员跳转到
            ml.addObject("membership",membershipList);
            if(StringUtils.isNotEmpty(membershipList.get(0).getAddr_id())){//如果有维护过地址等详细信息
                address.setAddr_id(Integer.parseInt(membershipList.get(0).getAddr_id()));
                addr = addressService.listById(address);
                ml.addObject("addr_id", membershipList.get(0).getAddr_id());
            }else{//购物直接升级会员还未注册其他详细信息
                address.setOppen_id(oppen_id);
                addr = addressService.list(address);
                ml.addObject("addr", addr);
                ml.addObject("addr_id", addr_id);
            }

            ml.setViewName("page/membershipIndex");
        }else{//不是会员进入会员注册页面
                address.setOppen_id(oppen_id);
                addr = addressService.list(address);
            Membership membership = new Membership();
            membership.setOppen_id(oppen_id);
            membership.setRealname(user.getRealname());
            membership.setHead_img(user.getHead_img());
            membership.setAdd_time(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
            ml.addObject("membership",membership);
            ml.addObject("addr", addr);
            ml.addObject("addr_id", addr_id);
            ml.addObject("insertFlag", "1");
            ml.setViewName("page/registerMembership");
        }
        return ml;
    }

    //会员保存
    @ResponseBody
    @RequestMapping(value = "/page/membershipInsert")
    public String insert(String addr_phone , String addr_email ,
                         String addr_username , String addr_idcardno,
                         String birthday,
                         String add_time_add, String addr_add, String addressDetail,
                         String referee, HttpSession session) {
//			setOppen_id("111", session);//测试代码，模仿登录
        String oppen_id=getOppen_id(session);
        //判断是不是会员即 会员表里有没有记录
        Membership queryMembership = new Membership();
        queryMembership.setOppen_id(oppen_id);
        List membershipList = membershipService.listByIdForMemberShip(queryMembership);
        if(membershipList.size()>0){
            return "0";
        }
        Map<String, Object> map = new HashMap<String, Object>();
        User queryUser = new User();
        queryUser.setOppen_id(oppen_id);
        User nowUser = userService.listById(queryUser).get(0);
        if(StringUtils.isNotEmpty(addressDetail)){
            try {
                map.put("addr_name",java.net.URLDecoder.decode(addressDetail,"utf-8")) ;
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }
        map.put("username",addr_username);
        map.put("oppen_id",oppen_id);
        map.put("realname",nowUser.getRealname());
        map.put("head_img",nowUser.getHead_img());
        map.put("add_time",add_time_add);
        map.put("status","1");
        map.put("idcardno",addr_idcardno);
        map.put("birthday",birthday);
        map.put("addr_id",addr_add);
        map.put("phone",addr_phone);
        map.put("email",addr_email);
        map.put("referee",referee.equals("")?null:referee);
        return membershipService.insert(map)+"";
    }

    //会员中心点击头像修改信息
    @RequestMapping(value="/page/modifyMembership")
    public ModelAndView modifyMembership(@RequestParam(defaultValue = "0") Integer addr_id, HttpSession session){
        //微信用户标识id
        String	oppen_id=getOppen_id(session);
        //微信用户查询
        //判断是不是会员即 会员表里有没有记录
        Membership queryMembership = new Membership();
        queryMembership.setOppen_id(oppen_id);
        List<Membership> membershipList = membershipService.listByIdForMemberShip(queryMembership);
        ModelAndView ml = new ModelAndView();
        Address address=new Address();
        try {
            address.setAddr_id(addr_id);
            List<Address> addr = addressService.listById(address);
            ml.addObject("membership",membershipList.get(0));
            ml.addObject("addr", addr);
            ml.addObject("addr_id", addr_id);
            //不是插入，是修改
            ml.addObject("insertFlag", "0");
            ml.setViewName("page/registerMembership");
        }catch(Exception e){
            ml.setViewName("page/error");
        }
        return ml;
    }

    //会员更新
    @ResponseBody
    @RequestMapping(value = "/page/membershipModify")
    public String modify(String addr_phone , String addr_email ,
                         String addr_username ,String addr_idcardno,
                         String birthday,
                         String add_time_add, String addr_add,String addressDetail,
                         String referee,
                         HttpSession session) {
//			setOppen_id("111", session);//测试代码，模仿登录
        String oppen_id=getOppen_id(session);
        //判断是不是会员即 会员表里有没有记录
        Membership queryMembership = new Membership();
        queryMembership.setOppen_id(oppen_id);
        List membershipList = membershipService.listByIdForMemberShip(queryMembership);
        if(membershipList.size()==0){
            return "0";
        }
        Map<String, Object> map = new HashMap<String, Object>();
        if(StringUtils.isNotEmpty(addressDetail)){
            try {
                map.put("addr_name",java.net.URLDecoder.decode(addressDetail,"utf-8")) ;
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }
        map.put("oppen_id",oppen_id);
        map.put("username",addr_username);
        map.put("birthday",birthday);
        map.put("idcardno",addr_idcardno);
        map.put("addr_id",addr_add);
        map.put("phone",addr_phone);
        map.put("email",addr_email);
        map.put("referee",referee);
        return membershipService.update(map)+"";
    }
    //会员更新
    @ResponseBody
    @RequestMapping(value = "/page/membershipModifyCheckReferee")
    public String membershipModifyCheckReferee(
                         Long referee,
                         HttpSession session) {
        String oppen_id=getOppen_id(session);
        //判断是不是会员即 会员表里有没有记录
        Membership queryMembership = new Membership();
        queryMembership.setReferee(referee);
        List membershipList = membershipService.listByReferee(queryMembership);
        if(membershipList.size()==0){//没有此会员
            return "0";
        }else{//有此会员
            return "1";
        }
    }
}
