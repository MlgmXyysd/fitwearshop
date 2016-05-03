package com.org.fitwear.dao.shop;

import java.util.List;

import com.org.fitwear.model.shop.FitwearMagent;
import com.org.system.model.manager.Page;

public interface FitwearMagentMapper {
	int deleteByPrimaryKey(Long magId);

    int insert(FitwearMagent record);

    int insertSelective(FitwearMagent record);

    FitwearMagent selectByPrimaryKey(Long magId);

    int updateByPrimaryKeySelective(FitwearMagent record);

    int updateByPrimaryKey(FitwearMagent record);
   
    
    public long queryPageCount(FitwearMagent record);

   	public List<FitwearMagent> queryPageList(Page<FitwearMagent> page);

   	public List<FitwearMagent> queryList(FitwearMagent record);
}