package com.yq.entity;

public class TemplateGiftDetail extends Page{
    Integer itemID;
    String gift_id;
    String template_id;
    Integer status;
    Integer tgID;
    String createTime;
    String actionTime;
    String usingTime;

    public Integer getItemID() {
        return itemID;
    }

    public void setItemID(Integer itemID) {
        this.itemID = itemID;
    }

    public String getGift_id() {
        return gift_id;
    }

    public void setGift_id(String gift_id) {
        this.gift_id = gift_id;
    }

    public String getTemplate_id() {
        return template_id;
    }

    public void setTemplate_id(String template_id) {
        this.template_id = template_id;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getTgID() {
        return tgID;
    }

    public void setTgID(Integer tgID) {
        this.tgID = tgID;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getActionTime() {
        return actionTime;
    }

    public void setActionTime(String actionTime) {
        this.actionTime = actionTime;
    }

    public String getUsingTime() {
        return usingTime;
    }

    public void setUsingTime(String usingTime) {
        this.usingTime = usingTime;
    }

    public TemplateGiftDetail() {
    }

    public TemplateGiftDetail( String gift_id, String template_id, Integer status, Integer tgID, String createTime, String actionTime) {
        this.gift_id = gift_id;
        this.template_id = template_id;
        this.status = status;
        this.tgID = tgID;
        this.createTime = createTime;
        this.actionTime = actionTime;
    }
}
