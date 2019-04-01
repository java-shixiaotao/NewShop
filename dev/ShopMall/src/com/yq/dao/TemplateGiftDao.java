package com.yq.dao;

import com.yq.entity.TemplateGift;
import com.yq.entity.TemplateGiftDetail;

import java.util.List;
import java.util.Map;


public interface TemplateGiftDao {
    public int tgcount(TemplateGift template);

    public List<TemplateGift> tglist(TemplateGift template);

    public List<TemplateGiftDetail> tglistById(TemplateGiftDetail template);

    public List<Map<String,Object>> tggiftidlistById(TemplateGiftDetail template);

    public int inserttempg(TemplateGift map);

    public int insertCodeBatch(List<TemplateGiftDetail> tgds);

}
