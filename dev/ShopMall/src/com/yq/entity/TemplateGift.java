package com.yq.entity;

public class TemplateGift extends Page{
    Integer tgID;
    String template_id;
    String templateName;
    Integer num;
    Integer user_id;
    String createTime;
    String actionTime;

    public String getTemplateName() {
        return templateName;
    }

    public void setTemplateName(String templateName) {
        this.templateName = templateName;
    }

    public Integer getTgID() {
        return tgID;
    }

    public void setTgID(Integer tgID) {
        this.tgID = tgID;
    }

    public String getTemplate_id() {
        return template_id;
    }

    public void setTemplate_id(String template_id) {
        this.template_id = template_id;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
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

    public TemplateGift() {
    }

    public TemplateGift(Integer tgID, String template_id, String templateName, Integer num, Integer user_id, String createTime, String actionTime) {
        this.tgID = tgID;
        this.template_id = template_id;
        this.templateName = templateName;
        this.num = num;
        this.user_id = user_id;
        this.createTime = createTime;
        this.actionTime = actionTime;
    }
}
