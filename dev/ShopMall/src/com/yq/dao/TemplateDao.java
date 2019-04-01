package com.yq.dao;

import com.yq.entity.Template;

import java.util.List;
import java.util.Map;

public interface TemplateDao {
    public int inserttemp(Map<String, Object> map);

    public int tcount(Template template);
    public int upstatus(Map<String, Object> map);
    public List<Template> tlist(Template template);

    public List<Template> tlistById(Template template);
}
