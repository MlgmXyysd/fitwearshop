package com.org.system.service.manager;

import java.util.List;

import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.stereotype.Service;

import com.org.system.model.manager.Page;
import com.org.system.model.manager.RolePermission;
@Service
public class RolePermissionServiceImpl implements RolePermissionService {

	public List<Integer> getPermissionIds(Integer roleId) {
		// TODO Auto-generated method stub
		return null;
	}

	public void updateRolePermission(Integer id, List<Integer> oldList, List<Integer> newList) {
		// TODO Auto-generated method stub

	}

	public void clearUserPermCache(PrincipalCollection pc) {
		// TODO Auto-generated method stub

	}

	public RolePermission getRolePermission(Integer roleId, Integer permissionId) {
		// TODO Auto-generated method stub
		return null;
	}

	public RolePermission get(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	public void save(RolePermission entity) {
		// TODO Auto-generated method stub

	}

	public void update(RolePermission entity) {
		// TODO Auto-generated method stub

	}

	public void delete(RolePermission entity) {
		// TODO Auto-generated method stub

	}

	public void delete(Integer id) {
		// TODO Auto-generated method stub

	}

	public List<RolePermission> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

	public List<RolePermission> search(RolePermission entity) {
		// TODO Auto-generated method stub
		return null;
	}

	public Page<RolePermission> search(Page<RolePermission> page, RolePermission entity) {
		// TODO Auto-generated method stub
		return null;
	}

}
