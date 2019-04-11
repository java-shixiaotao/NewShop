package com.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * @Author: HUHU
 * @Date: 2019/4/11 16:15
 */

@Controller
@RequestMapping("/testContronller")
public class TestContronllerTwo {

    /**
     * 返回JSON示例
     * @return
     */
    @GetMapping("test1")
    @ResponseBody
    public Map<String,Object> test(){
        Map<String,Object> map = new HashMap<>();
        map.put("key1","1");
        map.put("key2","2");
        map.put("key3","3");

        map.put("key4","4");
        map.put("key5","6");

        return map;
    }

    /**
     * 返回XML 示例
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/test2", method = RequestMethod.GET)
    public Person test2() {
        Person person = new Person();
        person.setAge(25);
        person.setName("你大爷");
        return person;
    }

 }
