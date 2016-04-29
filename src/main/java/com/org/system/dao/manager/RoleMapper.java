package com.org.system.dao.manager;

import java.util.List;

import com.org.system.model.manager.Page;
import com.org.system.model.manager.Role;
import com.org.system.model.manager.User;

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

	public long queryPageCount(Role record);

	public List<Role> queryPageList(Page<Role> page);

	public List<Role> queryList(Role record);
}