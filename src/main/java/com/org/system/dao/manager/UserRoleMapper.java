package com.org.system.dao.manager;

import java.util.List;

import com.org.system.model.manager.Page;
import com.org.system.model.manager.Role;
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
	
	
	/**
	 * 依据用户ID删除用户角色关系
	 * @param userId
	 * @return
	 */
	int deleteByUserId(Integer userId);
	
	/**
	 * 依据角色ID删除用户角色关系
	 * @param userId
	 * @return
	 */
	int deleteByRoleId(Integer roleId);
	
	public long queryPageCount(UserRole record);

	public List<UserRole> queryPageList(Page<UserRole> page);

	public List<UserRole> queryList(UserRole record);

}