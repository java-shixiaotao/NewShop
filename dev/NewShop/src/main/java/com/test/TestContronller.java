package com.test;

import com.rcd.ncore.common.structure.SimpleJSON;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

/**
 * @Author: HUHU
 * @Date: 2019/4/11 16:15
 */

@RestController
@RequestMapping("/testContronller")
public class TestContronller {

    private static Logger logger = LoggerFactory.getLogger(TestContronller.class);

    @GetMapping("test")
    public Map<String,Object> test(){
        Map<String,Object> map = new HashMap<>();
        map.put("key1","1");
        map.put("key2","2");
        map.put("key3","3");
        map.put("key4","4");

        map.put("key5","5");

        return map;
    }

    /**
     *  获取收货地址
     * @param id
     * @return
     */
    @GetMapping("/getList/{id}")
    public SimpleJSON getList(@PathVariable String id){

        SimpleJSON result = new SimpleJSON();
        try {
            //List<T> list = ssss.xxxx;
          //  result.add("status",200).add("msg",list);
        }catch (Exception e){
            e.printStackTrace();
            result.add("status",500).add("msg","获取收货地址出现异常");
            logger.error("获取收货地址出现异常：",e);
        }
        return result;
    }
    @PostMapping("insert")
    public SimpleJSON insert(@RequestBody Person person){
        SimpleJSON result = new SimpleJSON();
        try {
            //service.insert(person);
            result.add("status",200).add("msg","新增成功");
        }catch (Exception e){
            e.printStackTrace();
            result.add("status",500).add("msg","新增收货地址出现异常");
            logger.error("新增收货地址出现异常：",e);
        }
        return result;
    }
    @PutMapping("update")
    public SimpleJSON update(@RequestBody Person person){
        SimpleJSON result = new SimpleJSON();
        try {

            //TODO
          //  service.update(person);
            result.add("status",200).add("msg","新增成功");
        }catch (Exception e){
            e.printStackTrace();
            result.add("status",500).add("msg","新增收货地址出现异常");
            logger.error("新增收货地址出现异常：",e);
        }
        return result;
    }
    @DeleteMapping("/{id}")
    public SimpleJSON delete(@PathVariable String id){
        SimpleJSON result = new SimpleJSON();
        try {

            //TODO
           // service.delete(id);
            result.add("status",200).add("msg","删除成功");
        }catch (Exception e){
            e.printStackTrace();
            result.add("status",500).add("msg","删除收货地址出现异常");
            logger.error("删除收货地址出现异常：",e);
        }
        return result;
    }


 }
