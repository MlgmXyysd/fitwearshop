package com.org.system.service.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.org.system.dao.manager.UserRoleMapper;
import com.org.system.model.manager.Page;
import com.org.system.model.manager.Role;
import com.org.system.model.manager.User;
import com.org.system.model.manager.UserRole;

@Service
public class UserRoleServiceImpl implements UserRoleService {

	@Autowired
	private UserRoleMapper userRoleMapper;

	public UserRole get(Integer id) {
		return userRoleMapper.selectByPrimaryKey(id);
	}

	public void save(UserRole entity) {
		userRoleMapper.insert(entity);
	}

	public void update(UserRole entity) {
		userRoleMapper.updateByPrimaryKey(entity);
	}

	public void delete(UserRole entity) {

	}

	public void delete(Integer id) {
		userRoleMapper.deleteByPrimaryKey(id);
	}

	public List<UserRole> getAll() {

		return userRoleMapper.queryList(null);
	}

	public List<UserRole> search(UserRole entity) {
		return userRoleMapper.queryList(entity);
	}

	public Page<UserRole> search(Page<UserRole> page, UserRole entity) {
		Page<UserRole> p = new Page<UserRole>();
		Long count = userRoleMapper.queryPageCount(entity);
		List<UserRole> list =userRoleMapper.queryPageList(page);
		p.setTotalCount(count);
		p.setResult(list);
		return p;
	}

	
	
	
	public List<Integer> getRoleIdList(Integer userId) {
		return userRoleMapper.findRoleIds(userId);
	}

	public void updateUserRole(Integer userId, List<Integer> roleIdsOld, List<Integer> roleIdsNew) {
		// 是否删除
		for (int i = 0, j = roleIdsOld.size(); i < j; i++) {
			if (!roleIdsNew.contains(roleIdsOld.get(i))) {
				userRoleMapper.deleteUR(userId, roleIdsOld.get(i));
			}
		}

		// 是否添加
		for (int m = 0, n = roleIdsNew.size(); m < n; m++) {
			if (!roleIdsOld.contains(roleIdsNew.get(m))) {
				UserRole ur = new UserRole();
				ur.setUserId(userId);
				ur.setRoleId(roleIdsNew.get(m));
				userRoleMapper.insert(ur);
			}
		}
	}

	/**
	 * 构建UserRole
	 * 
	 * @param userId
	 * @param roleId
	 * @return UserRole
	 */
	private UserRole getUserRole(Integer userId, Integer roleId) {
		UserRole ur = new UserRole();
		ur.setUser(new User(userId));
		ur.setRole(new Role(roleId));
		return ur;
	}

}
