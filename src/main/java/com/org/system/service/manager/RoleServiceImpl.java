package com.org.system.service.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.org.system.dao.manager.RoleMapper;
import com.org.system.model.manager.Page;
import com.org.system.model.manager.Role;

@Service
public class RoleServiceImpl implements RoleService {

	@Autowired
	private RoleMapper roleMapper;

	public Role get(Integer id) {
		return roleMapper.selectByPrimaryKey(id);
	}

	public void save(Role entity) {
		roleMapper.save(entity);
	}

	public void update(Role entity) {
		roleMapper.updateByPrimaryKey(entity);
	}

	public void delete(Role entity) {

	}

	public void delete(Integer id) {

	}

	public List<Role> getAll() {
		
		return roleMapper.queryList(null);
	}

	public List<Role> search(Role entity) {
		return roleMapper.queryList(entity);
	}

	public Page<Role> search(Page<Role> page, Role entity) {
		Integer count = roleMapper.queryPageCount(entity);
		List<Role> list = roleMapper.queryPageList(entity);
		return null;
	}

}
