package com.org.system.dao.manager;

import com.org.system.model.manager.Role;

/**
 * 
 * RoleMapper数据库操作接口类
 * 
 */

public interface RoleMapper {

	int deleteByPrimaryKey(Integer id);

	int insert(Role record);

	int insertSelective(Role record);

	Role selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(Role record);

	int updateByPrimaryKeyWithBLOBs(Role record);

	int updateByPrimaryKey(Role record);
}