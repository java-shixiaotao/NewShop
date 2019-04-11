package com.yq.dao;

import com.yq.entity.Order;
import com.yq.entity.Share;
import com.yq.entity.UserGiftBean;

import java.util.List;
import java.util.Map;

public interface UserGiftDao {
    List<UserGiftBean> getgetUserGiftLst(String openID);

    List<UserGiftBean> getUserGiftBeanByShareID(String gift_id);

    UserGiftBean getViewGiftBeanByGiftID(String gift_id);

    int updateUserGiftStatusByGiftID(String gift_id);

    int updateTemplateGiftStatusByGiftID(String gift_id);

    int updateTemplateGiftTimeByGiftID(Map<String, String> map);

    int updateUserGiftTimeByGiftID(Map<String, String> map);

    void insertGiftDetail(UserGiftBean order);

    void updateUserGiftStatusByMap(Map<String, Object> map);

    void updateTemplateGiftStatusByMap(Map<String, Object> map);

    List<UserGiftBean> getShareLstByOpenID(String oppen_id);

    List<UserGiftBean> getUserGiftLstByGift_ids(Map<String, Object> param);

    void updateGiftStatusByGiftIDs(Map<String, Object> param);

    void insertShare(Share share);

    int cancelGiftPackage(String shareID);

    int updateShareStatusByShareID(String gift_id);

    void updateShareTimeByShareID(Map<String, String> map);

    List<UserGiftBean> getUserGiftBeanByGiftID(Map<String,Object> share_id);
}
