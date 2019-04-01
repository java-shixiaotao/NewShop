package com.yq.entity;

public class TemplateVo extends Page {
    Integer template_id;
    String templateName;
    String goods_name;
    String goods_id;
    String goods_number;
    String goods_price;
    float template_value;
    String createTime;
    String actionTime ;

    public String getGoods_name() {
        return goods_name;
    }

    public void setGoods_name(String goods_name) {
        this.goods_name = goods_name;
    }

    public String getGoods_price() {
        return goods_price;
    }

    public void setGoods_price(String goods_price) {
        this.goods_price = goods_price;
    }

    public Integer getTemplate_id() {
        return template_id;
    }

    public void setTemplate_id(Integer template_id) {
        this.template_id = template_id;
    }

    public String getTemplateName() {
        return templateName;
    }

    public void setTemplateName(String templateName) {
        this.templateName = templateName;
    }

    public String getGoods_id() {
        return goods_id;
    }

    public void setGoods_id(String goods_id) {
        this.goods_id = goods_id;
    }

    public String getGoods_number() {
        return goods_number;
    }

    public void setGoods_number(String goods_number) {
        this.goods_number = goods_number;
    }

    public float getTemplate_value() {
        return template_value;
    }

    public void setTemplate_value(float template_value) {
        this.template_value = template_value;
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

    public TemplateVo(Template tempalte) {
        this.template_id = tempalte.getTemplate_id();
        this.templateName = tempalte.getTemplateName();
        this.goods_name = "";
        this.goods_id = tempalte.getGoods_id();
        this.goods_price = "";
        this.createTime = tempalte.getCreateTime();
        this.actionTime = tempalte.getActionTime();
    }

    public TemplateVo() {

    }
}
