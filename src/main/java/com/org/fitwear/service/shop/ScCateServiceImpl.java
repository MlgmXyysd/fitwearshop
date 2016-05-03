package com.org.fitwear.service.shop;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.org.fitwear.dao.shop.ScCategoryMapper;
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
		return scCategoryMapper.queryList(null);
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

}
