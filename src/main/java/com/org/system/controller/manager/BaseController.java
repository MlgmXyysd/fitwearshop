package com.org.system.controller.manager;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.util.StringUtils;

import com.org.system.model.manager.Page;



/**
 * 基础控制器 
 * 其他控制器继承此控制器获得日期字段类型转换和防止XSS攻击的功能
 */
public class BaseController {


	
	/**
	 * 获取page对象
	 * @param request
	 * @return page对象
	 */
	public <T> Page<T> getPage(HttpServletRequest request){
		int pageNo=1;	//当前页码
		int pageSize=20;	//每页行数
		String orderBy="id";	//排序字段
		String order="asc";	//排序顺序
		if(!StringUtils.isEmpty(request.getParameter("page")))
			pageNo=Integer.valueOf(request.getParameter("page"));
		if(!StringUtils.isEmpty(request.getParameter("rows")))
			pageSize=Integer.valueOf(request.getParameter("rows"));
		if(!StringUtils.isEmpty(request.getParameter("sort")))
			orderBy=request.getParameter("sort").toString();
		if(!StringUtils.isEmpty(request.getParameter("order")))
			order=request.getParameter("order").toString();
		return new Page<T>(pageNo, pageSize, orderBy, order);
	}
	
	/**
	 * 获取easyui分页数据
	 * @param page
	 * @return map对象
	 */
	public <T> Map<String, Object> getEasyUIData(Page<T> page){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", page.getResult());
		map.put("total", page.getTotalCount());
		return map;
	}

}
