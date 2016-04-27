package com.org.system.model.manager;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class User {

	private Integer id;
	private String loginName;
	private String name;
	private String password;
	private String plainPassword;
	private String salt;
	private Date birthday;
	private Short gender;
	private String email;
	private String phone;
	private String icon;
	private Date createDate;
	private String state;
	private String description;
	private Integer loginCount;
	private Date previousVisit;
	private Date lastVisit;
	private String delFlag;
	private Set<UserRole> userRoles = new HashSet<UserRole>(0);
	
	
	
	/** default constructor */
	public User() {
	}
	
	public User(Integer id) {
		this.id=id;
	}

	/** minimal constructor */
	public User(String loginName, String name, String password) {
		this.loginName = loginName;
		this.name = name;
		this.password = password;
	}

	/** full constructor */
	public User(String loginName, String name, String password, String salt,
			Date birthday, Short gender, String email, String phone,
			String icon, Date createDate, String state,String description,
			Integer loginCount, Date previousVisit, Date lastVisit,
			String delFlag, Set<UserRole> userRoles) {
		this.loginName = loginName;
		this.name = name;
		this.password = password;
		this.salt = salt;
		this.birthday = birthday;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
		this.icon = icon;
		this.createDate = createDate;
		this.state = state;
		this.description=description;
		this.loginCount = loginCount;
		this.previousVisit = previousVisit;
		this.lastVisit = lastVisit;
		this.delFlag = delFlag;
		this.userRoles = userRoles;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPlainPassword() {
		return plainPassword;
	}
	public void setPlainPassword(String plainPassword) {
		this.plainPassword = plainPassword;
	}
	public String getSalt() {
		return salt;
	}
	public void setSalt(String salt) {
		this.salt = salt;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public Short getGender() {
		return gender;
	}
	public void setGender(Short gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Integer getLoginCount() {
		return loginCount;
	}
	public void setLoginCount(Integer loginCount) {
		this.loginCount = loginCount;
	}
	public Date getPreviousVisit() {
		return previousVisit;
	}
	public void setPreviousVisit(Date previousVisit) {
		this.previousVisit = previousVisit;
	}
	public Date getLastVisit() {
		return lastVisit;
	}
	public void setLastVisit(Date lastVisit) {
		this.lastVisit = lastVisit;
	}
	public String getDelFlag() {
		return delFlag;
	}
	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}
	public Set<UserRole> getUserRoles() {
		return userRoles;
	}
	public void setUserRoles(Set<UserRole> userRoles) {
		this.userRoles = userRoles;
	}
	
	
}
