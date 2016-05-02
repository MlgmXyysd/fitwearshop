package com.org.system.model.manager;


/**
 * 角色权限entity
 */
public class RolePermission implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3422501640899923418L;
	private Integer id;
	private Permission permission;
	private Role role;
	private Integer roleId;
	private Integer permissionId;
	
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	public Integer getPermissionId() {
		return permissionId;
	}
	public void setPermissionId(Integer permissionId) {
		this.permissionId = permissionId;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Permission getPermission() {
		return permission;
	}
	public void setPermission(Permission permission) {
		this.permission = permission;
	}
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}

}