package com.org.fitwear.service.shop;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.org.fitwear.dao.shop.ScCategoryMapper;
import com.org.fitwear.model.shop.FitwearMagent;
import com.org.fitwear.model.shop.ScCategory;
import com.org.system.model.manager.Page;

@Service
public class ScCateServiceImpl implements ScCateService {

	@Autowired
	private ScCategoryMapper scCategoryMapper;

	@Override
	public ScCategory get(Long id) {
		return scCategoryMapper.selectByPrimaryKey(id);
	}

	@Override
	public void save(ScCategory entity) {
		scCategoryMapper.insert(entity);
	}

	@Override
	public void update(ScCategory entity) {
		scCategoryMapper.updateByPrimaryKeySelective(entity);
	}

	@Override
	public void delete(Long id) {
		scCategoryMapper.deleteByPrimaryKey(id);
	}

	@Override
	public List<ScCategory> getAll() {
		List<ScCategory> list = scCategoryMapper.queryList(null);
		ScCategory s = new ScCategory();
		s.setId(0L);
		s.setCatename("所有");
		list.add(s);
		return list;
	}

	@Override
	public List<ScCategory> search(ScCategory entity) {
		return scCategoryMapper.queryList(entity);
	}

	@Override
	public Page<ScCategory> search(Page<ScCategory> page, ScCategory entity) {
		long count = scCategoryMapper.queryPageCount(entity);
		List<ScCategory> list =scCategoryMapper.queryPageList(page);
		page.setTotalCount(count);
		page.setResult(list);
		return page;
	}

	/**
	 * TODO  设计弊端，写死Map分类信息
	 * 便于分页查询  和客户端查询速度
	 * 省去复杂查询语句
	 * 只用与页面展示效果其他不要错做
	 * @return
	 */
	@Override
	public Map<String, String> getMapAll() {
		Map<String,String> map =new HashMap<String, String>();
		map.put("4", "社交");
		map.put("5", "表盘");
		map.put("7", "工具");
		map.put("9", "游戏");
		map.put("13", "健康");
		map.put("14", "推荐");
		map.put("4,14", "社交,推荐");
		map.put("5,14", "表盘,推荐");
		map.put("7,14", "工具,推荐");
		map.put("9,14", "游戏,推荐");
		map.put("13,14", "健康,推荐");
		return map;
	}

}
