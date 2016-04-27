package com.org.system.dao.manager;

import com.org.system.model.manager.UserRole;
import java.util.List;

/**
 * 
 * UserRoleMapper数据库操作接口类
 * 
 */

public interface UserRoleMapper {

	/**
	 * 
	 * 添加
	 * 
	 **/
	public void save(UserRole UserRole);

	/**
	 * 
	 * 添加 （匹配有值的字段）
	 * 
	 **/
	public void saveBySelective(UserRole UserRole);

	/**
	 * 
	 * 批量新增
	 * 
	 **/
	public void saveBatchUserRole(List<UserRole> list);

	/**
	 * 
	 * 主键ID修改
	 * 
	 **/
	public int updateByPrimaryKey(UserRole UserRole);

	/**
	 * 
	 * 查询（根据主键ID查询）
	 * 
	 **/
	public UserRole selectByPrimaryKey(Integer id);

	/**
	 * 
	 * 多条数据
	 * 
	 **/
	public List<UserRole> queryList(UserRole UserRole);

	/**
	 * 
	 * 分页查询
	 * 
	 **/
	public List<UserRole> queryPageList(UserRole UserRole);

	/**
	 * 
	 * 分页查询
	 * 
	 **/
	public Integer queryPageCount(UserRole UserRole);

	/**
	 * 删除用户角色
	 * 
	 * @param userId
	 * @param roleId
	 */
	public void deleteUR(Integer userId, Integer roleId);
	
	
	/**
	 * 查询用户拥有的角色id集合
	 * @param userId
	 * @return 结果集合
	 */
	public List<Integer> findRoleIds(Integer userId);

}