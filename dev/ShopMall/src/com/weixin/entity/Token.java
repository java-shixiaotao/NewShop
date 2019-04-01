package com.weixin.entity;

/**
 * ƾ֤
 * 
 * @author liufeng
 * @date 2013-10-17
 */
public class Token {
	// �ӿڷ���ƾ֤
	private String accessToken;
	// ƾ֤��Ч�ڣ���λ����
	private int expiresIn;

	private String jsApiTocket;

	public String getAccessToken() {
		return accessToken;
	}

	public void setAccessToken(String accessToken) {
		this.accessToken = accessToken;
	}

	public int getExpiresIn() {
		return expiresIn;
	}

	public void setExpiresIn(int expiresIn) {
		this.expiresIn = expiresIn;
	}

	public String getJsApiTocket() {
		return jsApiTocket;
	}

	public void setJsApiTocket(String jsApiTocket) {
		this.jsApiTocket = jsApiTocket;
	}
}