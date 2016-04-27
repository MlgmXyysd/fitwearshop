package com.org.system.service.manager;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.org.system.dao.manager.PermissionMapper;
import com.org.system.model.manager.Page;
import com.org.system.model.manager.Permission;

@Service
public class PermissionServiceImpl implements PermissionService {

	@Autowired
	private PermissionMapper permissionMapper;
	
	public void addBaseOpe(Integer pid, String pClassName) {
		List<Permission> pList=new ArrayList<Permission>();
		pList.add(new Permission(pid, "添加", "O", "", "sys:"+pClassName+":add"));
		pList.add(new Permission(pid, "删除", "O", "", "sys:"+pClassName+":delete"));
		pList.add(new Permission(pid, "修改", "O", "", "sys:"+pClassName+":update"));
		pList.add(new Permission(pid, "查看", "O", "", "sys:"+pClassName+":view"));
		
		//添加没有的基本操作
		List<Permission> existPList=getMenuOperation(pid);
		for(Permission permission:pList){
			boolean exist=false;
			for(Permission existPermission:existPList){
				if(permission.getPermCode().equals(existPermission.getPermCode())){
					exist=true;
					break;
				}else{
					exist=false;
				}
			}
			if(!exist)
				permissionMapper.save(permission);
		}
	}

	/**
	 * 获取角色拥有的权限集合
	 * @param userId
	 * @return 结果集合
	 */
	public List<Permission> getPermissions(Integer userId) {
		return permissionMapper.getPermissions(userId);
	}

	
	public List<Permission> getMenus(Integer userId) {
		
		return permissionMapper.getMenus(userId);
	}

	public List<Permission> getMenus() {
		
		return permissionMapper.getMenus(null);
	}

	public List<Permission> getMenuOperation(Integer pid) {
		return permissionMapper.getMenuOperation(pid);
	}

	public Permission get(Integer id) {
		return permissionMapper.selectByPrimaryKey(id);
	}

	public void save(Permission entity) {

		permissionMapper.save(entity);
	}

	public void update(Permission entity) {

		permissionMapper.updateByPrimaryKey(entity);
	}

	public void delete(Permission entity) {

//		permissionMapper.
	}

	public void delete(Integer id) {

	}

	public List<Permission> getAll() {
		return permissionMapper.queryList(null);
	}

	public List<Permission> search(Permission entity) {
		return permissionMapper.queryList(entity);
	}

	public Page<Permission> search(Page<Permission> page, Permission entity) {
		Page<Permission> p = new Page<Permission>();
		Integer count = permissionMapper.queryPageCount(entity);
		List<Permission> list = permissionMapper.queryPageList(entity);
		p.setTotalCount(Long.valueOf(count));
		p.setResult(list);
		return p;
	}

}
