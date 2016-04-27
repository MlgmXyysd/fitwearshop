package com.org.system.model.manager;

import java.util.HashSet;
import java.util.Set;

public class Permission {

	private Integer id;
	private Integer pid;
	private String name;
	private String type;
	private Integer sort;
	private String url;
	private String icon;
	private String permCode;
	private String description;
	private String state;
	
	private Set<RolePermission> rolePermissions = new HashSet<RolePermission>(0);
	
	public Set<RolePermission> getRolePermissions() {
		return rolePermissions;
	}
	public void setRolePermissions(Set<RolePermission> rolePermissions) {
		this.rolePermissions = rolePermissions;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Integer getSort() {
		return sort;
	}
	public void setSort(Integer sort) {
		this.sort = sort;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public String getPermCode() {
		return permCode;
	}
	public void setPermCode(String permCode) {
		this.permCode = permCode;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	/** default constructor */
	public Permission() {
	}

	/** minimal constructor */
	public Permission(String name) {
		this.name = name;
	}
	
	public Permission(Integer id) {
		this.id=id;
	}
	
	public Permission (Integer id,Integer pid,String name){
		this.id=id;
		this.pid=pid;
		this.name=name;
	}
	
	public Permission (Integer pid,String name, String type,String url,String permCode){
		this.pid=pid;
		this.name=name;
		this.type=type;
		this.url=url;
		this.permCode=permCode;
	}

	/** full constructor */
	public Permission(Integer pid, String name, String type, Integer sort,
			String url, String icon, String permCode, String description,
			String state, Set<RolePermission> rolePermissions) {
		this.pid = pid;
		this.name = name;
		this.type = type;
		this.sort = sort;
		this.url = url;
		this.icon = icon;
		this.permCode = permCode;
		this.description = description;
		this.state=state;
		this.rolePermissions = rolePermissions;
	}
	
	
}
