package com.org.system.controller.manager;

import java.beans.PropertyEditorSupport;
import java.sql.Timestamp;
import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import com.alibaba.fastjson.JSON;
import com.org.system.model.manager.Page;



/**
 * 基础控制器 
 * 其他控制器继承此控制器获得日期字段类型转换和防止XSS攻击的功能
 */
public class BaseController {


	@InitBinder
	public void initBinder(WebDataBinder binder) {
		// String类型转换，将所有传递进来的String进行HTML编码，防止XSS攻击
		binder.registerCustomEditor(String.class, new PropertyEditorSupport() {
			@Override
			public void setAsText(String text) {
				setValue(text == null ? null : StringEscapeUtils.escapeHtml4(text.trim()));
			}
			@Override
			public String getAsText() {
				Object value = getValue();
				return value != null ? value.toString() : "";
			}
		});
		
		// Date 类型转换
		binder.registerCustomEditor(Date.class, new PropertyEditorSupport() {
			@Override
			public void setAsText(String text) {
				try {
					setValue(DateUtils.parseDate(text));
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
		});
		
		// Timestamp 类型转换
		binder.registerCustomEditor(Timestamp.class, new PropertyEditorSupport() {
			@Override
			public void setAsText(String text) {
				Date date;
				try {
					date = DateUtils.parseDate(text);
					setValue(date==null?null:new Timestamp(date.getTime()));
				} catch (ParseException e) {
					e.printStackTrace();
				}
				
			}
		});
	}
	
	
	/**
	 * 获取page对象
	 * @param request
	 * @return page对象
	 */
	public <T> Page<T> getPage(HttpServletRequest request ,T obj){
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
		if(obj != null){
		 return new Page<T>(pageNo, pageSize, orderBy, order,obj);
		}
		return new Page<T>(pageNo, pageSize, orderBy, order);
	}
	
	/**
	 * 获取page对象
	 * @param request
	 * @return page对象
	 */
	public <T> Page<T> getPage(HttpServletRequest request ){
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
	
	/**
	 * 获取easyui分页数据
	 * @param <T>
	 * @param page
	 * @return map对象
	 */
	public <T> String getEasyUIDataJson(Page<T> page){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", page.getResult());
		map.put("total", page.getTotalCount());
		return JSON.toJSONString(map);
	}

}
