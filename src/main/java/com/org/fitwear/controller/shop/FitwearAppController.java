package com.org.fitwear.controller.shop;

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

import com.org.fitwear.model.shop.FitwearApp;
import com.org.fitwear.service.shop.FitwearAppService;
import com.org.fitwear.service.shop.FitwearMagentService;
import com.org.fitwear.service.shop.ScCateService;
import com.org.system.controller.manager.BaseController;
import com.org.system.model.manager.Page;

@Controller
@RequestMapping("fitshop/app")
public class FitwearAppController extends BaseController {


	@Autowired
	private FitwearAppService fitwearAppService;
	
	@Autowired
	private ScCateService scCateService;
	
	@Autowired
	private FitwearMagentService fitwearMagentService;
	
	/**
	 * 分类管理页面
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String list() {
		return "fitwearshop/appList";
	}
	
	/**
	 * 分类管理list
	 */
	@RequiresPermissions("fitshop:app:view")
	@RequestMapping(value="list.json",method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getData(HttpServletRequest request,FitwearApp fitwearApp) {
		Page<FitwearApp> page=getPage(request,fitwearApp);
		page = fitwearAppService.search(page, fitwearApp);
		return getEasyUIData(page);
	}
	
	/**
	 * 分类管理-- 添加 --跳转
	 * @param model
	 * @return
	 */
	@RequiresPermissions("fitshop:app:add")
	@RequestMapping(value = "create", method = RequestMethod.GET)
	public String createForm(Model model) {
		//应用类别
		model.addAttribute("scCategory", scCateService.getAll());
		//机型
		model.addAttribute("magentList", fitwearMagentService.getAll());
		model.addAttribute("action", "create");
		return "fitwearshop/appForm";
	}
	
	/**
	 * 添加
	 * @param role
	 * @param model
	 * @return
	 */
	@RequiresPermissions("fitshop:app:add")
	@RequestMapping(value = "create", method = RequestMethod.POST)
	@ResponseBody
	public String create(@ModelAttribute FitwearApp fitwearApp,Model model) {
		fitwearAppService.save(fitwearApp);
		return "success";
	}
	
	/**
	 * 分类管理-修改 -跳转
	 * @param id
	 * @param model
	 * @return
	 */
	@RequiresPermissions("fitshop:app:update")
	@RequestMapping(value = "update/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable("id") Long id, Model model) {
		//应用类别
		model.addAttribute("scCategory", scCateService.getAll());
		//机型
		model.addAttribute("magentList", fitwearMagentService.getAll());
		model.addAttribute("fitwearApp", fitwearAppService.get(id));
		model.addAttribute("action", "update");
		return "fitwearshop/appForm";
	}
	
	/**
	 * 修改角色
	 * @param role
	 * @param model
	 * @return
	 */
	@RequiresPermissions("fitshop:app:update")
	@RequestMapping(value = "update", method = RequestMethod.POST)
	@ResponseBody
	public String update(@ModelAttribute FitwearApp fitwearApp,Model model) {
		fitwearAppService.update(fitwearApp);
		return "success";
	}
	
	/**
	 * 删除角色
	 * @param id
	 * @return
	 */
	@RequiresPermissions("fitshop:app:delete")
	@RequestMapping(value = "delete/{id}")
	@ResponseBody
	public String delete(@PathVariable("id") Long id) {
		fitwearAppService.delete(id);
		return "success";
	}
	
}
