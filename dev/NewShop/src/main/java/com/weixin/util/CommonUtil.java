package com.weixin.util;

import com.weixin.entity.AccessToken;
import com.weixin.entity.Token;
import com.weixin.service.AccessTokenService;
import net.sf.json.JSONException;
import net.sf.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;
import java.io.*;
import java.net.ConnectException;
import java.net.URL;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 通用工具类
 * 
 * @author liufeng
 * @date 2013-10-17
 */
@Controller
public class CommonUtil extends StringUtil{
	private static Logger log = LoggerFactory.getLogger(CommonUtil.class);

	// 凭证获取（GET）
//	public final static String token_url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET";

	/**
	 * 发送https请求
	 * 
	 * @param requestUrl 请求地址
	 * @param requestMethod 请求方式（GET、POST）
	 * @param outputStr 提交的数据
	 * @return JSONObject(通过JSONObject.get(key)的方式获取json对象的属性值)
	 */
	public static JSONObject httpsRequest(String requestUrl, String requestMethod, String outputStr) {
		JSONObject jsonObject = null;
		try {
			// 创建SSLContext对象，并使用我们指定的信任管理器初始化
			TrustManager[] tm = { new MyX509TrustManager() };
			SSLContext sslContext = SSLContext.getInstance("SSL", "SunJSSE");
			sslContext.init(null, tm, new java.security.SecureRandom());
			// 从上述SSLContext对象中得到SSLSocketFactory对象
			SSLSocketFactory ssf = sslContext.getSocketFactory();

			URL url = new URL(requestUrl);
			HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
			conn.setSSLSocketFactory(ssf);
			
			conn.setDoOutput(true);
			conn.setDoInput(true);
			conn.setUseCaches(false);
			// 设置请求方式（GET/POST）
			conn.setRequestMethod(requestMethod);

			// 当outputStr不为null时向输出流写数据
			if (null != outputStr) {
				OutputStream outputStream = conn.getOutputStream();
				// 注意编码格式
				outputStream.write(outputStr.getBytes("UTF-8"));
				outputStream.close();
			}

			// 从输入流读取返回内容
			InputStream inputStream = conn.getInputStream();
			InputStreamReader inputStreamReader = new InputStreamReader(inputStream, "utf-8");
			//BufferedReader bufferedReader = new BufferedReader(inputStreamReader);
			BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(conn.getInputStream(),"utf-8"));
			String str = null;
			StringBuffer buffer = new StringBuffer();
			while ((str = bufferedReader.readLine()) != null) {
				buffer.append(str);
			}

			// 释放资源
			bufferedReader.close();
			inputStreamReader.close();
			inputStream.close();
			inputStream = null;
			conn.disconnect();
			jsonObject = JSONObject.fromObject(buffer.toString());
		} catch (ConnectException ce) {
			log.error("连接超时：{}", ce);
		} catch (Exception e) {
			log.info("请求微信 异常------ "+e.getMessage());
			log.error("https请求异常：{}", e);
		}
		return jsonObject;
	}

	/**
	 * 获取接口访问凭证
	 * 
	 * @param appid 凭证
	 * @param appsecret 密钥
	 * @return
	 */
	public  Token getToken(String appid, String appsecret) {
		AccessToken accessToken = new AccessToken();
		Long nowtime =new Date().getTime();
		AbstractApplicationContext ctx   = new ClassPathXmlApplicationContext(new String []{"classpath:applicationContext.xml"});
		AccessTokenService accessTokenService =(AccessTokenService)ctx.getBean("accessTokenService") ;
		List<AccessToken> token_list  = accessTokenService.listById(accessToken);
//		
//	//	log.info(token_list.size()+token_list.get(0).getAccess_token());
		Long add_time = token_list.get(0).getAdd_time();
		Token token = new Token();
		if(add_time+(7200*1000) <= nowtime){ //如果数据库保存得时间加上7200秒（2小时）<=当前时间，说明token已经过期，需重新获取，并更新到数据库
		// 发起GET请求获取凭证
		token_url2 = token_url2.replace("APPID",getSetting().getAppid()).replace("APPSECRET",getSetting().getAppsecret());
		JSONObject jsonObject = httpsRequest(token_url2, "GET", null);
		log.info("jsonObject=="+jsonObject);
			try {
				//根据token获取jsapiticket
				String jsApiTicket = "";
				try {
					jsApiTicket = JsSignUtil.getJsApiTicket(jsonObject.getString("access_token"));
					token.setJsApiTocket(jsApiTicket);
				} catch (Exception e) {
					log.error("获取jsApiTicket失败");
					System.out.println("-----------获取jsApiTicket失败");
				}

				token.setAccessToken(jsonObject.getString("access_token"));
				token.setExpiresIn(jsonObject.getInt("expires_in"));
				Map<String, Object> map =new HashMap<String, Object>();
				map.put("add_time", nowtime);
				map.put("access_token", jsonObject.getString("access_token"));
				map.put("jsapi_ticket", jsApiTicket);
				accessTokenService.update(map);
				//System.out.println(jsonObject.getString("access_token"));
			} catch (JSONException e) {
				token = null;
				// 获取token失败
				log.error("获取token失败 errcode:{} errmsg:{}", jsonObject.getInt("errcode"), jsonObject.getString("errmsg"));
				System.out.println("-----------获取token失败");
			}
		
		}else{
			token.setExpiresIn(7200);
			token.setAccessToken(token_list.get(0).getAccess_token());
			//新增jsapiticket
			token.setJsApiTocket(token_list.get(0).getJsapi_ticket());
		}
		return token;
	}
	

	/**
	 * URL编码（utf-8）
	 * 
	 * @param source
	 * @return
	 */
	public static String urlEncodeUTF8(String source) {
		String result = source;
		try {
			result = java.net.URLEncoder.encode(source, "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 根据内容类型判断文件扩展名
	 * 
	 * @param contentType 内容类型
	 * @return
	 */
	public static String getFileExt(String contentType) {
		String fileExt = "";
		if ("image/jpeg".equals(contentType))
			fileExt = ".jpg";
		else if ("audio/mpeg".equals(contentType))
			fileExt = ".mp3";
		else if ("audio/amr".equals(contentType))
			fileExt = ".amr";
		else if ("video/mp4".equals(contentType))
			fileExt = ".mp4";
		else if ("video/mpeg4".equals(contentType))
			fileExt = ".mp4";
		return fileExt;
	}
	public static void main(String[] args) {
		CommonUtil c = new CommonUtil();
		c.getToken("wxe6473058b26185a","ce01744dffbe15956d02f95e41776486");
	}
}