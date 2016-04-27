package com.org.system.service.manager;

import java.util.List;

import com.org.system.model.manager.Page;
import com.org.system.model.manager.Role;

public interface UserRoleService {
	
	public List<Integer> getRoleIdList(Integer id);
	
	public void updateUserRole(Integer id,List<Integer> roleIdsOld,List<Integer> roleIdsNew);

	public Role get( Integer id) ;

	public void save( Role entity);
	
	public void update( Role entity);
	
	public void delete( Role entity);
	
	public void delete( Integer id);
	
	public List<Role> getAll();
	
	public List<Role> search( Role entity);
	
	public Page<Role> search( Page<Role> page,  Role entity) ;
}
