package com.org.system.dao.manager;

import java.util.List;

import com.org.system.model.manager.Page;
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
	
	public long queryPageCount(User record);
	
	public List<User> queryPageList(Page<User> page);
	
	public List<User> queryList(User record);

}