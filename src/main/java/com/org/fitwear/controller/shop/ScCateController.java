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
import com.org.fitwear.model.shop.ScCategory;
import com.org.fitwear.service.shop.ScCateService;
import com.org.system.controller.manager.BaseController;
import com.org.system.model.manager.Page;

@Controller
@RequestMapping("fitshop/category")
public class ScCateController extends BaseController {
	
	@Autowired
	private ScCateService scCateService;
	
	/**
	 * 分类管理页面
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String list() {
		return "fitwearshop/categoryList";
	}
	
	/**
	 * 分类管理list
	 */
	@RequiresPermissions("fitshop:category:view")
	@RequestMapping(value="list.json",method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getData(HttpServletRequest request,ScCategory scCategory) {
		Page<ScCategory> page=getPage(request);
		page = scCateService.search(page, scCategory);
		return getEasyUIData(page);
	}
	
	/**
	 * 分类管理list
	 */
	@RequiresPermissions("fitshop:category:view")
	@RequestMapping(value="all.json")
	@ResponseBody
	public String getDataAll(HttpServletRequest request) {
		List<ScCategory> list = scCateService.getAll();
		return JSON.toJSONString(list);
	}
	
	/**
	 * 分类管理-- 添加 --跳转
	 * @param model
	 * @return
	 */
	@RequiresPermissions("fitshop:category:add")
	@RequestMapping(value = "create", method = RequestMethod.GET)
	public String createForm(Model model) {
		model.addAttribute("scCategory", new ScCategory());
		model.addAttribute("action", "create");
		return "fitwearshop/categoryForm";
	}
	
	/**
	 * 添加
	 * @param role
	 * @param model
	 * @return
	 */
	@RequiresPermissions("fitshop:category:add")
	@RequestMapping(value = "create", method = RequestMethod.POST)
	@ResponseBody
	public String create(@ModelAttribute ScCategory scCategory,Model model) {
		scCateService.save(scCategory);
		return "success";
	}
	
	/**
	 * 分类管理-修改 -跳转
	 * @param id
	 * @param model
	 * @return
	 */
	@RequiresPermissions("fitshop:category:update")
	@RequestMapping(value = "update/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable("id") Long id, Model model) {
		model.addAttribute("scCategory", scCateService.get(id));
		model.addAttribute("action", "update");
		return "fitwearshop/categoryForm";
	}
	
	/**
	 * 修改角色
	 * @param role
	 * @param model
	 * @return
	 */
	@RequiresPermissions("fitshop:category:update")
	@RequestMapping(value = "update", method = RequestMethod.POST)
	@ResponseBody
	public String update(@ModelAttribute ScCategory scCategory,Model model) {
		scCateService.update(scCategory);
		return "success";
	}
	
	/**
	 * 删除角色
	 * @param id
	 * @return
	 */
	@RequiresPermissions("fitshop:category:delete")
	@RequestMapping(value = "delete/{id}")
	@ResponseBody
	public String delete(@PathVariable("id") Long id) {
		scCateService.delete(id);
		return "success";
	}
	

}
