package com.org.fitwear.service.shop;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.org.fitwear.dao.shop.FitwearAppMapper;
import com.org.fitwear.model.shop.FitwearApp;
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

}
