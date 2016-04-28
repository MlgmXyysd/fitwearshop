package com.org.system.dao.manager;

import java.util.List;

import com.org.system.model.manager.UserRole;

/**
 * 
 * UserRoleMapper数据库操作接口类
 * 
 */

public interface UserRoleMapper {

	int deleteByPrimaryKey(Integer id);

	int insert(UserRole record);

	int insertSelective(UserRole record);

	UserRole selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(UserRole record);

	int updateByPrimaryKey(UserRole record);

	/**
	 * 删除用户角色
	 * 
	 * @param userId
	 * @param roleId
	 */
	public void deleteUR(Integer userId, Integer roleId);

	/**
	 * 查询用户拥有的角色id集合
	 * 
	 * @param userId
	 * @return 结果集合
	 */
	public List<Integer> findRoleIds(Integer userId);

}