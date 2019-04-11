package com.yq.entity;

public class MemberLevel {
    private int level_id;
    private String level_name;
    private int once_cond;
    private int at_cond;
    private int at_day;
    private double reduction;


    public String getLevel_name() {
        return level_name;
    }

    public void setLevel_name(String level_name) {
        this.level_name = level_name;
    }

    public int getOnce_cond() {
        return once_cond;
    }

    public void setOnce_cond(int once_cond) {
        this.once_cond = once_cond;
    }

    public int getAt_cond() {
        return at_cond;
    }

    public void setAt_cond(int at_cond) {
        this.at_cond = at_cond;
    }

    public int getAt_day() {
        return at_day;
    }

    public void setAt_day(int at_day) {
        this.at_day = at_day;
    }

    public double getReduction() {
        return reduction;
    }

    public void setReduction(double reduction) {
        this.reduction = reduction;
    }

    public int getLevel_id() {
        return level_id;
    }

    public void setLevel_id(int level_id) {
        this.level_id = level_id;
    }
}
