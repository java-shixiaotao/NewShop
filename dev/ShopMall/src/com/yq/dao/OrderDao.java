package com.yq.dao;

import java.util.List;
import java.util.Map;

import com.yq.entity.Inventory;
import com.yq.entity.Membership;
import com.yq.entity.Order;


public interface OrderDao {

	int insert(Order order);

	int upstatus(Map<String, Object> map);
	
	int upprice(Map<String, Object> map);

	int delete(Map<String, Object> map);

	List<Order> list(Order order);

	List<Order> listById(Order order);
	
	List<Order> listJson(Order order);
	
	int count(Order order);

	int listJsonCount(Order order);

	Order getOrderByOrderID(String order_id);

	double selectYearTotalMoney(Map<String, Object> map);

	void updateOrderStatusByOrderID(Map<String, Object> param);

	List<Inventory> selectInventoryByMemberID(Order order);

	void updateInventoryStatusByID(Inventory id);

	void updateOrderStatusAndOrderTypeByOrderID(Map<String, Object> param);

	void updateInvertoryNumber(Order order);

	Membership selectInventoryNumberByMemberID(Order order);

	void updateInvertory_box_Number(Order order);

	void updateInvertory_guan_Number(Order order);
}
