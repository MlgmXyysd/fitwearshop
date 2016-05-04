package com.org.fitwear.controller.api;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.org.fitwear.model.shop.FitwearApp;
import com.org.fitwear.service.shop.FitwearAppService;
import com.org.system.model.manager.Page;

@Controller
public class FitApiController extends ApiBaseController{
	
	@Autowired
	private FitwearAppService fitwearAppService;
	
	@RequestMapping(value = "sc")
	@ResponseBody
	public String queryFitwearApK(HttpServletRequest request) {
			//		id=7&p=1&pn=40&m=W150
		if(StringUtils.isEmpty(request.getParameter("id"))){
			return getErrorJson();
		}
		if(StringUtils.isEmpty(request.getParameter("p")) 
				|| StringUtils.isEmpty(request.getParameter("pn"))){
			return getErrorJson();
		}
		Integer p = request.getParameter("p")== null ? 1:Integer.valueOf(request.getParameter("p"));
		Integer pn = request.getParameter("pn")== null ? 20:Integer.valueOf(request.getParameter("pn"));
		Page<FitwearApp> page = fitwearAppService.sc(request.getParameter("id"),
				request.getParameter("m"), (p-1)*pn, pn);
		return getSufJson(page);
	} 
	
	@RequestMapping(value = "search")
	@ResponseBody
	public String seckFitwearApK(HttpServletRequest request) {
			//		k=出行&p=1&pn=40&m=W150
			if(StringUtils.isEmpty(request.getParameter("k"))){
				return getErrorJson();
			}
			if(StringUtils.isEmpty(request.getParameter("p")) 
					|| StringUtils.isEmpty(request.getParameter("pn"))){
				return getErrorJson();
			}
			Integer p = request.getParameter("p")== null ? 1:Integer.valueOf(request.getParameter("p"));
			Integer pn = request.getParameter("pn")== null ? 20:Integer.valueOf(request.getParameter("pn"));
			Page<FitwearApp> page = fitwearAppService.sn(request.getParameter("k"),
					request.getParameter("m"), (p-1)*pn, pn);
			return getSufJson(page);
	} 

}
