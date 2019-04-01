package com.yq.entity;

public class TemplateDetails {
    Integer goods_id;
    String goods_name;
    String goods_img;
    float goods_price;
    Integer goods_num;
    String goods_spe;

    public Integer getGoods_id() {
        return goods_id;
    }

    public void setGoods_id(Integer goods_id) {
        this.goods_id = goods_id;
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

    public float getGoods_price() {
        return goods_price;
    }

    public void setGoods_price(float goods_price) {
        this.goods_price = goods_price;
    }

    public Integer getGoods_num() {
        return goods_num;
    }

    public void setGoods_num(Integer goods_num) {
        this.goods_num = goods_num;
    }

    public String getGoods_spe() {
        return goods_spe;
    }

    public void setGoods_spe(String goods_spe) {
        this.goods_spe = goods_spe;
    }

    public TemplateDetails() {
    }

    public TemplateDetails(Integer goods_id, String goods_name, String goods_img, float goods_price, Integer goods_num, String goods_spe) {
        this.goods_id = goods_id;
        this.goods_name = goods_name;
        this.goods_img = goods_img;
        this.goods_price = goods_price;
        this.goods_num = goods_num;
        this.goods_spe = goods_spe;
    }
}
