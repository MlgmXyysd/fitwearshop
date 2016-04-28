package com.org.system.service.manager;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.org.system.dao.manager.UserMapper;
import com.org.system.model.manager.Page;
import com.org.system.model.manager.User;
import com.org.utils.Digests;
import com.org.utils.Encodes;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;

	public User getUser(String name) {
		User user = userMapper.selectByUserName(name);
		return user;
	}

	public void updatePwd(User user) {

		entryptPassword(user);
		userMapper.insert(user);
	}

	/**
	 * 验证原密码是否正确
	 * 
	 * @param user
	 * @param oldPwd
	 * @return
	 */
	public Boolean checkPassword(User user, String oldPassword) {
		byte[] salt = Encodes.decodeHex(user.getSalt());
		byte[] hashPassword = Digests.sha1(oldPassword.getBytes(), salt, HASH_INTERATIONS);
		if (user.getPassword().equals(Encodes.encodeHex(hashPassword))) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 修改用户登录
	 * 
	 * @param user
	 */
	public void updateUserLogin(User user) {
		user.setLoginCount((user.getLoginCount() == null ? 0 : user.getLoginCount()) + 1);
		user.setPreviousVisit(user.getLastVisit());
		user.setLastVisit(new Date());
		update(user);
	}

	/**
	 * 判断是否超级管理员
	 * 
	 * @param id
	 * @return boolean
	 */
	private boolean isSupervisor(Integer id) {
		return id == 1;
	}

	/**
	 * 设定安全的密码，生成随机的salt并经过1024次 sha-1 hash
	 */
	private void entryptPassword(User user) {
		byte[] salt = Digests.generateSalt(SALT_SIZE);
		user.setSalt(Encodes.encodeHex(salt));

		byte[] hashPassword = Digests.sha1(user.getPlainPassword().getBytes(), salt, HASH_INTERATIONS);
		user.setPassword(Encodes.encodeHex(hashPassword));
	}

	public User get(Integer id) {
		return userMapper.selectByPrimaryKey(id);
	}

	public void save(User entity) {
		entryptPassword(entity);
		entity.setCreateDate(new Date());
		userMapper.insert(entity);
	}

	public void update(User entity) {
		userMapper.updateByPrimaryKey(entity);
	}

	public void delete(User entity) {

	}

	public void delete(Integer id) {
		if (!isSupervisor(id)) {
			userMapper.deleteByPrimaryKey(id);
		}
	}

	public List<User> getAll() {
		return null;
	}

	public List<User> search(User entity) {
		return null;
	}

	public Page<User> search(Page<User> page, User entity) {
		Integer count = null;
		List<User> list = null;

		return null;
	}

}
