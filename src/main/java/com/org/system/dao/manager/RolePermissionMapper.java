package com.org.system.dao.manager;

import java.util.List;

import com.org.system.model.manager.Page;
import com.org.system.model.manager.Role;
import com.org.system.model.manager.RolePermission;
import com.org.system.model.manager.User;

/**
 * 
 * RolePermissionMapper数据库操作接口类
 * 
 */

public interface RolePermissionMapper {

	int deleteByPrimaryKey(Integer id);

    int insert(RolePermission record);

    int insertSelective(RolePermission record);

    RolePermission selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(RolePermission record);

    int updateByPrimaryKey(RolePermission record);
	
	int deleteByRoleId(Integer roleId);
	
	int deleteBypermissionId(Integer permissionId);
	
	/**
	 * 查询角色拥有的权限id
	 * 
	 * @param roleId
	 * @return 结果集合
	 */
	public List<Integer> findPermissionIds(Integer roleId);
	
	/**
	 * 删除角色权限
	 * @param roleId
	 * @param permissionId
	 */
	public void deleteRP(Integer roleId,Integer permissionId);
	
	
	public long queryPageCount(RolePermission record);

	public List<RolePermission> queryPageList(Page<RolePermission> page);

	public List<RolePermission> queryList(RolePermission record);
	
	
	
	
	
}