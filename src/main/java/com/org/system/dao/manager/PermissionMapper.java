package com.org.system.dao.manager;

import com.org.system.model.manager.Permission;
import java.util.List;

/**
 * 
 * PermissionMapper数据库操作接口类
 * 
 */

public interface PermissionMapper {

	/**
	 * 
	 * 添加
	 * 
	 **/
	public void save(Permission Permission);

	/**
	 * 
	 * 添加 （匹配有值的字段）
	 * 
	 **/
	public void saveBySelective(Permission Permission);

	/**
	 * 
	 * 批量新增
	 * 
	 **/
	public void saveBatchPermission(List<Permission> list);

	/**
	 * 
	 * 主键ID修改
	 * 
	 **/
	public int updateByPrimaryKey(Permission Permission);

	/**
	 * 
	 * 查询（根据主键ID查询）
	 * 
	 **/
	public Permission selectByPrimaryKey(Integer id);

	/**
	 * 
	 * 多条数据
	 * 
	 **/
	public List<Permission> queryList(Permission Permission);

	/**
	 * 
	 * 分页查询
	 * 
	 **/
	public List<Permission> queryPageList(Permission Permission);

	/**
	 * 
	 * 分页查询
	 * 
	 **/
	public Integer queryPageCount(Permission Permission);

	/**
	 * 获取角色拥有的权限集合
	 * 
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
	 * 获取菜单下的操作
	 * @param pid
	 * @return 操作集合
	 */
	public List<Permission> getMenuOperation(Integer pid);
	
	
	
	
	
}