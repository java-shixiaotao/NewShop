package com.yq.entity;

public class Membership extends Page {
    int user_id;//int(11) NOT NULL AUTO_INCREMENT,
    String oppen_id;//varchar(255) NOT NULL,
    String username;//varchar(255) DEFAULT NULL COMMENT '会员姓名',
    String realname;//varchar(255) DEFAULT NULL COMMENT '会员姓名',
    String password;//varchar(255) DEFAULT NULL,
    String head_img;//varchar(255) DEFAULT NULL,
    String add_time;
    int status;
    String idcardno;
    String birthday;
    String addr_name;
    String phone;
    String email;
    String level;
    String addr_id;
    private Long referee;
    private double balance;
    private double integral;
    private int tuijian_num;
    private int start_level;
    private int tuijian_riseweight;
    private String member_code;
    private String group_name;
    private int group_if_tuanzhang;
    private int inventory_box_num;
    private int inventory_guan_num;

    public int getInventory_box_num() {
        return inventory_box_num;
    }

    public void setInventory_box_num(int inventory_box_num) {
        this.inventory_box_num = inventory_box_num;
    }

    public int getInventory_guan_num() {
        return inventory_guan_num;
    }

    public void setInventory_guan_num(int inventory_guan_num) {
        this.inventory_guan_num = inventory_guan_num;
    }

    public int getTuijian_num() {
        return tuijian_num;
    }

    public void setTuijian_num(int tuijian_num) {
        this.tuijian_num = tuijian_num;
    }

    public int getStart_level() {
        return start_level;
    }

    public void setStart_level(int start_level) {
        this.start_level = start_level;
    }

    public int getTuijian_riseweight() {
        return tuijian_riseweight;
    }

    public void setTuijian_riseweight(int tuijian_riseweight) {
        this.tuijian_riseweight = tuijian_riseweight;
    }

    public String getMember_code() {
        return member_code;
    }

    public void setMember_code(String member_code) {
        this.member_code = member_code;
    }

    public String getGroup_name() {
        return group_name;
    }

    public void setGroup_name(String group_name) {
        this.group_name = group_name;
    }

    public int getGroup_if_tuanzhang() {
        return group_if_tuanzhang;
    }

    public void setGroup_if_tuanzhang(int group_if_tuanzhang) {
        this.group_if_tuanzhang = group_if_tuanzhang;
    }

    public int getGroup_if_tuanyuan() {
        return group_if_tuanyuan;
    }

    public void setGroup_if_tuanyuan(int group_if_tuanyuan) {
        this.group_if_tuanyuan = group_if_tuanyuan;
    }

    private int group_if_tuanyuan;

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getOppen_id() {
        return oppen_id;
    }

    public void setOppen_id(String oppen_id) {
        this.oppen_id = oppen_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getHead_img() {
        return head_img;
    }

    public void setHead_img(String head_img) {
        this.head_img = head_img;
    }

    public String getAdd_time() {
        return add_time;
    }

    public void setAdd_time(String add_time) {
        this.add_time = add_time;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getIdcardno() {
        return idcardno;
    }

    public void setIdcardno(String idcardno) {
        this.idcardno = idcardno;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getAddr_name() {
        return addr_name;
    }

    public void setAddr_name(String addr_name) {
        this.addr_name = addr_name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getAddr_id() {
        return addr_id;
    }

    public void setAddr_id(String addr_id) {
        this.addr_id = addr_id;
    }

    public Long getReferee() {
        return referee;
    }

    public void setReferee(Long referee) {
        this.referee = referee;
    }

    public double getBalance() {
        return balance;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }

    public double getIntegral() {
        return integral;
    }

    public void setIntegral(double integral) {
        this.integral = integral;
    }
}
