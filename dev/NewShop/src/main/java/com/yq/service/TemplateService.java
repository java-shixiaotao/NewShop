package com.yq.service;

import com.yq.dao.TemplateDao;
import com.yq.entity.Template;
import com.yq.entity.TemplateDetails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class TemplateService {
    @Autowired
    private TemplateDao templateDao;

    public int inserttemp(Map<String,Object> map ){
        return templateDao.inserttemp(map);
    }

    public int count(Template template){
        return templateDao.tcount(template);
    }

    public List<Template> list(Template template){
        return templateDao.tlist(template);
    }

    public List<TemplateDetails> listById(Template template){
        List<TemplateDetails> tdlist=new ArrayList<>();
        List<Template> list=templateDao.tlistById(template);
        if(list!=null&&list.size()>0){
           String[] goods_name=list.get(0).getGoods_name().split(",-=");
           String[] goods_id=list.get(0).getGoods_id().split(",-=");
           String[] goods_img=list.get(0).getGoods_img().split(",-=");
           String[] goods_num=list.get(0).getGoods_num().split(",-=");
           String[] goods_spe=list.get(0).getGoods_spe().split(",-=");
           String[] goods_price=list.get(0).getGoods_price().split(",-=");
           for(int i=0;i<goods_name.length;i++){
               TemplateDetails t=new TemplateDetails(Integer.parseInt(goods_id[i]),goods_name[i],
                       goods_img[i],Float.parseFloat(goods_price[i]),Integer.parseInt(goods_num[i]),
                       goods_spe[i]);
               tdlist.add(t);
           }
        }
        return tdlist;
    }

    public int upstatus(Map<String,Object> map){
        return templateDao.upstatus(map);
    }
}
