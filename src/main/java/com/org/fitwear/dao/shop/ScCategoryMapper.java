package com.org.fitwear.dao.shop;

import java.util.List;

import com.org.fitwear.model.shop.ScCategory;
import com.org.system.model.manager.Page;

public interface ScCategoryMapper {
	
    int deleteByPrimaryKey(Long id);

    int insert(ScCategory record);

    int insertSelective(ScCategory record);

    ScCategory selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(ScCategory record);

    int updateByPrimaryKey(ScCategory record);
    
    public long queryPageCount(ScCategory record);

   	public List<ScCategory> queryPageList(Page<ScCategory> page);

   	public List<ScCategory> queryList(ScCategory record);
}