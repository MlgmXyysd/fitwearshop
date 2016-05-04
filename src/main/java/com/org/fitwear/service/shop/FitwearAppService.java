package com.org.fitwear.service.shop;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.org.fitwear.model.shop.FitwearApp;
import com.org.system.model.manager.Page;

public interface FitwearAppService {

	public FitwearApp get(Long id);

	public void save(FitwearApp entity);

	public void update(FitwearApp entity);

	public void delete(Long id);

	public List<FitwearApp> getAll();

	public List<FitwearApp> search(FitwearApp entity);

	public Page<FitwearApp> search(Page<FitwearApp> page, FitwearApp entity);

	/**
	 * api 列表-  分类 查询
	 * 
	 * @param category
	 * @param first
	 * @param pageSize
	 * @return
	 */
	public Page<FitwearApp> sc(String category, String magentlist, Integer first, Integer pageSize);

	/**
	 * api 列表- name 查询
	 * 
	 * @param category
	 * @param first
	 * @param pageSize
	 * @return
	 */
	public Page<FitwearApp> sn(String appname, String magentlist, Integer first, Integer pageSize);

}
