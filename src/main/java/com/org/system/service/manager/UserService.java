package com.org.system.service.manager;

import java.util.List;

import com.org.system.model.manager.Page;
import com.org.system.model.manager.User;

public interface UserService {

	/** 加密方法 */
	public static final String HASH_ALGORITHM = "SHA-1";
	public static final int HASH_INTERATIONS = 1024;
	public static final int SALT_SIZE = 8; // 盐长度

	public User getUser(String name);
	
	public void updateUserLogin(User user);
	
	public User get( Integer id) ;

	public void save( User entity);
	
	public void update( User entity);
	
	public void delete( User entity);
	
	public void delete( Integer id);
	
	public List<User> getAll();
	
	public List<User> search( User entity);
	
	public Page<User> search( Page<User> page, User entity) ;
	
	public Boolean checkPassword(User user,String password);
	
	public void updatePwd(User user);

}
