package com.org.system.service.manager;

import java.util.List;

import com.org.system.model.manager.Page;
import com.org.system.model.manager.UserRole;

public interface UserRoleService {
	
	public List<Integer> getRoleIdList(Integer id);
	
	public void updateUserRole(Integer id,List<Integer> roleIdsOld,List<Integer> roleIdsNew);

	public UserRole get( Integer id) ;

	public void save( UserRole entity);
	
	public void update( UserRole entity);
	
	public void delete( UserRole entity);
	
	public void delete( Integer id);
	
	public List<UserRole> getAll();
	
	public List<UserRole> search( UserRole entity);
	
	public Page<UserRole> search( Page<UserRole> page,  UserRole entity) ;
}
