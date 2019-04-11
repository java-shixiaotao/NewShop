package com.yq.entity;

public class Level{
	 Integer level_id;//int(11) NOT NULL AUTO_INCREMENT,
	 String level_name;
	 Integer once_cond;
     Integer at_cond;
	 Integer at_day;
	 Float reduction;

	public Integer getLevel_id() {
		return level_id;
	}

	public void setLevel_id(Integer level_id) {
		this.level_id = level_id;
	}

	public String getLevel_name() {
		return level_name;
	}

	public void setLevel_name(String level_name) {
		this.level_name = level_name;
	}

	public Integer getOnce_cond() {
		return once_cond;
	}

	public void setOnce_cond(Integer once_cond) {
		this.once_cond = once_cond;
	}

	public Integer getAt_cond() {
		return at_cond;
	}

	public void setAt_cond(Integer at_cond) {
		this.at_cond = at_cond;
	}

	public Integer getAt_day() {
		return at_day;
	}

	public void setAt_day(Integer at_day) {
		this.at_day = at_day;
	}

	public Float getReduction() {
		return reduction;
	}

	public void setReduction(Float reduction) {
		this.reduction = reduction;
	}
}
