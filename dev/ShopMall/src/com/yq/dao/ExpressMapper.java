package com.yq.dao;

import java.util.List;

import com.yq.entity.Express;

public interface ExpressMapper {
	
	
	int deleteByPrimaryKey(Integer express_id);

    int insert(Express record);

    List<Express> select(Express express);
    
    Express selectByPrimaryKey(Integer express_id);

    
    int updateByPrimaryKey(Express record);
}
