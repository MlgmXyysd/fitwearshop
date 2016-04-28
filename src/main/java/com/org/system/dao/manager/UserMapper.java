package com.org.system.dao.manager;

import com.org.system.model.manager.User;

/**
 * 
 * UserMapper数据库操作接口类
 * 
 */
public interface UserMapper {

	int deleteByPrimaryKey(Integer id);

	int insert(User record);

	int insertSelective(User record);

	User selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(User record);

	int updateByPrimaryKeyWithBLOBs(User record);

	int updateByPrimaryKey(User record);

	public User selectByUserName(String loginName);

}