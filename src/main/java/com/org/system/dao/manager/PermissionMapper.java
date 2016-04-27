package com.org.system.dao.manager;

import com.org.system.model.manager.Permission;
import java.util.List;


/**
 * 
 * PermissionMapper数据库操作接口类
 * 
 */

public interface PermissionMapper{


	/**
	 * 
	 * 添加
	 * 
	 **/
	 public void save( Permission Permission);

	/**
	 * 
	 * 添加 （匹配有值的字段）
	 * 
	 **/
	 public void saveBySelective( Permission Permission);

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
	 public int updateByPrimaryKey( Permission Permission);


	/**
	 * 
	 * 查询（根据主键ID查询）
	 * 
	 **/
	 public Permission  selectByPrimaryKey (Long id );

	/**
	 * 
	 * 多条数据
	 * 
	 **/
	 public List<Permission>  queryList (Permission Permission);

	/**
	 * 
	 * 分页查询
	 * 
	 **/
	 public List<Permission>  queryPageList(Permission Permission);

	/**
	 * 
	 * 分页查询
	 * 
	 **/
	 public Integer  queryPageCount (Permission Permission);

}