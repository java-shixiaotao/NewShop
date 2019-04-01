package com.yq.service;

import com.yq.dao.OrderDao;
import com.yq.dao.UserGiftDao;
import com.yq.entity.Order;
import com.yq.entity.Share;
import com.yq.entity.UserGiftBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;


@Service
public class UserGiftServiceImpl{
    @Autowired
    private UserGiftDao userGiftDao;

    @Autowired
    private OrderDao orderDao;

    public List<UserGiftBean> getUserGiftLstByOpenID(String openID){
        List<UserGiftBean> beans=userGiftDao.getgetUserGiftLst(openID);
        return beans;
    }

    public List<UserGiftBean> getUserGiftBeanByShareID(String gift_id) {
        return userGiftDao.getUserGiftBeanByShareID(gift_id);
    }

    public UserGiftBean getViewGiftBeanByGiftID(String gift_id) {
        return userGiftDao.getViewGiftBeanByGiftID(gift_id);
    }

    public int conversion(Order order) throws Exception{
        Map<String,String> map=new HashMap<>();
        int update=0;
        SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = sd.format(new Date());
        map.put("useTime",time);
        map.put("gift_id",order.getGift_id());
        map.put("order_id",order.getOrder_id());
        if(order.getOrder_type()==6){
            update=userGiftDao.updateShareStatusByShareID(order.getGift_id());
            if(update==1){
                userGiftDao.updateShareTimeByShareID(map);
                userGiftDao.updateUserGiftTimeByGiftID(map);
            }

        }else if(order.getOrder_type()==7){
            update=userGiftDao.updateTemplateGiftStatusByGiftID(order.getGift_id());
            if(update==1){
                userGiftDao.updateTemplateGiftTimeByGiftID(map);
            }
        }
        if(update==1){
            orderDao.insert(order) ;
        }
        return update;
    }

    public int direct_conversion(Order order) throws Exception{
        Map<String,String> map=new HashMap<>();
        int update=0;
        SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = sd.format(new Date());
        map.put("useTime",time);
        map.put("order_id",order.getOrder_id());
        String giftIDs = order.getGift_id();
        List<String> giftList;
        if(giftIDs.contains(",")){
            giftList= Arrays.stream(giftIDs.split(",")).collect(Collectors.toList());
        }else {
            giftList=new ArrayList<>();
            giftList.add(giftIDs);
        }
        for(String giftID:giftList){
            update=userGiftDao.updateUserGiftStatusByGiftID(giftID);
            if(update==1){
                map.put("gift_id",giftID);
                userGiftDao.updateUserGiftTimeByGiftID(map);
            }else {
                throw new Exception();
            }
        }
        if(update==1){
            orderDao.insert(order) ;
        }
        return update;
    }

    public List<UserGiftBean> getShareLstByOpenID(String oppen_id) {
        return userGiftDao.getShareLstByOpenID(oppen_id);
    }

    public List<UserGiftBean> getUserGiftLstByGift_ids(Map<String, Object> param) {
        return userGiftDao.getUserGiftLstByGift_ids(param);
    }

    public void updateGiftStatusByGiftIDs(Map<String, Object> param) {
       userGiftDao.updateGiftStatusByGiftIDs(param);
    }

    public void insertShare(Share share) {
        userGiftDao.insertShare(share);
    }

    public int cancelGiftPackage(String shareID) {
        return userGiftDao.cancelGiftPackage(shareID);
    }

    public void updateUserGiftStatusByMap(Map<String, Object> param) {
        userGiftDao.updateUserGiftStatusByMap(param);
    }

    public List<UserGiftBean> getUserGiftBeanByGiftID(Map<String,Object> share_ids) {
        return userGiftDao.getUserGiftBeanByGiftID(share_ids);
    }
}
