package com.yq.dao;

import com.yq.entity.ViewGiftDetail;
import java.util.List;

public interface ViewGiftDetailDao {
	List<ViewGiftDetail> selectByGiftId(String giftId);

}
