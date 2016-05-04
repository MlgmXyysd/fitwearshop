package com.org.fitwear.controller.api;

import java.util.HashMap;
import java.util.Map;

import com.alibaba.fastjson.JSON;
import com.org.system.model.manager.Page;

public class ApiBaseController {

	public <T> String getSufJson(Page<T> page){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status","0");
		map.put("data", page.getResult());
		map.put("size", page.getCount());
		return JSON.toJSONString(map);
	}
	
	public <T> String getErrorJson(){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status","-1");
		map.put("data", null);
		map.put("size", null);
		return JSON.toJSONString(map);
	}
}
