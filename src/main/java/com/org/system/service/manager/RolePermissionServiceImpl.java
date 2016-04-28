package com.org.system.service.manager;

import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.mgt.RealmSecurityManager;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.org.system.dao.manager.RolePermissionMapper;
import com.org.system.model.manager.Page;
import com.org.system.model.manager.Permission;
import com.org.system.model.manager.Role;
import com.org.system.model.manager.RolePermission;

@Service
public class RolePermissionServiceImpl implements RolePermissionService {

	@Autowired
	private RolePermissionMapper rolePermissionMapper;

	public List<Integer> getPermissionIds(Integer roleId) {
		return rolePermissionMapper.findPermissionIds(roleId);
	}

	public void updateRolePermission(Integer id, List<Integer> oldList, List<Integer> newList) {
		// 是否删除
		for (int i = 0, j = oldList.size(); i < j; i++) {
			if (!newList.contains(oldList.get(i))) {
				rolePermissionMapper.deleteRP(id, oldList.get(i));
			}
		}

		// 是否添加
		for (int i = 0, j = newList.size(); i < j; i++) {
			if (!oldList.contains(newList.get(i))) {
				rolePermissionMapper.insert(getRolePermission(id, newList.get(i)));
			}
		}

	}

	public void clearUserPermCache(PrincipalCollection pc) {
		RealmSecurityManager securityManager =  (RealmSecurityManager) SecurityUtils.getSecurityManager();
		UserRealm userRealm = (UserRealm) securityManager.getRealms().iterator().next();
	    userRealm.clearCachedAuthorizationInfo(pc);
	}

	public RolePermission getRolePermission(Integer roleId, Integer permissionId) {
		RolePermission rp=new RolePermission();
		rp.setRole(new Role(roleId));
		rp.setPermission(new Permission(permissionId));
		return rp;
	}

	public RolePermission get(Integer id) {
		return rolePermissionMapper.selectByPrimaryKey(id);
	}

	public void save(RolePermission entity) {
		rolePermissionMapper.insert(entity);
	}

	public void update(RolePermission entity) {

		rolePermissionMapper.updateByPrimaryKey(entity);
	}

	public void delete(RolePermission entity) {

		
	}

	public void delete(Integer id) {
		rolePermissionMapper.deleteByPrimaryKey(id);
	}

	public List<RolePermission> getAll() {

		return null;
	}

	public List<RolePermission> search(RolePermission entity) {
		return null;
	}

	public Page<RolePermission> search(Page<RolePermission> page, RolePermission entity) {
		Integer count = null;
		List<RolePermission> list = null;
		return null;
	}

}
