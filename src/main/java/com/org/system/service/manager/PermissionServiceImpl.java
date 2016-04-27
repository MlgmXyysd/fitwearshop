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
		Permission permission = new Permission();
		permission.setPid(userId);
		return permissionMapper.queryList(permission);
	}

	
	public List<Permission> getMenus(Integer userId) {
		
		return null;
	}

	public List<Permission> getMenus() {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Permission> getMenuOperation(Integer pid) {
		// TODO Auto-generated method stub
		return null;
	}

	public Permission get(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	public void save(Permission entity) {
		// TODO Auto-generated method stub

	}

	public void update(Permission entity) {
		// TODO Auto-generated method stub

	}

	public void delete(Permission entity) {
		// TODO Auto-generated method stub

	}

	public void delete(Integer id) {
		// TODO Auto-generated method stub

	}

	public List<Permission> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Permission> search(Permission entity) {
		// TODO Auto-generated method stub
		return null;
	}

	public Page<Permission> search(Page<Permission> page, Permission entity) {
		// TODO Auto-generated method stub
		return null;
	}

}
