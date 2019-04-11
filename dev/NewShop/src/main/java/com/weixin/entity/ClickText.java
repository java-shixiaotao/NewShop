package com.weixin.entity;

public class ClickText {
    private String ct_key;

    private Integer type;

    private String content;

    private String title;
    
    private String intro;

    private String pic_url;

    private String url;

  
    public String getCt_key() {
		return ct_key;
	}

	public void setCt_key(String ct_key) {
		this.ct_key = ct_key;
	}

	public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro == null ? null : intro.trim();
    }

    public String getPic_url() {
        return pic_url;
    }

    public void setPic_url(String pic_url) {
        this.pic_url = pic_url == null ? null : pic_url.trim();
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
    
}