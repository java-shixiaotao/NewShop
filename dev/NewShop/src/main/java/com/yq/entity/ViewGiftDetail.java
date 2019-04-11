package com.yq.entity;

public class ViewGiftDetail {
	 String gift_id;//int(11) NOT NULL AUTO_INCREMENT,
	 String status;//varchar(255) DEFAULT NULL,
	 String actionTime;//int(11) DEFAULT NULL,

	public String getGift_id() {
		return gift_id;
	}

	public void setGift_id(String gift_id) {
		this.gift_id = gift_id;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getActionTime() {
		return actionTime;
	}

	public void setActionTime(String actionTime) {
		this.actionTime = actionTime;
	}
}
