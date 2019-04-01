package com.weixin.entity;

/**
 * 微信推送消息实体类
 * @author My
 * @CreateDate 2016-1-19
 * @param
 */
public class Massages {

	//微信名称openid
	private String wxName;
	//运单号
	private String wayBillid;
	//货物类型
	private String cargoKind;
	//发货人
	private String sndPerson;
	//发货人电话
	private String cellPhone;
	//收货人
	private String rcvPerson;
	//收货人电话
	private String rcvPhone;
	//最后操作时间
	private String lastTime;
	//最后操作类型
	private String lastType;
	public String getWxName() {
		return wxName;
	}
	public void setWxName(String wxName) {
		this.wxName = wxName;
	}
	public String getWayBillid() {
		return wayBillid;
	}
	public void setWayBillid(String wayBillid) {
		this.wayBillid = wayBillid;
	}
	public String getCargoKind() {
		return cargoKind;
	}
	public void setCargoKind(String cargoKind) {
		this.cargoKind = cargoKind;
	}
	public String getSndPerson() {
		return sndPerson;
	}
	public void setSndPerson(String sndPerson) {
		this.sndPerson = sndPerson;
	}
	public String getCellPhone() {
		return cellPhone;
	}
	public void setCellPhone(String cellPhone) {
		this.cellPhone = cellPhone;
	}
	public String getRcvPerson() {
		return rcvPerson;
	}
	public void setRcvPerson(String rcvPerson) {
		this.rcvPerson = rcvPerson;
	}
	public String getRcvPhone() {
		return rcvPhone;
	}
	public void setRcvPhone(String rcvPhone) {
		this.rcvPhone = rcvPhone;
	}
	public String getLastTime() {
		return lastTime;
	}
	public void setLastTime(String lastTime) {
		this.lastTime = lastTime;
	}
	public String getLastType() {
		return lastType;
	}
	public void setLastType(String lastType) {
		this.lastType = lastType;
	}
	
	
}
