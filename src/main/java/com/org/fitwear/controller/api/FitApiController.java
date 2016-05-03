package com.org.fitwear.controller.api;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.org.fitwear.model.shop.FitwearApp;
import com.org.fitwear.service.shop.FitwearAppService;
import com.org.system.controller.manager.BaseController;
import com.org.system.model.manager.Page;

@Controller
@RequestMapping("api")
public class FitApiController extends BaseController{
	
	@Autowired
	private FitwearAppService fitwearAppService;
	
	@RequestMapping(value = "list.json", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getData(HttpServletRequest request, FitwearApp fitwearApp) {
		Page<FitwearApp> page = getPage(request, fitwearApp);
		page = fitwearAppService.search(page, fitwearApp);
		return getEasyUIData(page);
	} 

}
