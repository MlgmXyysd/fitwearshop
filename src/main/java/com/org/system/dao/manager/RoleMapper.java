package com.org.system.dao.manager;

import com.org.system.model.manager.Role;
import java.util.List;


/**
 * 
 * RoleMapper数据库操作接口类
 * 
 */

public interface RoleMapper{


	/**
	 * 
	 * 添加
	 * 
	 **/
	 public void save( Role Role);

	/**
	 * 
	 * 添加 （匹配有值的字段）
	 * 
	 **/
	 public void saveBySelective( Role Role);

	/**
	 * 
	 * 批量新增
	 * 
	 **/
	 public void saveBatchRole(List<Role> list);

	/**
	 * 
	 * 主键ID修改 
	 * 
	 **/
	 public int updateByPrimaryKey( Role Role);


	/**
	 * 
	 * 查询（根据主键ID查询）
	 * 
	 **/
	 public Role  selectByPrimaryKey (Long id );

	/**
	 * 
	 * 多条数据
	 * 
	 **/
	 public List<Role>  queryList (Role Role);

	/**
	 * 
	 * 分页查询
	 * 
	 **/
	 public List<Role>  queryPageList(Role Role);

	/**
	 * 
	 * 分页查询
	 * 
	 **/
	 public Integer  queryPageCount (Role Role);

}