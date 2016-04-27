package com.org.system.service.manager;

import java.util.List;

import com.org.system.model.manager.Page;
import com.org.system.model.manager.Role;

/**
 * 角色service
 */

public interface RoleService {

	public Role get( Integer id) ;

	public void save( Role entity);
	
	public void update( Role entity);
	
	public void delete( Role entity);
	
	public void delete( Integer id);
	
	public List<Role> getAll();
	
	public List<Role> search( Role entity);
	
	public Page<Role> search( Page<Role> page, Role entity) ;
}
