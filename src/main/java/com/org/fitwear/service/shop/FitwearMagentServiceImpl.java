package com.org.fitwear.service.shop;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.org.fitwear.dao.shop.FitwearMagentMapper;
import com.org.fitwear.model.shop.FitwearMagent;
import com.org.system.model.manager.Page;

@Service
public class FitwearMagentServiceImpl implements FitwearMagentService{

	@Autowired
	private FitwearMagentMapper fitwearMagentMapper;
	
	@Override
	public FitwearMagent get(Long id) {
		// TODO Auto-generated method stub
		return fitwearMagentMapper.selectByPrimaryKey(id);
	}

	@Override
	public void save(FitwearMagent entity) {
		// TODO Auto-generated method stub
		fitwearMagentMapper.insert(entity);
	}

	@Override
	public void update(FitwearMagent entity) {
		// TODO Auto-generated method stub
		fitwearMagentMapper.updateByPrimaryKeySelective(entity);
	}

	@Override
	public void delete(Long id) {
		// TODO Auto-generated method stub
		fitwearMagentMapper.deleteByPrimaryKey(id);
	}

	@Override
	public List<FitwearMagent> getAll() {
		List<FitwearMagent> list = fitwearMagentMapper.queryList(null);
		return list;
	}

	@Override
	public List<FitwearMagent> search(FitwearMagent entity) {
		// TODO Auto-generated method stub
		return fitwearMagentMapper.queryList(entity);
	}

	@Override
	public Page<FitwearMagent> search(Page<FitwearMagent> page, FitwearMagent entity) {
		Long count = fitwearMagentMapper.queryPageCount(entity);
		List<FitwearMagent> list =fitwearMagentMapper.queryPageList(page);
		page.setTotalCount(count);
		page.setResult(list);
		return page;
	}

	
}
