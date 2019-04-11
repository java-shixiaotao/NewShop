package com.yq.entity;

public class Template extends Page {
    Integer template_id;
    String templateName;
    String goods_id;
    String goods_name;
    String goods_img;
    String goods_num;
    String goods_spe;
    String goods_price;
    String goods_total_num;
    float goods_total;
    String createTime;
    String actionTime ;

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

    public String getGoods_name() {
        return goods_name;
    }

    public void setGoods_name(String goods_name) {
        this.goods_name = goods_name;
    }

    public String getGoods_img() {
        return goods_img;
    }

    public void setGoods_img(String goods_img) {
        this.goods_img = goods_img;
    }

    public String getGoods_num() {
        return goods_num;
    }

    public void setGoods_num(String goods_num) {
        this.goods_num = goods_num;
    }

    public String getGoods_spe() {
        return goods_spe;
    }

    public void setGoods_spe(String goods_spe) {
        this.goods_spe = goods_spe;
    }

    public String getGoods_price() {
        return goods_price;
    }

    public void setGoods_price(String goods_price) {
        this.goods_price = goods_price;
    }

    public String getGoods_total_num() {
        return goods_total_num;
    }

    public void setGoods_total_num(String goods_total_num) {
        this.goods_total_num = goods_total_num;
    }

    public float getGoods_total() {
        return goods_total;
    }

    public void setGoods_total(float goods_total) {
        this.goods_total = goods_total;
    }

    public Template() {
    }
}
