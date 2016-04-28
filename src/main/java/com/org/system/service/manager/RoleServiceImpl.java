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
		roleMapper.insert(entity);
	}

	public void update(Role entity) {
		roleMapper.updateByPrimaryKey(entity);
	}

	public void delete(Role entity) {

	}

	public void delete(Integer id) {
		roleMapper.deleteByPrimaryKey(id);
	}

	public List<Role> getAll() {
		
		return null;
	}

	public List<Role> search(Role entity) {
		return null;
	}

	public Page<Role> search(Page<Role> page, Role entity) {
		Integer count = null;
		List<Role> list = null;
		return null;
	}

}
