package com.yq.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.yq.dao.UserGiftDao;
import com.yq.entity.Inventory;
import com.yq.entity.Membership;
import com.yq.entity.UserGiftBean;
import com.yq.util.giftCode.GiftCodeGen;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yq.dao.OrderDao;
import com.yq.entity.Order;

@Service
public class OrderService {
    @Autowired
    private OrderDao orderDao;

    @Autowired
    private UserGiftDao userGiftDao;

    public int insert(Order order) {
        return orderDao.insert(order);
    }

    public int upstatus(Map<String, Object> map) {
        return orderDao.upstatus(map);
    }

    public int upprice(Map<String, Object> map) {
        return orderDao.upprice(map);
    }

    public int delete(Map<String, Object> map) {
        return orderDao.delete(map);
    }

    public List<Order> list(Order order) {
        return orderDao.list(order);
    }

    public List<Order> listById(Order order) {
        return orderDao.listById(order);
    }

    public int count(Order order) {
        return orderDao.count(order);
    }

    public List<Order> listJson(Order order) {
        return orderDao.listJson(order);
    }


    public int listJsonCount(Order order) {
        return orderDao.listJsonCount(order);
    }

    public Order selectOrderByOrderID(String order_id) {
        return orderDao.getOrderByOrderID(order_id);
    }

    public void updateOrderStatusAndGiftAndInventory(Order order) {
        Map<String, Object> param = new HashMap<>();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = sdf.format(new Date());
        int order_type = order.getOrder_type();
        param.put("order_id",order.getOrder_id());
        param.put("update_time",time);
        if (order_type == 0) {
            //消费者向公司购买实物
            param.put("status",1);
            orderDao.updateOrderStatusByOrderID(param);
        } else if (order_type == 1){
            //消费者向公司购买电子券
            param.put("status",2);
            orderDao.updateOrderStatusByOrderID(param);
            insertGiftDetail(order,time);
        } else if(order_type==2){
            //向经销商买实物
            param.put("status",1);
            Membership membership=orderDao.selectInventoryNumberByMemberID(order);
            if((order.getSpe_type()==0&&membership.getInventory_box_num()>=Integer.parseInt(order.getGoods_num()))
                    ||(order.getSpe_type()==1&&membership.getInventory_guan_num()>=Integer.parseInt(order.getGoods_num()))){
                if(order.getSpe_type()==0){
                    orderDao.updateInvertory_box_Number(order);
                }else{
                    orderDao.updateInvertory_guan_Number(order);
                }
                orderDao.updateOrderStatusByOrderID(param);
            }else{
                param.put("order_type",8);
                orderDao.updateOrderStatusAndOrderTypeByOrderID(param);
            }
        } else if(order_type==3){
            //向经销商买电子券
            param.put("status",2);
            Membership membership=orderDao.selectInventoryNumberByMemberID(order);
            if((order.getSpe_type()==0&&membership.getInventory_box_num()>=Integer.parseInt(order.getGoods_num()))
                    ||(order.getSpe_type()==1&&membership.getInventory_guan_num()>=Integer.parseInt(order.getGoods_num()))){
                if(order.getSpe_type()==0){
                    orderDao.updateInvertory_box_Number(order);
                }else{
                    orderDao.updateInvertory_guan_Number(order);
                }
                orderDao.updateOrderStatusByOrderID(param);
            }else{
                param.put("order_type",9);
                orderDao.updateOrderStatusAndOrderTypeByOrderID(param);
            }
            insertGiftDetail(order,time);
        }
    }

    private void insertGiftDetail(Order order,String time) {
        UserGiftBean gift=new UserGiftBean();
        for(int i=0;i<Integer.parseInt(order.getGoods_num());i++){
            gift.setGift_id(GiftCodeGen.getGiftCodeLst(0, 1, 12).get(0));
            gift.setOppen_id(order.getOppen_id());
            gift.setSource_order_id(order.getOrder_id());
            gift.setStatus(0);
            gift.setUpdate_time(time);
            gift.setCreate_time(time);
            userGiftDao.insertGiftDetail(gift);
        }
    }
}
