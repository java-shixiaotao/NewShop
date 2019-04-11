package com.weixin.util;

import com.weixin.entity.Token;
import com.weixin.pay.util.Sha1Util;
import net.sf.json.JSONObject;

import java.util.Formatter;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;


public class JsSignUtil {
	//微信获取jsapiticket的官方请求地址
	public static String jsApiTicketUrl = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=ACCESS_TOKEN&type=jsapi";

	public static Map<String, String> sign(String url) {
		CommonUtil commonUtil = new CommonUtil();
		StringUtil st = new StringUtil();
		//请求地址
		String linkTitle = st.getSetting().getLink();
		if(url.indexOf("http")<0){
			url = linkTitle + url;
		}
		Token token = commonUtil.getToken(st.getSetting().getAppid(), st.getSetting().getAppsecret());
		//根据accessToken获取accesstocken
		String accessToken = token.getAccessToken();
//		String jsapi_ticket = getJsApiTicket(accessToken);
		String jsapi_ticket = token.getJsApiTocket();
		Map<String, String> ret = new HashMap<String, String>();
		String nonce_str = create_nonce_str();
		String timestamp = create_timestamp();
		String string1;
		String signature = "";
		//注意这里参数名必须全部小写，且必须有序
		string1 = "jsapi_ticket=" + jsapi_ticket +
				"&noncestr=" + nonce_str +
				"&timestamp=" + timestamp +
				"&url=" + url;
		System.out.println("string1="+string1);
//			try
//		{
//			MessageDigest crypt = MessageDigest.getInstance("SHA-1");
//			crypt.reset();
//			crypt.update(string1.getBytes("UTF-8"));
//			signature = byteToHex(crypt.digest());
//		}
//		catch (NoSuchAlgorithmException e)
//		{
//			e.printStackTrace();
//		}
//		catch (UnsupportedEncodingException e)
//		{
//			e.printStackTrace();
//		}
		signature = Sha1Util.getSha1(string1);
		ret.put("url", url);
		ret.put("jsapi_ticket", jsapi_ticket);
		ret.put("nonceStr", nonce_str);
		ret.put("timestamp", timestamp);
		ret.put("signature", signature);
		ret.put("appid", st.getSetting().getAppid());
		ret.put("linkTitle", linkTitle);
//		ret.put("appId", "wxcbba33f6b9ce1286");
		System.out.println("1.ticket(原始)="+jsapi_ticket);
		System.out.println("2.url="+ret.get("url"));
		System.out.println("3.jsapi_ticket（处理后）="+ret.get("jsapi_ticket"));
		System.out.println("4.nonceStr="+ret.get("nonceStr"));
		System.out.println("5.signature="+ret.get("signature"));
		System.out.println("6.timestamp="+ret.get("timestamp"));
		return ret;
	}


	/**
	 * 随机加密
	 * @param hash
	 * @return
	 */
	private static String byteToHex(final byte[] hash) {
		Formatter formatter = new Formatter();
		for (byte b : hash)
		{
			formatter.format("%02x", b);
		}
		String result = formatter.toString();
		formatter.close();
		return result;
	}

	/**
	 * 产生随机串--由程序自己随机产生
	 * @return
	 */
	private static String create_nonce_str() {
		return UUID.randomUUID().toString();
	}

	/**
	 * 由程序自己获取当前时间
	 * @return
	 */
	private static String create_timestamp() {
		return Long.toString(System.currentTimeMillis() / 1000);
	}

	public static String getJsApiTicket(String accessToken) throws Exception{
		String jsApiTicket = "";
		String jsApiTicket_url = jsApiTicketUrl.replace("ACCESS_TOKEN",accessToken);
		// 获取用户的openid
		JSONObject json = new JSONObject();
		json = CommonUtil.httpsRequest(jsApiTicket_url, "GET", null);
		if (json != null) {
			jsApiTicket = json.getString("ticket");
		}
		return jsApiTicket;
	}

}

