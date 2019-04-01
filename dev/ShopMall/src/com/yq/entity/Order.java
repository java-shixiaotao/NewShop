package com.yq.entity;

public class Order extends Page{
	
	String order_id ;
	String goods_id; // varchar(255) DEFAULT NULL,
	String goods_name; // text,
	String goods_img; // text,
	String goods_spe; // text,
	int spe_type;
	String goods_price; // varchar(255) DEFAULT NULL,
	String goods_num; // varchar(255) DEFAULT NULL,
	String addr_name;
	String add_time ;
	String oppen_id;
	int status ;
	int order_type;
	double goods_total;
	String member_code;
	String update_time;
	String note;
	String express_name;
	String express_hm;
	String express_dm;
	String gift_id;
	long member_id;
	String start_time;
	String end_time;

	public String getOrder_id() {
		return order_id;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}

	public String getGoods_id() {
		return goods_id;
	}

	public void setGoods_id(String goods_id) {
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

	public String getGoods_spe() {
		return goods_spe;
	}

	public void setGoods_spe(String goods_spe) {
		this.goods_spe = goods_spe;
	}

	public int getSpe_type() {
		return spe_type;
	}

	public void setSpe_type(int spe_type) {
		this.spe_type = spe_type;
	}

	public String getGoods_price() {
		return goods_price;
	}

	public void setGoods_price(String goods_price) {
		this.goods_price = goods_price;
	}

	public String getGoods_num() {
		return goods_num;
	}

	public void setGoods_num(String goods_num) {
		this.goods_num = goods_num;
	}

	public String getAddr_name() {
		return addr_name;
	}

	public void setAddr_name(String addr_name) {
		this.addr_name = addr_name;
	}

	public String getAdd_time() {
		return add_time;
	}

	public void setAdd_time(String add_time) {
		this.add_time = add_time;
	}

	public String getOppen_id() {
		return oppen_id;
	}

	public void setOppen_id(String oppen_id) {
		this.oppen_id = oppen_id;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getOrder_type() {
		return order_type;
	}

	public void setOrder_type(int order_type) {
		this.order_type = order_type;
	}

	public double getGoods_total() {
		return goods_total;
	}

	public void setGoods_total(double goods_total) {
		this.goods_total = goods_total;
	}

	public String getMember_code() {
		return member_code;
	}

	public void setMember_code(String member_code) {
		this.member_code = member_code;
	}

	public String getUpdate_time() {
		return update_time;
	}

	public void setUpdate_time(String update_time) {
		this.update_time = update_time;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getExpress_name() {
		return express_name;
	}

	public void setExpress_name(String express_name) {
		this.express_name = express_name;
	}

	public String getExpress_hm() {
		return express_hm;
	}

	public void setExpress_hm(String express_hm) {
		this.express_hm = express_hm;
	}

	public String getExpress_dm() {
		return express_dm;
	}

	public void setExpress_dm(String express_dm) {
		this.express_dm = express_dm;
	}

	public String getGift_id() {
		return gift_id;
	}

	public void setGift_id(String gift_id) {
		this.gift_id = gift_id;
	}

	public long getMember_id() {
		return member_id;
	}

	public void setMember_id(long member_id) {
		this.member_id = member_id;
	}

	public String getStart_time() {
		return start_time;
	}

	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}

	public String getEnd_time() {
		return end_time;
	}

	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}
}
