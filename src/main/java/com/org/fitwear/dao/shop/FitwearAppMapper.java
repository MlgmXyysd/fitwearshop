package com.org.fitwear.dao.shop;

import java.util.List;

import com.org.fitwear.model.shop.FitwearApp;
import com.org.system.model.manager.Page;

public interface FitwearAppMapper {
	
    int deleteByPrimaryKey(Long id);

    int insert(FitwearApp record);

    int insertSelective(FitwearApp record);

    FitwearApp selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(FitwearApp record);

    int updateByPrimaryKey(FitwearApp record);
    
    public long queryPageCount(FitwearApp record);

	public List<FitwearApp> queryPageList(Page<FitwearApp> page);

	public List<FitwearApp> queryList(FitwearApp record);
}