package com.org.system.model.manager;

import java.util.HashSet;
import java.util.Set;

public class Role {

	private Integer id;
	private String name;
	private String roleCode;
	private String description;
	private Short sort;
	private String delFlag;
	private Set<UserRole> userRoles = new HashSet<UserRole>(0);
	private Set<RolePermission> rolePermissions = new HashSet<RolePermission>(0);

	/** default constructor */
	public Role() {
	}

	public Role(Integer id) {
		this.id = id;
	}

	/** minimal constructor */
	public Role(String name, String roleCode) {
		this.name = name;
		this.roleCode = roleCode;
	}

	/** full constructor */
	public Role(String name, String roleCode, String description, Short sort, String delFlag, Set<UserRole> userRoles,
			Set<RolePermission> rolePermissions) {
		this.name = name;
		this.roleCode = roleCode;
		this.description = description;
		this.sort = sort;
		this.delFlag = delFlag;
		this.userRoles = userRoles;
		this.rolePermissions = rolePermissions;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRoleCode() {
		return roleCode;
	}

	public void setRoleCode(String roleCode) {
		this.roleCode = roleCode;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Short getSort() {
		return sort;
	}

	public void setSort(Short sort) {
		this.sort = sort;
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

	public Set<RolePermission> getRolePermissions() {
		return rolePermissions;
	}

	public void setRolePermissions(Set<RolePermission> rolePermissions) {
		this.rolePermissions = rolePermissions;
	}
	
	

}
