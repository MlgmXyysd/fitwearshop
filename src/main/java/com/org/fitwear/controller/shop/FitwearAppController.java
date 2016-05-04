package com.org.fitwear.controller.shop;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.org.fitwear.model.shop.FitwearApp;
import com.org.fitwear.service.shop.FitwearAppService;
import com.org.fitwear.service.shop.FitwearMagentService;
import com.org.fitwear.service.shop.ScCateService;
import com.org.system.controller.manager.BaseController;
import com.org.system.model.manager.Page;
import com.org.utils.FileProUtil;

@Controller
@RequestMapping("fitshop/app")
public class FitwearAppController extends BaseController {

	@Autowired
	private FitwearAppService fitwearAppService;

	@Autowired
	private ScCateService scCateService;

	@Autowired
	private FitwearMagentService fitwearMagentService;

	@Autowired
	private FileProUtil fileProUtil;

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
	@RequestMapping(value = "list.json", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getData(HttpServletRequest request, @ModelAttribute FitwearApp fitwearApp) {
		// 查询所有
		if (fitwearApp.getAppname() != null && "".equals(fitwearApp.getAppname())) {
			fitwearApp.setAppname(null);
		}
		Map<String, String> map = scCateService.getMapAll();
		List<FitwearApp> list = new ArrayList<FitwearApp>();
		if (fitwearApp != null && "0".equals(fitwearApp.getCategory())) {
			fitwearApp.setCategory(null);
		}
		Page<FitwearApp> page = getPage(request, fitwearApp);
		page = fitwearAppService.search(page, fitwearApp);

		for (FitwearApp app : page.getResult()) {
			app.setCategoryName(map.get(app.getCategory()));
			list.add(app);
		}
		page.setResult(null);
		page.setResult(list);
		return getEasyUIData(page);
	}

	/**
	 * 分类管理-- 添加 --跳转
	 * 
	 * @param model
	 * @return
	 */
	@RequiresPermissions("fitshop:app:add")
	@RequestMapping(value = "create", method = RequestMethod.GET)
	public String createForm(Model model) {
		// 应用类别
		model.addAttribute("scCategory", scCateService.getAll());
		// 机型
		model.addAttribute("magentList", fitwearMagentService.getAll());
		model.addAttribute("action", "create");
		return "fitwearshop/appForm";
	}

	/**
	 * 添加
	 * 
	 * @param role
	 * @param model
	 * @return
	 */
	@RequiresPermissions("fitshop:app:add")
	@RequestMapping(value = "create.html", method = RequestMethod.POST)
	@ResponseBody
	public String create(@ModelAttribute FitwearApp fitwearApp, Model model, HttpServletRequest request) {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		MultipartFile mapkfile = multipartRequest.getFile("mapkfile");
		MultipartFile fapkfile = multipartRequest.getFile("fapkfile");
		MultipartFile cutfile = multipartRequest.getFile("cutfile");
		MultipartFile logofile = multipartRequest.getFile("logofile");
		String filepath = fileProUtil.getBasePag() + fitwearApp.getCategory() + "/" + fitwearApp.getPackagename();// 文件子目录
		String filerootpath = fileProUtil.getFileSavePath() + "/" + filepath + "/";// 完整目录
		// logo
		if (!logofile.isEmpty()) {
			String filename = logofile.getOriginalFilename();
			String logo = fileProUtil.getFileBakPath() + filepath + "/" + logofile.getName() + "/" + filename;// 下载子目录+文件名
			fitwearApp.setLogo(logo);
			filewriter(logofile, filerootpath + logofile.getName());
		}
		// 截图
		if (!cutfile.isEmpty()) {
			String filename = cutfile.getOriginalFilename();
			String imgs = fileProUtil.getFileBakPath() + filepath + "/" + cutfile.getName() + "/" + filename;// 下载子目录+文件名
			fitwearApp.setImgs(imgs);
			filewriter(cutfile, filerootpath + cutfile.getName());
		}
		// 手机apk
		if (!mapkfile.isEmpty()) {
			String filename = mapkfile.getOriginalFilename();
			String mApk = fileProUtil.getFileBakPath() + filepath + "/" + mapkfile.getName() + "/" + filename;// 下载子目录+文件名
			fitwearApp.setmApk(mApk);
			fitwearApp.setmApkSize(String.valueOf(mapkfile.getSize()));
			filewriter(mapkfile, filerootpath + mapkfile.getName());
		}
		// 手表apk
		if (!fapkfile.isEmpty()) {
			String filename = fapkfile.getOriginalFilename();
			String fApk = fileProUtil.getFileBakPath() + filepath + "/" + mapkfile.getName() + "/" + filename;// 下载子目录+文件名
			fitwearApp.setfApk(fApk);
			fitwearApp.setfApkSize(String.valueOf(fapkfile.getSize()));
			filewriter(fapkfile, filerootpath + fapkfile.getName());
		}
		// 排序
		if (fitwearApp.getSortorder() == null) {
			fitwearApp.setSortorder("0");
		}
		if (fitwearApp.getIsdel() == null) {
			fitwearApp.setIsdel(0);
		}
		// 机型选择
		if (fitwearApp.getMagentValues() != null && fitwearApp.getMagentValues().length > 0) {

			fitwearApp.setMagentlist(getArraysToString(fitwearApp.getMagentValues()));
		}
		fitwearAppService.save(fitwearApp);
		return "success";
	}

	/**
	 * 分类管理-修改 -跳转
	 * 
	 * @param id
	 * @param model
	 * @return
	 */
	@RequiresPermissions("fitshop:app:update")
	@RequestMapping(value = "update/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable("id") Long id, Model model) {
		// 应用类别
		model.addAttribute("scCategory", scCateService.getAll());
		// 机型
		model.addAttribute("magentList", fitwearMagentService.getAll());
		model.addAttribute("fitwearApp", fitwearAppService.get(id));
		model.addAttribute("action", "update");
		return "fitwearshop/appForm";
	}

	/**
	 * 修改角色
	 * 
	 * @param role
	 * @param model
	 * @return
	 */
	@RequiresPermissions("fitshop:app:update")
	@RequestMapping(value = "update.html", method = RequestMethod.POST)
	@ResponseBody
	public String update(@ModelAttribute FitwearApp fitwearApp, Model model, HttpServletRequest request) {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		MultipartFile mapkfile = multipartRequest.getFile("mapkfile");
		MultipartFile fapkfile = multipartRequest.getFile("fapkfile");
		MultipartFile cutfile = multipartRequest.getFile("cutfile");
		MultipartFile logofile = multipartRequest.getFile("logofile");
		String filepath = fileProUtil.getBasePag() + fitwearApp.getCategory();// 文件子目录
		String filerootpath = fileProUtil.getFileSavePath() + "/" + filepath + "/";// 完整目录
		// logo
		if (!logofile.isEmpty()) {
			String filename = logofile.getOriginalFilename();
			String logo = fileProUtil.getFileBakPath() + filepath + "/" + logofile.getName() + "/" + filename;// 下载子目录+文件名
			fitwearApp.setLogo(logo);
			filewriter(logofile, filerootpath + logofile.getName());
		}
		// 截图
		if (!cutfile.isEmpty()) {
			String filename = cutfile.getOriginalFilename();
			String imgs = fileProUtil.getFileBakPath() + filepath + "/" + cutfile.getName() + "/" + filename;// 下载子目录+文件名
			fitwearApp.setImgs(imgs);
			filewriter(cutfile, filerootpath + cutfile.getName());
		}
		// 手机apk
		if (!mapkfile.isEmpty()) {
			String filename = mapkfile.getOriginalFilename();
			String mApk = fileProUtil.getFileBakPath() + filepath + "/" + mapkfile.getName() + "/" + filename;// 下载子目录+文件名
			fitwearApp.setmApk(mApk);
			fitwearApp.setmApkSize(String.valueOf(mapkfile.getSize()));
			filewriter(mapkfile, filerootpath + mapkfile.getName());
		}
		// 手表apk
		if (!fapkfile.isEmpty()) {
			String filename = fapkfile.getOriginalFilename();
			String fApk = fileProUtil.getFileBakPath() + filepath + "/" + mapkfile.getName() + "/" + filename;// 下载子目录+文件名
			fitwearApp.setfApk(fApk);
			fitwearApp.setfApkSize(String.valueOf(fapkfile.getSize()));
			filewriter(fapkfile, filerootpath + fapkfile.getName());
		}
		// 机型选择
		if (fitwearApp.getMagentValues() != null && fitwearApp.getMagentValues().length > 0) {

			fitwearApp.setMagentlist(getArraysToString(fitwearApp.getMagentValues()));
		}
		fitwearAppService.update(fitwearApp);
		return "success";
	}

	/**
	 * 删除角色
	 * 
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

	/**
	 * apk 推荐
	 * 
	 * @param id
	 * @return
	 */
	@RequiresPermissions("fitshop:app:recommend")
	@RequestMapping(value = "recommend/{id}")
	@ResponseBody
	public String recommend(@PathVariable("id") Long id) {
		fitwearAppService.delete(id);
		FitwearApp fit = fitwearAppService.get(id);
		if (!fit.getCategory().contains("14")) {
			FitwearApp f = new FitwearApp();
			f.setId(id);
			f.setCategory(fit.getCategory() + ",14");
			fitwearAppService.update(f);
		}
		return "success";
	}

	/**
	 * 文件保存
	 * 
	 * @param mult
	 * @param filepath
	 */
	protected static void filewriter(MultipartFile mult, String filepath) {
		try {
			FileUtils.copyInputStreamToFile(mult.getInputStream(), new File(filepath, mult.getOriginalFilename()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	protected static String getArraysToString(Object[] objs) {
		if (objs != null && objs.length > 0) {
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < objs.length; i++) {
				if (i == objs.length - 1) {
					sb.append(objs[i]);
				} else {
					sb.append(objs[i]).append(",");
				}
			}
			return sb.toString();
		}
		return null;

	}

}
