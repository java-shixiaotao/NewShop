package com.weixin.util;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class WeixinGroupSend {

    
    public String getAccess_token(){
        String access_token=null;
        StringBuffer action =new StringBuffer();
        action.append("https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential")
        .append("&appid=********")
        .append("&secret=****************");
         
        URL url;
        try {
            url = new URL(action.toString());
            HttpURLConnection http = (HttpURLConnection) url.openConnection();        
            http.setRequestMethod("GET");        
            http.setRequestProperty("Content-Type","application/x-www-form-urlencoded");    
            http.setDoInput(true);
            InputStream is =http.getInputStream();
            int size =is.available();
            byte[] buf=new byte[size];
            is.read(buf);
            String resp =new String(buf,"UTF-8");
            JSONObject jsonObject =JSONObject.fromObject(resp);
            System.out.println("access_token:"+jsonObject.toString());
            Object object =jsonObject.get("access_token");
            if(object !=null){
                  access_token =String.valueOf(object);
            }
             return access_token;
        } catch (Exception e) {
            e.printStackTrace();
             return access_token;
             
       
         
        }
        
    } 
    
    public  JSONArray  getOpenids(){
        JSONArray array =null;
        String urlstr ="https://api.weixin.qq.com/cgi-bin/user/get?access_token=ACCESS_TOKEN&next_openid=NEXT_OPENID";
        urlstr =urlstr.replace("ACCESS_TOKEN", getAccess_token());
        urlstr =urlstr.replace("NEXT_OPENID", "");
        URL url;
        try {
            url = new URL(urlstr);
            HttpURLConnection http = (HttpURLConnection) url.openConnection();        
            http.setRequestMethod("GET");        
            http.setRequestProperty("Content-Type","application/x-www-form-urlencoded");    
            http.setDoInput(true);
            InputStream is =http.getInputStream();
            int size =is.available();
            byte[] buf=new byte[size];
            is.read(buf);
            String resp =new String(buf,"UTF-8");
            JSONObject jsonObject =JSONObject.fromObject(resp);
            System.out.println("resp:"+jsonObject.toString());
            array =jsonObject.getJSONObject("data").getJSONArray("openid");
            return array;
        } catch (MalformedURLException e) {
            e.printStackTrace();
             return array;
             
        } catch (Exception e) {
            e.printStackTrace();
             return array;
         
        }
    }
    
    public void testsendTextByOpenids(){
        String urlstr ="https://api.weixin.qq.com/cgi-bin/message/mass/send?access_token=ACCESS_TOKEN";
        String reqjson =createGroupText(getOpenids());
        try {
             
            URL httpclient =new URL(urlstr);
            HttpURLConnection conn =(HttpURLConnection) httpclient.openConnection();
            conn.setConnectTimeout(5000);
            conn.setReadTimeout(2000);
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type","application/x-www-form-urlencoded");    
            conn.setDoOutput(true);        
            conn.setDoInput(true);
            conn.connect();
            OutputStream os= conn.getOutputStream();    
            System.out.println("req:"+reqjson);
            os.write(reqjson.getBytes("UTF-8"));//传入参数    
            os.flush();
            os.close();
            
            InputStream is =conn.getInputStream();
            int size =is.available();
            byte[] jsonBytes =new byte[size];
            is.read(jsonBytes);
            String message=new String(jsonBytes,"UTF-8");
            System.out.println("resp:"+message);
         
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } 
    }
    
    private String createGroupText(JSONArray array){
         JSONObject gjson =new JSONObject();
         gjson.put("touser", array);
         gjson.put("msgtype", "text");
         JSONObject text =new JSONObject();
         text.put("content", "hello from boxer.");
         gjson.put("text", text);
        return gjson.toString();
    }
}