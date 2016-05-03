package com.org.fitwear.controller.shop;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.org.fitwear.model.shop.FitwearMagent;
import com.org.fitwear.model.shop.ScCategory;
import com.org.fitwear.service.shop.FitwearMagentService;
import com.org.system.controller.manager.BaseController;
import com.org.system.model.manager.Page;

@Controller
@RequestMapping("fitshop/magent")
public class FitwearMagentController extends BaseController{


	@Autowired
	private FitwearMagentService fitwearMagentService;
	/**
	 * 分类管理页面
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String list() {
		return "fitwearshop/magentList";
	}
	
	/**
	 * 分类管理list
	 */
	@RequiresPermissions("fitshop:magent:view")
	@RequestMapping(value="list.json",method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getData(HttpServletRequest request,FitwearMagent fitwearMagent) {
		Page<FitwearMagent> page=getPage(request);
		page = fitwearMagentService.search(page, fitwearMagent);
		return getEasyUIData(page);
	}
	
	/**
	 * 分类管理list
	 */
	@RequiresPermissions("fitshop:magent:view")
	@RequestMapping(value="all.json")
	@ResponseBody
	public String getDataAll(HttpServletRequest request) {
		List<FitwearMagent> list = fitwearMagentService.getAll();
		return JSON.toJSONString(list);
	}
	
	/**
	 * 分类管理-- 添加 --跳转
	 * @param model
	 * @return
	 */
	@RequiresPermissions("fitshop:magent:add")
	@RequestMapping(value = "create", method = RequestMethod.GET)
	public String createForm(Model model) {
		model.addAttribute("fitwearMagent", new FitwearMagent());
		model.addAttribute("action", "create");
		return "fitwearshop/magentForm";
	}
	
	/**
	 * 添加
	 * @param role
	 * @param model
	 * @return
	 */
	@RequiresPermissions("fitshop:magent:add")
	@RequestMapping(value = "create", method = RequestMethod.POST)
	@ResponseBody
	public String create(@ModelAttribute FitwearMagent fitwearMagent,Model model) {
		fitwearMagentService.save(fitwearMagent);
		return "success";
	}
	
	/**
	 * 分类管理-修改 -跳转
	 * @param id
	 * @param model
	 * @return
	 */
	@RequiresPermissions("fitshop:magent:update")
	@RequestMapping(value = "update/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable("id") Long id, Model model) {
		model.addAttribute("fitwearMagent", fitwearMagentService.get(id));
		model.addAttribute("action", "update");
		return "fitwearshop/magentForm";
	}
	
	/**
	 * 修改角色
	 * @param role
	 * @param model
	 * @return
	 */
	@RequiresPermissions("fitshop:magent:update")
	@RequestMapping(value = "update", method = RequestMethod.POST)
	@ResponseBody
	public String update(@ModelAttribute FitwearMagent fitwearMagent,Model model) {
		fitwearMagentService.update(fitwearMagent);
		return "success";
	}
	
	/**
	 * 删除角色
	 * @param id
	 * @return
	 */
	@RequiresPermissions("fitshop:magent:delete")
	@RequestMapping(value = "delete/{id}")
	@ResponseBody
	public String delete(@PathVariable("id") Long id) {
		fitwearMagentService.delete(id);
		return "success";
	}
	
}
