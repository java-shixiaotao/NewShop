package com.yq.service;


import com.yq.dao.ViewGiftDetailDao;
import com.yq.entity.ViewGiftDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Map;


@Service
public class ScancodeService {
@Autowired
ViewGiftDetailDao viewGiftDetailDao ;
	public List<ViewGiftDetail> selectByGiftId(String giftId){
		return viewGiftDetailDao.selectByGiftId(giftId);
	}
}
