package com.org.system.service.manager;

import java.util.List;

import org.apache.shiro.subject.PrincipalCollection;

import com.org.system.model.manager.Page;
import com.org.system.model.manager.RolePermission;

/**
 * 角色权限service
 */
public interface RolePermissionService{
	
	
	/**
	 * 获取角色权限id集合
	 * @param id
	 * @return List
	 */
	public List<Integer> getPermissionIds(Integer roleId);
	
	/**
	 * 修改角色权限
	 * @param id
	 * @param oldList
	 * @param newList
	 */
	public void updateRolePermission(Integer id,List<Integer> oldList,List<Integer> newList);
	
	/**
	 * 清空该角色用户的权限缓存
	 */
	public void clearUserPermCache(PrincipalCollection pc);
	
	/**
	 * 构造角色权限对象
	 * @param roleId
	 * @param permissionId
	 * @return RolePermission
	 */
	public RolePermission getRolePermission(Integer roleId,Integer permissionId);
	
	public RolePermission get( Integer id) ;

	public void save( RolePermission entity);
	
	public void update( RolePermission entity);
	
	public void delete( RolePermission entity);
	
	public void delete( Integer id);
	
	public List<RolePermission> getAll();
	
	public List<RolePermission> search( RolePermission entity);
	
	public Page<RolePermission> search( Page<RolePermission> page, RolePermission entity) ;
	
}
