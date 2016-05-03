package com.org.system.dao.manager;

import java.util.List;

import com.org.system.model.manager.Page;
import com.org.system.model.manager.Permission;
import com.org.system.model.manager.User;

/**
 * 
 * PermissionMapper数据库操作接口类
 * 
 */

public interface PermissionMapper {

	int deleteByPrimaryKey(Integer id);

	int insert(Permission record);

	int insertSelective(Permission record);

	Permission selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(Permission record);

	int updateByPrimaryKeyWithBLOBs(Permission record);

	int updateByPrimaryKey(Permission record);

	/**
	 * 获取角色拥有的权限集合
	 * 
	 * @param userId
	 * @return 结果集合
	 */
	public List<Permission> getPermissions(Integer userId);

	/**
	 * 获取角色拥有的菜单
	 * 
	 * @param userId
	 * @return 菜单集合
	 */
	public List<Permission> getMenus(Integer userId);
	
	/**
	 * 获取角色拥有的菜单
	 * 
	 * @param userId
	 * @return 菜单集合
	 */
	public List<Permission> getMenusList();
	

	/**
	 * 获取菜单下的操作
	 * 
	 * @param pid
	 * @return 操作集合
	 */
	public List<Permission> getMenuOperation(Integer pid);

	public long queryPageCount(Permission record);

	public List<Permission> queryPageList(Page<Permission> page);

	public List<Permission> queryList(Permission record);

}