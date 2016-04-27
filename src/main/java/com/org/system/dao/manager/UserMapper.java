package com.org.system.dao.manager;

import com.org.system.model.manager.User;
import java.util.List;

/**
 * 
 * UserMapper数据库操作接口类
 * 
 */

public interface UserMapper {

	/**
	 * 
	 * 添加
	 * 
	 **/
	public void save(User User);

	/**
	 * 
	 * 添加 （匹配有值的字段）
	 * 
	 **/
	public void saveBySelective(User User);

	/**
	 * 
	 * 批量新增
	 * 
	 **/
	public void saveBatchUser(List<User> list);

	/**
	 * 
	 * 主键ID修改
	 * 
	 **/
	public int updateByPrimaryKey(User User);

	/**
	 * 
	 * 查询（根据主键ID查询）
	 * 
	 **/
	public User selectByPrimaryKey(Integer id);

	/**
	 * 
	 * 多条数据
	 * 
	 **/
	public List<User> queryList(User User);

	/**
	 * 
	 * 分页查询
	 * 
	 **/
	public List<User> queryPageList(User User);

	/**
	 * 
	 * 分页查询
	 * 
	 **/
	public Integer queryPageCount(User User);

	/**
	 * 
	 * 查询（根据主键ID查询）
	 * 
	 **/
	public User selectByUserName(String loginName);

}