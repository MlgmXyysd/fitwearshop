package com.org.system.service.manager;

import java.util.List;

import com.org.system.model.manager.Page;
import com.org.system.model.manager.Permission;

/**
 * 权限service
 */
public interface PermissionService {
	
	/**
	 * 添加菜单基础操作
	 * @param pid 菜单id
	 * @param pName 菜单权限标识名
	 */
	public void addBaseOpe(Integer pid,String pClassName);
	
	/**
	 * 获取角色拥有的权限集合
	 * @param userId
	 * @return 结果集合
	 */
	public List<Permission> getPermissions(Integer userId);
	
	/**
	 * 获取角色拥有的菜单
	 * @param userId
	 * @return 菜单集合
	 */
	public List<Permission> getMenus(Integer userId);
	
	/**
	 * 获取所有菜单
	 * @return 菜单集合
	 */
	public List<Permission> getMenus();
	
	
	/**
	 * 获取所有菜单
	 * @return 菜单集合
	 */
	public List<Permission> getMenusList();
	
	
	
	/**
	 * 获取菜单下的操作
	 * @param pid
	 * @return 操作集合
	 */
	public List<Permission> getMenuOperation(Integer pid);
	
	public Permission get( Integer id) ;

	public void save( Permission entity);
	
	public void update( Permission entity);
	
	public void delete( Permission entity);
	
	public void delete( Integer id);
	
	public List<Permission> getAll();
	
	public List<Permission> search( Permission entity);
	
	public Page<Permission> search( Page<Permission> page,  Permission entity) ;

}
