package com.org.szty.mybatis.plugin;

import java.io.IOException;
import java.sql.SQLException;

/**
 * 生成mybatis xml 配置文件
 *
 * @author mao.ru
 * @version
 * @since JDK 1.7
 */
public class CreateStart {

	/**
	 ********************************** 数据类型设置 *******************
	 **/
	// 数据库连接url
	public static final String url = "jdbc:mysql://localhost:3306/ahnew?characterEncoding=utf8";
	// 数据库连接driver
	public static final String driverName = "com.mysql.jdbc.Driver";
	// 数据库连接user
	public static final String user = "root";
	// 数据库连接password
	public static final String password = "root";
	// 指定表生成
	public static final Boolean CREATESINGLE = Boolean.FALSE;
	public static final String[] TABLENAME = { "users", "" };
	//表字段是 false=原生， true=要驼峰
	public static final Boolean ISFILEDM = Boolean.TRUE;
	/*********************** 文件夹生成目录设置 **************************************/

	// 文件生成路径 -- 可以直接配置到项目对应目录下面
	public static final String PATH = "D:/entity_bean/";
	// 基础包名，如 com.szty.wxyd.data.model
	public static final String PACKAGE = "com.org.system.model.manager";// Java 实体类

	/**
	 ********************************** 数据类型设置 *******************
	 **/

	public static final String type_char = "char";
	public static final String type_date = "date";
	public static final String type_timestamp = "timestamp";
	public static final String type_int = "int";
	public static final String type_bigint = "bigint";
	public static final String type_text = "text";
	public static final String type_bit = "bit";
	public static final String type_decimal = "decimal";
	public static final String type_blob = "blob";
	/* 依据主见查询与此有关 */
	public static final String primary_key = "id";// 主键列名

	/**
	***********************************************************
	*/

	public static void main(String[] args) {
		try {
			Generate.generate();
			// 自动打开生成文件的目录
			Runtime.getRuntime().exec("cmd /c start explorer D:\\");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
