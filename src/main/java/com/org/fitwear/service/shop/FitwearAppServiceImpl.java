package com.org.fitwear.service.shop;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.org.fitwear.dao.shop.FitwearAppMapper;
import com.org.fitwear.dao.shop.ScCategoryMapper;
import com.org.fitwear.model.shop.FitwearApp;
import com.org.fitwear.model.shop.ScCategory;
import com.org.system.model.manager.Page;

@Service
public class FitwearAppServiceImpl implements FitwearAppService {

	@Autowired
	private  FitwearAppMapper fitwearAppMapper;
	
	
	@Override
	public FitwearApp get(Long id) {
		// TODO Auto-generated method stub
		return fitwearAppMapper.selectByPrimaryKey(id);
	}

	@Override
	public void save(FitwearApp entity) {
		// TODO Auto-generated method stub
		fitwearAppMapper.insert(entity);
	}

	@Override
	public void update(FitwearApp entity) {
		// TODO Auto-generated method stub
		fitwearAppMapper.updateByPrimaryKeySelective(entity);
	}

	@Override
	public void delete(Long id) {
		// TODO Auto-generated method stub

		fitwearAppMapper.deleteByPrimaryKey(id);
	}

	@Override
	public List<FitwearApp> getAll() {
		// TODO Auto-generated method stub
		return fitwearAppMapper.queryList(null);
	}

	@Override
	public List<FitwearApp> search(FitwearApp entity) {
		// TODO Auto-generated method stub
		return fitwearAppMapper.queryList(entity);
	}

	@Override
	public Page<FitwearApp> search(Page<FitwearApp> page, FitwearApp entity) {
		long count = fitwearAppMapper.queryPageCount(entity);
		List<FitwearApp> list =fitwearAppMapper.queryPageList(page);
		page.setTotalCount(count);
		page.setResult(list);
		return page;
	}

	@Override
	public Page<FitwearApp> sc(String category, String magentlist, Integer first, Integer pageSize) {
		Page<FitwearApp> page = new Page<FitwearApp>();
		List<FitwearApp> list = fitwearAppMapper.selectByMapByC(category, magentlist, first, pageSize);
		page.setCount(list != null ?list.size():0L);
		page.setResult(list);
		return page;
	}

	@Override
	public Page<FitwearApp> sn(String appname, String magentlist, Integer first, Integer pageSize) {
		Page<FitwearApp> page = new Page<FitwearApp>();
		List<FitwearApp> list = fitwearAppMapper.selectByMapByN(appname, magentlist, first, pageSize);
		page.setCount(list != null ?list.size():0L);
		page.setResult(list);
		return page;
	}


}
