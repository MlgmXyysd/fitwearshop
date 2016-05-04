package com.org.fitwear.dao.shop;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

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
	
	List<FitwearApp> selectByMapByC(
			@Param(value = "category") String category,
			@Param(value = "magentlist") String magentlist,
			@Param(value = "first") Integer first,
			@Param(value = "pageSize") Integer pageSize
			);
	
	List<FitwearApp> selectByMapByN(	
			@Param(value = "appname") String appname,
			@Param(value = "magentlist") String magentlist,
			@Param(value = "first") Integer first,
			@Param(value = "pageSize") Integer pageSize);
}