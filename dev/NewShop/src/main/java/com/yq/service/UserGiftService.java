package com.yq.service;

import com.yq.dao.UserGiftDao;
import com.yq.entity.UserGiftBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class UserGiftService {
    @Autowired
    private UserGiftDao userGiftDao;

    public List<UserGiftBean> getUserGiftLstByOpenID(String openID) {
        List<UserGiftBean> beans = userGiftDao.getgetUserGiftLst(openID);
        return beans;
    }

    ;

    //20190221增加退款修改电子券状态为2 ，已退款
    public void updateUserGiftStatusByMap(Map<String, Object> map) {
        userGiftDao.updateUserGiftStatusByMap(map);
    }

    public void updateTemplateGiftStatusByMap(Map<String, Object> map) {
        userGiftDao.updateTemplateGiftStatusByMap(map);
    }
}
