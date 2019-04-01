package com.yq.util.orderID;

import java.text.SimpleDateFormat;
import java.util.Date;

public class OrderIDUtil {

    public static String getOrderID(){
        SimpleDateFormat sd = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        String order_id = sd.format(new Date());
        int random=(int)(Math.random()*900 + 100);
        return order_id+random;
    }
}
