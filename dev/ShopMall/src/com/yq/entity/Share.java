package com.yq.entity;

public class Share {
    private String id;
    private String oppen_id;
    private int is_validate;
    private int is_exchange;
    private int share_box_num;
    private int share_pot_num;
    private String create_time;
    private String update_time;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getOppen_id() {
        return oppen_id;
    }

    public void setOppen_id(String oppen_id) {
        this.oppen_id = oppen_id;
    }

    public int getIs_validate() {
        return is_validate;
    }

    public void setIs_validate(int is_validate) {
        this.is_validate = is_validate;
    }

    public int getIs_exchange() {
        return is_exchange;
    }

    public void setIs_exchange(int is_exchange) {
        this.is_exchange = is_exchange;
    }

    public int getShare_box_num() {
        return share_box_num;
    }

    public void setShare_box_num(int share_box_num) {
        this.share_box_num = share_box_num;
    }

    public int getShare_pot_num() {
        return share_pot_num;
    }

    public void setShare_pot_num(int share_pot_num) {
        this.share_pot_num = share_pot_num;
    }

    public String getCreate_time() {
        return create_time;
    }

    public void setCreate_time(String create_time) {
        this.create_time = create_time;
    }

    public String getUpdate_time() {
        return update_time;
    }

    public void setUpdate_time(String update_time) {
        this.update_time = update_time;
    }
}
