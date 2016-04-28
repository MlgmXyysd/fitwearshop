package com.org.szty.mybatis.plugin;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 自动生成MyBatis的实体类、实体映射XML文件、Mapper
 *
 */
public class EntityUtil {

	/**
	 ********************************** 使用前必读*******************
	 **
	 ** 使用前请将moduleName更改为自己模块的名称即可（一般情况下与数据库名一致），其他无须改动。
	 **
	 ***********************************************************
	 */

	private final String type_char = "char";

	private final String type_date = "date";

	private final String type_timestamp = "timestamp";

	private final String type_int = "int";

	private final String type_bigint = "bigint";

	private final String type_text = "text";

	private final String type_bit = "bit";

	private final String type_decimal = "decimal";

	private final String type_blob = "blob";

	// 主键列名
	private final String primary_key = "id";

	private final String moduleName = "wxyd";
	private final String bean_path = "D:/entity_bean/bean";
	private final String model_path = "D:/entity_bean/model";
	private final String mapper_path = "D:/entity_bean/mapper";
	private final String xml_path = "d:/entity_bean/xml";
	private final String service_path = "d:/entity_bean/service";
	private final String serviceimp_path = "d:/entity_bean/serviceimp";
	private final String testcase_path = "d:/entity_bean/testcase";
	private final String jsp_path = "d:/entity_bean/jsp";
	private final String js_path = "d:/entity_bean/js";
	private final String action_path = "d:/entity_bean/action";
	private final String bean_package = "com.szty.wxyd.data.model";// Java 实体类
																	// 包名
	private final String model_package = "com.szty.wxyd.data.model";// Java
																	// 实体扩展类 包名
	private final String mapper_package = "com.szty.wxyd.dao";// Javamapper 包名
	private final String service_package = "com.szty.wxyd.service";// Javamapper
																	// 包名
	private final String serviceimp_package = "com.szty.wxyd.service.impl";// Javamapper
																			// 包名
	private final String testcase_package = "com.szty.wxyd.test";// Javamapper
																	// 包名

	private final String js_package = "/js/memberRank/";// js路径
	private final String action_package = "com.szty.wxyd.controller";// action
																		// 包名

	private final String driverName = "com.mysql.jdbc.Driver";
	private final String dataName = "ahnew"; // 数据库名称
	private final String user = "root";
	private final String password = "root";
	private final String url = "jdbc:mysql://localhost:3306/" + dataName + "?characterEncoding=utf8";
	private String tableName = null;
	private String beanName = null;
	private String modelName = null;
	private List<String> modelNames = new ArrayList<String>();
	private String mapperName = null;
	private Connection conn = null;

	/**
	 * 数据库连接
	 * 
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	private void init() throws ClassNotFoundException, SQLException {
		Class.forName(driverName);
		conn = DriverManager.getConnection(url, user, password);
	}

	/**
	 * 获取所有的表
	 *
	 * @return
	 * @throws SQLException
	 */
	private List<String> getTables() throws SQLException {
		List<String> tables = new ArrayList<String>();
		PreparedStatement pstate = conn.prepareStatement("show tables");
		ResultSet results = pstate.executeQuery();
		while (results.next()) {
			String tableName = results.getString(1);
			// if ( tableName.toLowerCase().startsWith("yy_") ) {
			tables.add(tableName);
			// }
		}
		return tables;
	}

	/**
	 * 数据库列定义类型为a_b_.. 模式 依据table那么 生成 TableName_Mapper
	 * 
	 * @param table
	 */
	private void processTable(String table) {
		StringBuffer sb = new StringBuffer(table.length());
		String tableNew = table.toLowerCase();
		String[] tables = tableNew.split("_");
		String temp = null;
		for (int i = 0; i < tables.length; i++) {
			temp = tables[i].trim();
			sb.append(temp.substring(0, 1).toUpperCase()).append(
					temp.substring(1));
		}
		beanName = sb.toString();// 增加
		modelName = beanName;
		mapperName = beanName + "Mapper";
	}

	/**
	 * 依据数据库字段类型生成Javabeam 数据类型
	 * 
	 * @param type
	 * @return
	 */
	private String processType(String type) {
		if (type.indexOf(type_char) > -1) {
			return "String";
		} else if (type.indexOf(type_bigint) > -1) {
			return "Long";
		} else if (type.indexOf(type_int) > -1) {
			return "Long";
		} else if (type.indexOf(type_date) > -1) {
			return "String";
		} else if (type.indexOf(type_text) > -1) {
			return "String";
		} else if (type.indexOf(type_timestamp) > -1) {
			return "Date";
		} else if (type.indexOf(type_bit) > -1) {
			return "Boolean";
		} else if (type.indexOf(type_decimal) > -1) {// 计算类型
			return "BigDecimal";
		} else if (type.indexOf(type_blob) > -1) {
			return "byte[]";
		}
		return null;
	}

	/**
	 * 数据库列定义类型为a_b_.. 模式 依据字段类型生成Javabeam 成员变量
	 * 
	 * @param field
	 * @return
	 */
	private String processField(String field) {
		StringBuffer sb = new StringBuffer(field.length());
		String[] fields = field.split("_");
		String temp = null;
		sb.append(fields[0]);
		for (int i = 1; i < fields.length; i++) {
			temp = fields[i].trim();
			sb.append(temp.substring(0, 1).toUpperCase()).append(
					temp.substring(1));
		}
		return sb.toString();
	}

	/**
	 * 将实体类名首字母改为小写
	 *
	 * @param beanName
	 * @return
	 */
	private String processResultMapId(String beanName) {
		return beanName.substring(0, 1).toLowerCase() + beanName.substring(1);
	}

	/**
	 * 构建类上面的注释
	 *
	 * @param bw
	 * @param text
	 * @return
	 * @throws IOException
	 */
	private BufferedWriter buildClassComment(BufferedWriter bw, String text)
			throws IOException {
		bw.newLine();
		bw.newLine();
		bw.write("/**");
		bw.newLine();
		bw.write(" * ");
		bw.newLine();
		bw.write(" * " + text);
		bw.newLine();
		bw.write(" * ");
		bw.newLine();
		bw.write(" */");
		return bw;
	}

	/**
	 * 构建方法上面的注释
	 *
	 * @param bw
	 * @param text
	 * @return
	 * @throws IOException
	 */
	private BufferedWriter buildMethodComment(BufferedWriter bw, String text)
			throws IOException {
		bw.newLine();
		bw.write("\t/**");
		bw.newLine();
		bw.write("\t * ");
		bw.newLine();
		bw.write("\t * " + text);
		bw.newLine();
		bw.write("\t * ");
		bw.newLine();
		bw.write("\t **/");
		return bw;
	}

	/**
	 * 生成实体类
	 *
	 * @param columns
	 *            数据列名
	 * @param types
	 *            对应列类型
	 * @param comments
	 * @throws IOException
	 */
	private void buildEntityBean( List<String> columns, List<String> types, List<String> comments, String tableComment )
        throws IOException {
        File folder = new File(bean_path);
        if ( !folder.exists() ) {
            folder.mkdir();
        }
        // 生成Javabean
        File beanFile = new File(bean_path, beanName + ".java");
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(beanFile)));
        bw.write("package " + bean_package + ";");
        bw.newLine();
        bw.write("import com.szty.wxyd.data.model.BaseModel;");
        bw.newLine();
        bw.newLine();
        bw = buildClassComment(bw, tableComment);
        bw.newLine();
        bw.write("public class " + beanName + " extends BaseModel {");
        bw.newLine();
        bw.newLine();
        int size = columns.size();
        for ( int i = 0 ; i < size ; i++ ) {
        		bw.write("\t/**" + comments.get(i) + "**/");
                bw.newLine();
                bw.write("\t private " + processType(types.get(i)) + " " + processField(columns.get(i)) + ";");
                bw.newLine();
                if(columns.get(i).endsWith("time")){
                	 bw.write("\t private " + processType(types.get(i)) + " " + processField(columns.get(i)) + "Begin;");
                     bw.newLine();
                     bw.write("\t private " + processType(types.get(i)) + " " + processField(columns.get(i)) + "End;");
                     bw.newLine();
                     bw.newLine();
                }
               
        }
        bw.newLine();
        // 生成get 和 set方法
        String tempField = null;
        String _tempField = null;
        String tempType = null;
        for ( int i = 0 ; i < size ; i++ ) {
	            tempType = processType(types.get(i));
	            _tempField = processField(columns.get(i));
	            tempField = _tempField.substring(0, 1).toUpperCase() + _tempField.substring(1);
	            bw.newLine();
	            bw.write("\t public void set" + tempField + "(" + tempType + " " + _tempField + "){");
	            bw.newLine();
	            bw.write("\t\t this." + _tempField + " = " + _tempField + ";");
	            bw.newLine();
	            bw.write("\t}");
	            bw.newLine();
	            bw.newLine();
	            bw.write("\t public " + tempType + " get" + tempField + "(){");
	            bw.newLine();
	            bw.write("\t\treturn this." + _tempField + ";");
	            bw.newLine();
	            bw.write("\t}");
	            bw.newLine();
	            bw.newLine();
	            if(columns.get(i).endsWith("time")){
	            	bw.write("\t public void set" + tempField + "Begin (" + tempType + " " + _tempField + "Begin){");
	 	            bw.newLine();
	 	            bw.write("\t\t this." + _tempField + "Begin = " + _tempField + "Begin ;");
	 	            bw.newLine();
	 	            bw.write("\t}");
	 	            bw.newLine();
	 	            bw.newLine();
	 	            bw.write("\t public " + tempType + " get" + tempField + "Begin (){");
	 	            bw.newLine();
	 	            bw.write("\t\treturn this." + _tempField + "Begin;");
	 	            bw.newLine();
	 	            bw.write("\t}");
	 	            bw.newLine();
	 	            bw.newLine();
	 	            bw.write("\t public void set" + tempField + "End (" + tempType + " " + _tempField + "End){");
	 	            bw.newLine();
	 	            bw.write("\t\t this." + _tempField + "End = " + _tempField + "End ;");
	 	            bw.newLine();
	 	            bw.write("\t}");
	 	            bw.newLine();
	 	            bw.newLine();
	 	            bw.write("\t public " + tempType + " get" + tempField + "End (){");
	 	            bw.newLine();
	 	            bw.write("\t\treturn this." + _tempField + "End;");
	 	            bw.newLine();
	 	            bw.write("\t}");
	 	            bw.newLine();
	            }
	           
        }
        bw.newLine();
        bw.write("}");
        bw.newLine();
        bw.flush();
        bw.close();
        
    }

	/**
	 * 构建Mapper文件
	 *
	 * @throws IOException
	 */
	private void buildMapperNew() throws IOException {
		File folder = new File(mapper_path);
		if (!folder.exists()) {
			folder.mkdirs();
		}
		String record = processResultMapId(beanName);
		File mapperFile = new File(mapper_path, mapperName + ".java");
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(
				new FileOutputStream(mapperFile), "utf-8"));
		bw.write("package " + mapper_package + ";");
		bw.newLine();
		bw.newLine();
		bw.write("import " + model_package + "." + modelName + ";");
		bw.newLine();
		bw.write("import java.util.List;");
		bw.newLine();
		bw = buildClassComment(bw, mapperName + "数据库操作接口类");
		bw.newLine();
		bw.newLine();
		bw.write("public interface " + mapperName + "{");
		bw.newLine();
		bw.newLine();
		// ----------定义Mapper中的方法Begin----------

		bw = buildMethodComment(bw, "添加");
		bw.newLine();
		bw.write("\t public " + "void save( " + modelName + " " + record + ");");
		bw.newLine();
		bw = buildMethodComment(bw, "添加 （匹配有值的字段）");
		bw.newLine();
		bw.write("\t public " + "void saveBySelective( " + modelName + " "
				+ record + ");");
		bw.newLine();
		bw = buildMethodComment(bw, "批量新增");
		bw.newLine();
		bw.write("\t public " + "void saveBatch" + modelName + "(List<"
				+ modelName + "> list);");
		bw.newLine();
		bw = buildMethodComment(bw, "修改 （匹配有值的字段）");
		bw.newLine();
		bw.write("\t public " + "int updateBySelective( " + modelName + " "
				+ record + ");");
		bw.newLine();
		bw = buildMethodComment(bw, "主键ID修改 ");
		bw.newLine();
		bw.write("\t public " + "int updateByPrimaryKey( " + modelName + " "
				+ record + ");");
		bw.newLine();
		bw.newLine();
		bw = buildMethodComment(bw, "查询（根据主键ID查询）");
		bw.newLine();
		bw.write("\t public " + modelName + "  selectByPrimaryKey (Long id );");
		bw.newLine();
		bw = buildMethodComment(bw, "多条数据");
		bw.newLine();
		bw.write("\t public " + "List<" + modelName + ">  queryList ("
				+ modelName + " " + record + ");");
		bw.newLine();
		bw = buildMethodComment(bw, "分页查询");
		bw.newLine();
		bw.write("\t public " + "List<" + modelName + ">  queryPageList("
				+ modelName + " " + record + ");");
		bw.newLine();
		bw = buildMethodComment(bw, "分页查询");
		bw.newLine();
		bw.write("\t public " + "Integer  queryPageCount (" + modelName + " "
				+ record + ");");
		bw.newLine();
		// ----------定义Mapper中的方法End----------
		bw.newLine();
		bw.write("}");
		bw.flush();
		bw.close();
	}

	/**
	 * 构建实体类映射XML文件
	 *
	 * @param columns
	 * @param types
	 * @param comments
	 * @throws IOException
	 */
	private void buildMapperXml(List<String> columns, List<String> types,
			List<String> comments) throws IOException {

		int wheresize = columns.size();
		File folder = new File(xml_path);
		if (!folder.exists()) {
			folder.mkdirs();
		}
		String mapname = this.processResultMapId(modelName) + "ResultMap";
		File mapperXmlFile = new File(xml_path, mapperName + ".xml");
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(
				new FileOutputStream(mapperXmlFile)));
		bw.write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		bw.newLine();
		bw.write("<!DOCTYPE mapper PUBLIC \"-//mybatis.org//DTD Mapper 3.0//EN\" ");
		bw.newLine();
		bw.write("    \"http://mybatis.org/dtd/mybatis-3-mapper.dtd\">");
		bw.newLine();
		bw.write("<mapper namespace=\"" + mapper_package + "." + mapperName
				+ "\">");
		bw.newLine();
		bw.newLine();
		// 实体map映射
		bw.write("\t<!--实体映射-->");
		bw.newLine();
		bw.write("\t<resultMap id=\"" + mapname + "\" type=\"" + modelName
				+ "\">");
		bw.newLine();
		int size = columns.size();
		for (int i = 0; i < size; i++) {
			bw.write("\t\t<!--" + comments.get(i) + "-->");
			bw.newLine();
			bw.write("\t\t<result column=\"" + columns.get(i)
					+ "\"  property=\"" + columns.get(i) //this.processField(columns.get(i))
					+ "\" />");
			bw.newLine();
		}
		bw.write("\t</resultMap>");
		bw.newLine();
		bw.newLine();
		bw.newLine();

		// 通用结果列
		bw.write("\t<!-- 通用查询结果列-->");
		bw.newLine();
		bw.write("\t<sql id=\"Base_Column_List\">");
		bw.newLine();
		for (int i = 0; i < size; i++) {
			bw.write("\t" + columns.get(i));
			if (i != size - 1) {
				bw.write(",");
			}
		}
		bw.newLine();
		bw.write("\t</sql>");
		bw.newLine();
		bw.newLine();
		bw.newLine();

		// where 条件生成
		bw.write("\t<!-- 查询条件-->");
		bw.newLine();
		bw.write("\t<sql id=\"modelwheresql\">");
		bw.newLine();
		bw.write("\t<where>");
		bw.newLine();
		// bw.write("\t 1=1");
		bw.newLine();
		String tepfile = null;
		for (int i = 0; i < wheresize; i++) {
			//tepfile = processField(columns.get(i));
			tepfile = columns.get(i);
			bw.write("\t\t\t<if test=\"" + tepfile + " != null and " + tepfile
					+ " != '' \">");
			bw.newLine();
			bw.write("\t\t\t\t and " + columns.get(i) + " = #{" + tepfile + "}");
			bw.newLine();
			bw.write("\t\t\t</if>");
			bw.newLine();
		}
		bw.newLine();
		bw.write("\t</where>");
		bw.newLine();
		bw.write("\t</sql>");
		bw.newLine();
		bw.newLine();
		bw.newLine();

		// where 分页条件生成
		bw.write("\t<sql id=\"limitsql\">");
		bw.newLine();
		bw.write("\t\t\t<if test=\"limitStart != null and pageSize != null\"" + ">");	
		bw.newLine();
		bw.write("\t\t\t\t <![CDATA[  ");
		bw.newLine();
		bw.write("\t\t\t\t order by id desc limit #{limitStart} , #{pageSize} " );
		bw.newLine();
		bw.write("\t\t\t\t ]]>  ");
		bw.newLine();
		bw.write("\t\t\t</if>");
		bw.newLine();
		bw.write("\t</sql>");
		// 下面开始写SqlMapper中的方法
		buildSQLNew(bw, columns, types);
		bw.write("</mapper>");
		bw.flush();
		bw.close();
	}

	private void buildSQLNew(BufferedWriter bw, List<String> columns,
			List<String> types) throws IOException {
		int size = columns.size();

		String mapname = this.processResultMapId(modelName) + "ResultMap";
		// 添加insert方法
		bw.write("\t<!-- 添加 -->");
		bw.newLine();
		bw.write("\t<insert id=\"save\" parameterType=\"" + modelName + "\">");
		bw.newLine();
		bw.write("\t\t <selectKey resultType=\"long\" keyProperty=\"id\">");
		bw.newLine();
		bw.write("\t\t SELECT LAST_INSERT_ID()");
		bw.newLine();
		bw.write("\t\t </selectKey>");
		bw.newLine();
		bw.write("\t\t INSERT INTO " + tableName);
		bw.newLine();
		bw.write(" \t\t(");
		for (int i = 0; i < size; i++) {
			if (!columns.get(i).equalsIgnoreCase(primary_key)) {
				bw.write(columns.get(i));
				if (i != size - 1) {
					bw.write(",");
				}
			}
		}
		bw.write(") ");
		bw.newLine();
		bw.write("\t\t VALUES ");
		bw.newLine();
		bw.write(" \t\t(");
		for (int i = 0; i < size; i++) {
			
			String tepfile = columns.get(i);//processField(columns.get(i));
			if (!columns.get(i).equalsIgnoreCase(primary_key)) {
				bw.write("#{" + tepfile + "}");
				if (i != size - 1) {
					bw.write(",");
				}
			}
		}
		bw.write(") ");
		bw.newLine();
		bw.write("\t</insert>");
		bw.newLine();
		bw.newLine();
		// 添加insert完
		bw.write("\t<!-- 添加 （匹配有值的字段）-->");
		bw.newLine();
		bw.write("\t<insert id=\"insertSelective\" parameterType=\""
				+ processResultMapId(beanName) + "\">");
		bw.newLine();
		bw.write("\t\t INSERT INTO " + tableName);
		bw.newLine();
		bw.write("\t\t <trim prefix=\"(\" suffix=\")\" suffixOverrides=\",\" >");
		bw.newLine();

		String tempField = null;
		for (int i = 0; i < size; i++) {
			tempField =columns.get(i) ;// processField(columns.get(i));
			bw.write("\t\t\t<if test=\"" + tempField + " != null\">");
			bw.newLine();
			bw.write("\t\t\t\t " + columns.get(i) + ",");
			bw.newLine();
			bw.write("\t\t\t</if>");
			bw.newLine();
		}

		bw.newLine();
		bw.write("\t\t </trim>");
		bw.newLine();

		bw.write("\t\t <trim prefix=\"values (\" suffix=\")\" suffixOverrides=\",\" >");
		bw.newLine();

		tempField = null;
		for (int i = 0; i < size; i++) {
			tempField = columns.get(i); //processField(columns.get(i));
			bw.write("\t\t\t<if test=\"" + tempField + "!=null and "
					+ tempField + "!='' \">");
			bw.newLine();
			bw.write("\t\t\t\t #{" + tempField + "},");
			bw.newLine();
			bw.write("\t\t\t</if>");
			bw.newLine();
		}

		bw.write("\t\t </trim>");
		bw.newLine();
		bw.write("\t</insert>");
		bw.newLine();
		bw.newLine();
		
		// --------------- saveBatch方法（匹配有值的字段）
		// 添加insert方法
		bw.write("\t<!-- 添加 -->");
		bw.newLine();
		bw.write("\t<insert id=\"saveBatch" + modelName
				+ "\" parameterType=\"java.util.List\">");
		bw.newLine();
		bw.write("\t\t INSERT INTO " + tableName);
		bw.newLine();
		bw.write(" \t\t(");
		for (int i = 0; i < size; i++) {
			if (!columns.get(i).equalsIgnoreCase(primary_key)) {
				bw.write(columns.get(i));
				if (i != size - 1) {
					bw.write(",");
				}
			}
		}
		bw.write(") ");
		bw.newLine();
		bw.write("\t\t VALUES ");
		bw.newLine();
		bw.write(" \t\t <foreach collection=\"list\" item=\"item\" index=\"index\" separator=\",\" >  ");
		bw.newLine();
		bw.write(" \t\t(");
		for (int i = 0; i < size; i++) {
			if (!columns.get(i).equalsIgnoreCase(primary_key)) {
				bw.write("#{item." + processField(columns.get(i)) + "}");
				if (i != size - 1) {
					bw.write(",");
				}
			}
		}
		bw.write(") ");
		bw.newLine();
		bw.write(" \t\t </foreach>");
		bw.newLine();
		bw.write("\t</insert>");
		bw.newLine();
		bw.newLine();
		// 添加insert完
		// --------------- 完毕
		// 修改update方法
				bw.write("\t<!-- 修 改-->");
				bw.newLine();
				bw.write("\t<update id=\"updateByPrimaryKeySelective\" parameterType=\""
						+ processResultMapId(modelName) + "\">");
				bw.newLine();
				bw.write("\t\t UPDATE " + tableName);
				bw.newLine();
				bw.write(" \t\t <set> ");
				bw.newLine();

				tempField = null;
				for (int i = 0; i < size; i++) {
					tempField = columns.get(i);//processField(columns.get(i));
					bw.write("\t\t\t<if test=\"" + tempField + "!=null and "
							+ tempField + "!='' \">");
					bw.newLine();
					bw.write("\t\t\t\t #{" + tempField + "},");
					bw.newLine();
					bw.write("\t\t\t</if>");
					bw.newLine();
				}

				bw.newLine();
				bw.write(" \t\t </set>");
				bw.newLine();
				bw.write("\t\t WHERE " + columns.get(0) + " = #{"
						+ columns.get(0) //processField(columns.get(0))
						+ "}");
				bw.newLine();
				bw.write("\t</update>");
				bw.newLine();
				bw.newLine();
				// update方法完毕

				// ----- 修改（匹配有值的字段）
				bw.write("\t<!-- 修 改-->");
				bw.newLine();
				bw.write("\t<update id=\"updateByPrimaryKey\" parameterType=\""
						+ processResultMapId(beanName) + "\">");
				bw.newLine();
				bw.write("\t\t UPDATE " + tableName);
				bw.newLine();
				bw.write("\t\t SET ");

				bw.newLine();
				tempField = null;
				for (int i = 1; i < size; i++) {
					tempField = columns.get(i) ;//processField(columns.get(i));
					bw.write("\t\t\t<if test=\"" + tempField + " != null\">");
					bw.newLine();
					bw.write("\t\t\t\t " + columns.get(i) + " = #{" + tempField + "},");
					bw.newLine();
					bw.write("\t\t\t</if>");
					bw.newLine();
				}

				bw.write("\t\t WHERE " + columns.get(0) + " = #{"
						+ columns.get(0)
						// processField(columns.get(0))
						+ "}");
				bw.newLine();
				bw.write("\t</update>");
				bw.newLine();

		// ----- 修改（匹配有值的字段）

		// 查询（根据主键ID查询）
		bw.write("\t<!-- 查询（根据主键ID查询） -->");
		bw.newLine();
		bw.write("\t<select id=\"selectByPrimaryKey\"  resultMap=\"" + mapname
				+ "\" parameterType=\"java.lang." + processType(types.get(0))
				+ "\">");
		bw.newLine();
		bw.write("\t\t SELECT");
		bw.newLine();
		bw.write("\t\t <include refid=\"Base_Column_List\" />");
		bw.newLine();
		bw.write("\t\t FROM " + tableName);
		bw.newLine();
		bw.write("\t\t WHERE " + columns.get(0) + " = #{"
				+ processField(columns.get(0)) + "}");
		bw.newLine();
		bw.write("\t</select>");
		bw.newLine();
		bw.newLine();

		// 查询list
		bw.write("\t<!-- 查询  List 查询 -->");
		bw.newLine();
		bw.write("\t<select id=\"queryList\" resultMap=\"" + mapname
				+ "\" parameterType=\"" + modelName + "\">");
		bw.newLine();
		bw.write("\t\t SELECT");
		bw.newLine();
		bw.write("\t\t <include refid=\"Base_Column_List\" />");
		bw.newLine();
		bw.write("\t\t FROM " + tableName);
		bw.newLine();
		bw.write("\t\t  ");
		bw.newLine();
		bw.write("\t\t <include refid=\"modelwheresql\" />");
		bw.newLine();
		bw.write("\t</select>");
		bw.newLine();
		bw.newLine();

		// 统计
		 bw.write("\t<!-- 查询 分页总数 -->");
		 bw.newLine();
		 bw.write("\t<select id=\"queryCount\"  resultType=\"java.lang.Integer\"  parameterType=\""
		 + modelName + "\">");
		 bw.newLine();
		 bw.write("\t\t SELECT");
		 bw.newLine();
		 bw.write("\t\t count(1)");
		 bw.newLine();
		 bw.write("\t\t FROM " + tableName);
		 bw.newLine();
		 bw.write("\t\t  ");
		 bw.newLine();
		 bw.write("\t\t <include refid=\"modelwheresql\" />");
		 bw.newLine();
		 bw.write("\t</select>");
		 bw.newLine();

		// 分页查询

		 bw.write("\t<!-- 查询 分页查询 -->");
		 bw.newLine();
		 bw.write("\t<select id=\"queryPageList\" resultMap=\""+ mapname +
		 "\"  parameterType=\""+ modelName + "\">");
		 bw.newLine();
		 bw.write("\t\t SELECT");
		 bw.newLine();
		 bw.write("\t\t <include refid=\"Base_Column_List\" />");
		 bw.newLine();
		 bw.write("\t\t FROM " + tableName);
		 bw.newLine();
		 bw.write("\t\t  ");
		 bw.newLine();
		 bw.write("\t\t <include refid=\"modelwheresql\" />");
		 bw.newLine();
		 bw.write("\t\t <include refid=\"limitsql\" />");
		 bw.newLine();
		 bw.write("\t</select>");
		 bw.newLine();
		 bw.newLine();
	}



	/**
	 * 构建 基础 的service 文件
	 *
	 * @throws IOException
	 */
	private void buildBaseService() throws IOException {
		File folder = new File(service_path);
		if (!folder.exists()) {
			folder.mkdirs();
		}
		String record = processResultMapId(modelName);
		File mapperFile = new File(service_path, beanName + "Service.java");
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(
				new FileOutputStream(mapperFile), "utf-8"));
		bw.write("package " + service_package + ";");
		bw.newLine();
		bw.newLine();
		bw.write("import java.util.List;");
		bw.newLine();
		bw.write("import com.j1.base.dto.ServiceMessage;");
		bw.newLine();
		bw.write("import com.j1.base.page.Page;");
		bw.newLine();
		bw.write("import com.j1.base.page.Pageable;");
		bw.newLine();
		bw.write("import " + model_package + "." + modelName + ";");
		bw.newLine();
		bw.newLine();
		bw.newLine();
		bw = buildClassComment(bw, beanName + " 基础系统生成 业务处理接口类");
		bw.newLine();
		bw.newLine();
		bw.write("public interface " + beanName + "Service  {");
		bw.newLine();
		bw.newLine();
		// ----------定义Mapper中的方法Begin----------

		bw = buildMethodComment(bw, "单个新增");
		bw.newLine();
		bw.write("\t public  ServiceMessage<" + modelName + "> save( "
				+ modelName + " " + record + ");");
		bw.newLine();
		bw = buildMethodComment(bw, "批量新增");
		bw.newLine();
		bw.write("\t public  ServiceMessage<String> saveBatch" + modelName
				+ "(List<" + modelName + "> list);");
		bw.newLine();
		bw = buildMethodComment(bw, "根据主键ID修改");
		bw.newLine();
		bw.write("\t public  ServiceMessage<" + modelName
				+ "> updateByPrimaryKey( " + modelName + " " + record + ");");
		bw.newLine();
		bw = buildMethodComment(bw, "修改（根据主键ID查询）");
		bw.newLine();
		bw.write("\t public  ServiceMessage<" + modelName
				+ "> selectByPrimaryKey (Long id);");
		bw.newLine();
		bw.newLine();
		bw = buildMethodComment(bw, "多条数据");
		bw.newLine();
		bw.write("\t public  ServiceMessage<List<" + modelName
				+ ">> queryByList (" + modelName + " " + record + ");");
		bw = buildMethodComment(bw, "查询总数");
		bw.newLine();
		bw.write("\t public  ServiceMessage<Integer>  queryCount ( "
				+ modelName + " " + record + ");");
		bw = buildMethodComment(bw, "分页查询");
		bw.newLine();
		bw.write("\t public  ServiceMessage<Page<" + modelName
				+ ">>  queryPageList (Integer pageNum, Integer pageSize, "
				+ modelName + " " + record + ");");
		bw.newLine();
		bw.newLine();

		// ----------定义Mapper中的方法End----------
		bw.newLine();
		bw.write("}");
		bw.flush();
		bw.close();
	}

	/**
	 * 构建 基础 的service 文件
	 *
	 * @throws IOException
	 */
	@SuppressWarnings("unused")
	private void buildBaseServiceImp() throws IOException {
		File folder = new File(serviceimp_path);
		if (!folder.exists()) {
			folder.mkdirs();
		}
		String record = processResultMapId(modelName);
		String mappername = processResultMapId(mapperName);
		File mapperFile = new File(serviceimp_path, beanName
				+ "ServiceImpl.java");
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(
				new FileOutputStream(mapperFile), "utf-8"));
		bw.write("package " + serviceimp_package + ";");
		bw.newLine();
		bw.newLine();

		bw.write("import java.util.List;");
		bw.newLine();
		bw.write("import com.j1.base.dto.ServiceMessage;");
		bw.newLine();
		bw.write("import com.j1.base.page.Page;");
		bw.newLine();
		bw.write("import com.j1.base.page.Pageable;");
		bw.newLine();
		bw.write("import com.j1.base.page.PageImpl;");
		bw.newLine();
		bw.write("import com.j1.base.page.PageRequest;");
		bw.newLine();
		bw.write("import com.j1.soa.common.service.BaseServiceImpl;");
		bw.newLine();
		bw.write("import com.j1.base.dto.ServiceMessage;");
		bw.newLine();
		bw.write("import " + bean_package + "." + beanName + ";");
		bw.newLine();
		bw.write("import " + model_package + "." + modelName + ";");
		bw.newLine();
		bw.write("import com.j1.soa.common.validate.ValidateFiled;");
		bw.newLine();
		bw.write("import com.j1.soa.common.validate.ValidateGroup;");
		bw.newLine();
		bw.write("import " + service_package + "." + beanName + "Service;");
		bw.newLine();
		bw.write("import " + mapper_package + "." + mapperName + ";");
		bw.newLine();
		bw.write("import org.springframework.beans.factory.annotation.Autowired;");
		bw.newLine();
		bw = buildClassComment(bw, beanName + "业务处理实现类");
		bw.newLine();
		bw.newLine();
		bw.write("public class " + beanName
				+ "ServiceImpl extends  BaseServiceImpl implements " + beanName
				+ "Service  {");
		bw.newLine();
		bw.newLine();
		bw.newLine();
		bw.write("\t @Autowired");
		bw.newLine();
		bw.write("\t protected " + mapperName + " " + mappername + ";");
		// ----------定义Mapper中的方法Begin----------

		bw = buildMethodComment(bw, "单个新增");
		bw.newLine();
		bw.write("\t public  ServiceMessage<" + modelName + "> save( "
				+ modelName + "  " + record + "){");
		bw.newLine();
		bw.write("\t         try {");
		bw.newLine();
		bw.write("\t              String time = DateUtils.getCurrentDateString();");
		bw.newLine();
		bw.write("\t              record.setAddTime(time);");
		bw.newLine();
		bw.write("\t              record.setEditTime(time);");
		bw.newLine();
		bw.write("\t              record.setIsDelete(\"N\");");
		bw.newLine();
		bw.write("\t              " + mappername + ".save(" + record + ");");
		bw.newLine();
		bw.write("\t              return super.returnCorrectResult(\"保存成功！\", "
				+ record + ");");
		bw.newLine();
		bw.write("\t         } catch (Exception e) {");
		bw.newLine();
		bw.write("\t              logger.error(e.getMessage(), e);");
		bw.newLine();
		bw.write("\t              return super.returnException(\"保存异常！\");");
		bw.newLine();
		bw.write("\t         }");
		bw.newLine();
		bw.write("\t }");
		bw.newLine();

		bw = buildMethodComment(bw, "批量新增");
		bw.newLine();
		bw.write("\t public  ServiceMessage<String> saveBatch" + modelName
				+ "(List<" + modelName + "> list){");
		bw.newLine();
		bw.write("\t         try {");
		bw.newLine();
		bw.write("\t              " + mappername + ".saveBatch" + modelName
				+ "(list);");
		bw.newLine();
		bw.write("\t              return super.returnCorrectResult(\"批量新增成功！\");");
		bw.newLine();
		bw.write("\t         } catch (Exception e) {");
		bw.newLine();
		bw.write("\t              logger.error(e.getMessage(), e);");
		bw.newLine();
		bw.write("\t              return super.returnException(\"批量新增异常！\");");
		bw.newLine();
		bw.write("\t         }");
		bw.newLine();
		bw.write("\t }");
		bw.newLine();


		bw.newLine();
		bw = buildMethodComment(bw, "根据主键ID修改");
		bw.newLine();
		bw.write("\t @ValidateGroup(fileds = { @ValidateFiled(filedName = \"id\", rejectMsg = \"id不能为空\") }) ");
		bw.newLine();
		bw.write("\t public  ServiceMessage<" + modelName
				+ "> updateByPrimaryKey( " + modelName + "  " + record + "){");
		bw.newLine();
		bw.write("\t         try {");
		bw.newLine();
		bw.write("\t              int i = " + mappername
				+ ".updateByPrimaryKey(" + record + ");");
		bw.newLine();
		bw.write("\t              if (i > 0) {");
		bw.newLine();
		bw.write("\t                       return super.returnCorrectResult(\"主键ID修改成功！\", "
				+ record + ");");
		bw.newLine();
		bw.write("\t              }");
		bw.newLine();
		bw.write("\t              return super.returnNoResult(\"主键ID修改失败！\");");
		bw.newLine();
		bw.write("\t         } catch (Exception e) {");
		bw.newLine();
		bw.write("\t              logger.error(e.getMessage(), e);");
		bw.newLine();
		bw.write("\t              return super.returnException(\"主键ID修改异常！\");");
		bw.newLine();
		bw.write("\t         }");
		bw.newLine();
		bw.write("\t }");
		bw.newLine();

		bw.newLine();
		bw = buildMethodComment(bw, "主键查询（根据主键ID查询单个对象）");
		bw.newLine();
		bw.write("\t public  ServiceMessage<" + modelName
				+ "> selectByPrimaryKey (Long id){");
		bw.newLine();
		bw.write("\t         try {");
		bw.newLine();
		bw.write("\t              if( null==id || id == 0){");
		bw.newLine();
		bw.write("\t                   return super.returnParamsError(\"ID参数不能为空\"); ");
		bw.newLine();
		bw.write("\t              }");
		bw.newLine();
		bw.write("\t              return super.returnCorrectResult(\"主键查询成功！\","
				+ mappername + ".selectByPrimaryKey(id));");
		bw.newLine();
		bw.write("\t         } catch (Exception e) {");
		bw.newLine();
		bw.write("\t              logger.error(e.getMessage(), e);");
		bw.newLine();
		bw.write("\t              return super.returnException(\"主键查询异常！\");");
		bw.newLine();
		bw.write("\t         }");
		bw.newLine();
		bw.write("\t }");
		bw.newLine();

		bw.newLine();
		bw.newLine();
		bw = buildMethodComment(bw, "多条查询数据");
		bw.newLine();
		bw.write("\t public  ServiceMessage<List<" + modelName
				+ ">> queryByList (" + modelName + "  " + record + "){");
		bw.newLine();
		bw.write("\t         try {");
		bw.newLine();
		bw.write("\t              " + record + ".setIsDelete(\"N\");");
		bw.newLine();
		bw.write("\t              return super.returnCorrectResult(\"多条查询成功！\","
				+ mappername + ".queryList(" + record + "));");
		bw.newLine();
		bw.write("\t         } catch (Exception e) {");
		bw.newLine();
		bw.write("\t              logger.error(e.getMessage(), e);");
		bw.newLine();
		bw.write("\t              return super.returnException(\"多条查询异常！\");");
		bw.newLine();
		bw.write("\t         }");
		bw.newLine();
		bw.write("\t }");
		bw.newLine();

		bw.newLine();
		bw.newLine();
		bw = buildMethodComment(bw, "查询总数");
		bw.newLine();
		bw.write("\t public  ServiceMessage<Integer> queryCount (" + modelName
				+ "  " + record + "){");
		bw.newLine();
		bw.write("\t         try {");
		bw.newLine();
		bw.write("\t              " + record + ".setIsDelete(\"N\");");
		bw.newLine();
		bw.write("\t              return super.returnCorrectResult(\"查询总数成功！\","
				+ mappername + ".queryCount(" + record + "));");
		bw.newLine();
		bw.write("\t         } catch (Exception e) {");
		bw.newLine();
		bw.write("\t              logger.error(e.getMessage(), e);");
		bw.newLine();
		bw.write("\t              return super.returnException(\"查询总数异常！\");");
		bw.newLine();
		bw.write("\t         }");
		bw.newLine();
		bw.write("\t }");
		bw.newLine();

		bw = buildMethodComment(bw, "分页查询");
		bw.newLine();
		bw.write("\t public  ServiceMessage<Page<" + modelName
				+ ">>  queryPageList (Integer pageNum, Integer pageSize, "
				+ modelName + "  " + record + "){");
		bw.newLine();
		bw.write("\t         try {");
		bw.newLine();
		bw.write("\t              " + record + ".setIsDelete(\"N\");");
		bw.newLine();
		bw.write("\t              Pageable<" + modelName
				+ "> pageRequest = new PageRequest<" + modelName
				+ ">(pageNum, pageSize, " + record + ");");
		bw.newLine();
		bw.write("\t              List<" + modelName + "> list = " + mappername
				+ ".queryPageList(pageRequest);");
		bw.newLine();
		bw.write("\t              Integer count = " + mappername
				+ ".queryPageCount(pageRequest);");
		bw.newLine();
		bw.write("\t              Page<" + modelName
				+ "> pageResult = new PageImpl<" + modelName
				+ ">(list, pageRequest, count);");
		bw.newLine();
		bw.write("\t              return super.returnCorrectResult(\"分页查询成功！\", pageResult);");
		bw.newLine();
		bw.write("\t         } catch (Exception e) {");
		bw.newLine();
		bw.write("\t              logger.error(e.getMessage(), e);");
		bw.newLine();
		bw.write("\t              return super.returnException(\"分页查询异常！\");");
		bw.newLine();
		bw.write("\t         }");
		bw.newLine();
		bw.write("\t }");
		bw.newLine();

		// ----------定义Mapper中的方法End----------
		bw.newLine();
		bw.write("}");
		bw.flush();
		bw.close();
	}

	/**
	 * 构建 自定义 的service 文件
	 *
	 * @throws IOException
	 */
	@SuppressWarnings("unused")
	private void buildService() throws IOException {
		File folder = new File(service_path);
		if (!folder.exists()) {
			folder.mkdirs();
		}
		String record = processResultMapId(modelName);
		File mapperFile = new File(service_path, modelName + "Service.java");
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(
				new FileOutputStream(mapperFile), "utf-8"));
		bw.write("package " + service_package + ";");
		bw.newLine();
		bw.newLine();
		bw.newLine();
		bw.write("import " + service_package + "." + beanName + "Service;");
		bw.newLine();
		bw = buildClassComment(bw, modelName + " 业务处理接口类");
		bw.newLine();
		bw.newLine();
		bw.write("public interface " + modelName + "Service  extends "
				+ beanName + "Service {");
		bw.newLine();
		bw.newLine();
		// ----------定义Mapper中的方法Begin----------
		//
		// bw = buildMethodComment(bw, "单个新增");
		// bw.newLine();
		// bw.write("\t public  ServiceMessage<" + beanName + "Model> save( " +
		// beanName + "Model " + record +");");
		// bw.newLine();
		// bw = buildMethodComment(bw, "批量新增");
		// bw.newLine();
		// bw.write("\t public  ServiceMessage<" + beanName + "Model> saveBatch"
		// + beanName + "(List<" + beanName + "Model> list);");
		// bw.newLine();
		// bw = buildMethodComment(bw, "修改 （匹配有值的字段）");
		// bw.newLine();
		// bw.write("\t public  ServiceMessage<" + beanName +
		// "Model> updateBySelective( " + beanName + "Model " + record +");");
		// bw.newLine();
		// bw = buildMethodComment(bw, "修改（根据主键ID修改）");
		// bw.newLine();
		// bw.write("\t public  ServiceMessage<" + beanName +
		// "Model> updateByPrimaryKey ( " + beanName + "Model " + record +");");
		// bw.newLine();
		// bw = buildMethodComment(bw, "查询（根据主键ID查询）");
		// bw.newLine();
		// bw.write("\t public  ServiceMessage<" + beanName +
		// "Model>  selectByPrimaryKey (Long id );");
		// bw.newLine();
		// bw = buildMethodComment(bw, "多条数据");
		// bw.newLine();
		// bw.write("\t public  ServiceMessage<List<" + beanName +
		// "Model>> queryByList (" + beanName + "Model " + record +");");
		// bw = buildMethodComment(bw, "分页-查询");
		// bw.newLine();
		// bw.write("\t public  ServiceMessage<Page<" + beanName +
		// "Model>>  queryByPageList (Integer pageNum, Integer pageSize, Pageable<"
		// + beanName + "Model> " + "page"+beanName +");");
		// bw.newLine();
		// bw = buildMethodComment(bw, "分页-查询总数");
		// bw.newLine();
		// bw.write("\t public  ServiceMessage<Integer>  queryByPageCount ( " +
		// beanName + "Model " + record +");");
		// bw.newLine();
		// ----------定义Mapper中的方法End----------
		bw.newLine();
		bw.write("}");
		bw.flush();
		bw.close();
	}

	/**
	 * 构建 自定义 的service 文件
	 *
	 * @throws IOException
	 */
	@SuppressWarnings("unused")
	private void buildServiceImp() throws IOException {
		File folder = new File(serviceimp_path);
		if (!folder.exists()) {
			folder.mkdirs();
		}
		String record = processResultMapId(modelName);
		File mapperFile = new File(serviceimp_path, modelName
				+ "ServiceImpl.java");
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(
				new FileOutputStream(mapperFile), "utf-8"));
		bw.write("package " + serviceimp_package + ";");
		bw.newLine();
		bw.newLine();
		bw.write("import " + serviceimp_package + "." + beanName
				+ "ServiceImpl;");
		bw.newLine();
		bw.write("import " + service_package + "." + modelName + "Service;");
		bw.newLine();
		bw.write("import " + model_package + "." + modelName + ";");
		bw.newLine();
		bw.write("import org.springframework.stereotype.Service;");
		bw.newLine();
		bw.newLine();
		bw.newLine();
		bw = buildClassComment(bw, modelName + " 业务处理接口类");
		bw.newLine();
		bw.newLine();
		bw.write("@Service");
		bw.newLine();
		bw.write("public class " + modelName + "ServiceImpl extends  "
				+ beanName + "ServiceImpl implements " + modelName
				+ "Service  {");
		bw.newLine();
		bw.newLine();
		// ----------定义Mapper中的方法Begin----------
		//
		// bw = buildMethodComment(bw, "单个新增");
		// bw.newLine();
		// bw.write("\t public  ServiceMessage<" + beanName + "Model> save( " +
		// beanName + "Model " + record +");");
		// bw.newLine();
		// bw = buildMethodComment(bw, "批量新增");
		// bw.newLine();
		// bw.write("\t public  ServiceMessage<" + beanName + "Model> saveBatch"
		// + beanName + "(List<" + beanName + "Model> list);");
		// bw.newLine();
		// bw = buildMethodComment(bw, "修改 （匹配有值的字段）");
		// bw.newLine();
		// bw.write("\t public  ServiceMessage<" + beanName +
		// "Model> updateBySelective( " + beanName + "Model " + record +");");
		// bw.newLine();
		// bw = buildMethodComment(bw, "修改（根据主键ID修改）");
		// bw.newLine();
		// bw.write("\t public  ServiceMessage<" + beanName +
		// "Model> updateByPrimaryKey ( " + beanName + "Model " + record +");");
		// bw.newLine();
		// bw = buildMethodComment(bw, "查询（根据主键ID查询）");
		// bw.newLine();
		// bw.write("\t public  ServiceMessage<" + beanName +
		// "Model>  selectByPrimaryKey (Long id );");
		// bw.newLine();
		// bw = buildMethodComment(bw, "多条数据");
		// bw.newLine();
		// bw.write("\t public  ServiceMessage<List<" + beanName +
		// "Model>> queryByList (" + beanName + "Model " + record +");");
		// bw = buildMethodComment(bw, "分页-查询");
		// bw.newLine();
		// bw.write("\t public  ServiceMessage<Page<" + beanName +
		// "Model>>  queryByPageList (Integer pageNum, Integer pageSize, Pageable<"
		// + beanName + "Model> " + "page"+beanName +");");
		// bw.newLine();
		// bw = buildMethodComment(bw, "分页-查询总数");
		// bw.newLine();
		// bw.write("\t public  ServiceMessage<Integer>  queryByPageCount ( " +
		// beanName + "Model " + record +");");
		// bw.newLine();
		// ----------定义Mapper中的方法End----------
		bw.newLine();
		bw.write("}");
		bw.flush();
		bw.close();
	}

	/**
	 * 构建 基础 的 test case 文件
	 *
	 * @throws IOException
	 */
	@SuppressWarnings("unused")
	private void buildTestCase(List<String> columns, List<String> types,
			List<String> comments) throws IOException {
		File folder = new File(testcase_path);
		if (!folder.exists()) {
			folder.mkdirs();
		}
		String record = processResultMapId(modelName);
		String mappername = processResultMapId(mapperName);
		File mapperFile = new File(testcase_path, modelName + "TestCase.java");
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(
				new FileOutputStream(mapperFile), "utf-8"));
		bw.write("package " + testcase_package + ";");
		bw.newLine();

		bw.newLine();
		bw.write("import junit.framework.TestCase;");
		bw.newLine();
		bw.write("import net.sf.json.JSONObject;");
		bw.newLine();
		bw.write("import org.junit.After;");
		bw.newLine();
		bw.write("import org.junit.Before;");
		bw.newLine();
		bw.write("import org.junit.Test;");
		bw.newLine();
		bw.write("import java.util.ArrayList;");
		bw.newLine();
		bw.write("import java.util.List;");
		bw.newLine();
		bw.write("import com.j1.base.dto.ServiceMessage;");
		bw.newLine();
		bw.write(" import com.j1.base.page.Page;");
		bw.newLine();
		bw.write("import com.j1.hessian.common.J1SOAHessianHelper;");
		bw.newLine();
		bw.write("import " + service_package + "." + modelName + "Service;");
		bw.newLine();
		bw.write("import " + model_package + "." + modelName + ";");
		bw.newLine();
		bw.newLine();
		bw = buildClassComment(bw, modelName + "测试类");
		bw.newLine();
		bw.newLine();
		bw.write("public class " + modelName + "TestCase extends TestCase {");
		bw.newLine();
		bw.newLine();
		// ----------定义Mapper中的方法Begin----------
		bw.newLine();
		bw.write("\t private final String url = \"http://localhost:8089/j1soa-member/hessian/\";");
		bw.newLine();
		bw.write("\t private long start;");
		bw.newLine();
		bw.write("\t private long end;");
		bw.newLine();
		bw.write("\t @Before");
		bw.newLine();
		bw.write("\t public void setUp() {");
		bw.newLine();
		bw.write("\t        start = System.currentTimeMillis();");
		bw.newLine();
		bw.write("\t }");
		bw.newLine();
		bw.write("\t @After");
		bw.newLine();
		bw.write("\t public void tearDown() {");
		bw.newLine();
		bw.write("\t        end = System.currentTimeMillis();");
		bw.newLine();
		bw.write("\t        System.out.println(\"总耗时：\" + (end - start));");
		bw.newLine();
		bw.write("\t }");

		bw = buildMethodComment(bw, "单个新增");
		bw.newLine();
		bw.write("\t @Test");
		bw.newLine();
		bw.write("\t public  void testSave(){");
		bw.newLine();
		bw.write("\t        " + modelName
				+ "Service hessianServer = J1SOAHessianHelper.getService(url,"
				+ modelName + "Service.class);");
		bw.newLine();
		bw.write("\t        " + modelName + " obj = createObj()  ;");
		bw.newLine();
		bw.write("\t        ServiceMessage<" + modelName
				+ "> result = hessianServer.save(obj);");
		bw.newLine();
		bw.write("\t        System.out.println(JSONObject.fromObject(result));");
		bw.newLine();
		bw.write("\t }");
		bw.newLine();

		bw = buildMethodComment(bw, "批量新增");
		bw.newLine();
		bw.write("\t @Test");
		bw.newLine();
		bw.write("\t public  void testSaveBatch(){");
		bw.newLine();
		bw.write("\t        " + modelName
				+ "Service hessianServer = J1SOAHessianHelper.getService(url,"
				+ modelName + "Service.class);");
		bw.newLine();
		bw.write("\t        List<" + modelName + "> list = new ArrayList<"
				+ modelName + ">();");
		bw.newLine();
		bw.write("\t        " + modelName + " obj = createObj()  ;");
		bw.newLine();
		bw.write("\t        list.add(obj);");
		bw.newLine();
		bw.write("\t        ServiceMessage<String> result = hessianServer.saveBatch"
				+ modelName + "(list);");
		bw.newLine();
		bw.write("\t        System.out.println(JSONObject.fromObject(result));");
		bw.newLine();
		bw.write("\t }");
		bw.newLine();

		bw.newLine();
		bw = buildMethodComment(bw, "匹配修改 （匹配有值的字段）");
		bw.newLine();
		bw.write("\t @Test");
		bw.newLine();
		bw.write("\t public  void testUpdate" + modelName + "( ){");
		bw.newLine();
		bw.write("\t        " + modelName
				+ "Service hessianServer = J1SOAHessianHelper.getService(url,"
				+ modelName + "Service.class);");
		bw.newLine();
		bw.write("\t        " + modelName + " obj = createObj()  ;");
		bw.newLine();
		bw.write("\t        ServiceMessage<" + modelName
				+ "> result = hessianServer.update" + modelName + "(obj);");
		bw.newLine();
		bw.write("\t        System.out.println(JSONObject.fromObject(result));");
		bw.newLine();
		bw.write("\t }");
		bw.newLine();

		bw.newLine();
		bw = buildMethodComment(bw, "主键ID修改");
		bw.newLine();
		bw.write("\t @Test");
		bw.newLine();
		bw.write("\t public  void testUpdateByPrimaryKey(){");
		bw.newLine();
		bw.write("\t        " + modelName
				+ "Service hessianServer = J1SOAHessianHelper.getService(url,"
				+ modelName + "Service.class);");
		bw.newLine();
		bw.write("\t        " + modelName + " obj = createObj()  ;");
		bw.newLine();
		bw.write("\t        obj.setId(1L);");
		bw.newLine();
		bw.write("\t        ServiceMessage<" + modelName
				+ "> result = hessianServer.updateByPrimaryKey(obj);");
		bw.newLine();
		bw.write("\t        System.out.println(JSONObject.fromObject(result));");
		bw.newLine();
		bw.write("\t }");
		bw.newLine();

		bw.newLine();
		bw = buildMethodComment(bw, "主键查询（根据主键ID查询单个对象）");
		bw.newLine();
		bw.write("\t @Test");
		bw.newLine();
		bw.write("\t public  void testSelectByPrimaryKey (){");
		bw.newLine();
		bw.write("\t        " + modelName
				+ "Service hessianServer = J1SOAHessianHelper.getService(url,"
				+ modelName + "Service.class);");
		bw.newLine();
		bw.write("\t        ServiceMessage<" + modelName
				+ "> result = hessianServer.selectByPrimaryKey(1L);");
		bw.newLine();
		bw.write("\t        System.out.println(JSONObject.fromObject(result));");
		bw.newLine();
		bw.write("\t }");
		bw.newLine();

		bw.newLine();
		bw.newLine();
		bw = buildMethodComment(bw, "多条查询数据");
		bw.newLine();
		bw.write("\t @Test");
		bw.newLine();
		bw.write("\t public  void testQueryByList (){");
		bw.newLine();
		bw.newLine();
		bw.write("\t        " + modelName
				+ "Service hessianServer = J1SOAHessianHelper.getService(url,"
				+ modelName + "Service.class);");
		bw.newLine();
		bw.write("\t        " + modelName + " obj = createObj()  ;");
		bw.newLine();
		bw.write("\t        ServiceMessage<List<" + modelName
				+ ">> result = hessianServer.queryByList(obj);");
		bw.newLine();
		bw.write("\t        System.out.println(JSONObject.fromObject(result));");
		bw.newLine();
		bw.write("\t }");
		bw.newLine();

		bw.newLine();
		bw.newLine();
		bw = buildMethodComment(bw, "查询总数");
		bw.newLine();
		bw.write("\t @Test");
		bw.newLine();
		bw.write("\t public  void testQueryCount (){");
		bw.newLine();
		bw.newLine();
		bw.write("\t        " + modelName
				+ "Service hessianServer = J1SOAHessianHelper.getService(url,"
				+ modelName + "Service.class);");
		bw.newLine();
		bw.write("\t        " + modelName + " obj = createObj()  ;");
		bw.newLine();
		bw.write("\t        ServiceMessage<Integer> result = hessianServer.queryCount(obj);");
		bw.newLine();
		bw.write("\t        System.out.println(JSONObject.fromObject(result));");
		bw.newLine();
		bw.write("\t }");
		bw.newLine();

		bw = buildMethodComment(bw, "分页查询");
		bw.newLine();
		bw.write("\t @Test");
		bw.newLine();
		bw.write("\t public  void  testQueryByPageList (){");
		bw.newLine();
		bw.write("\t        " + modelName
				+ "Service hessianServer = J1SOAHessianHelper.getService(url,"
				+ modelName + "Service.class);");
		bw.newLine();
		bw.write("\t        " + modelName + " obj = createObj()  ;");
		bw.newLine();
		bw.write("\t        ServiceMessage<Page<" + modelName
				+ ">> result = hessianServer.queryPageList(1,20,obj);");
		bw.newLine();
		bw.write("\t        System.out.println(JSONObject.fromObject(result));");
		bw.newLine();
		bw.write("\t }");
		bw.newLine();

		bw = buildMethodComment(bw, "创建对象");
		bw.newLine();
		bw.write("\t private " + modelName + " createObj() {");
		bw.newLine();
		bw.write("\t        " + modelName + " obj = new " + modelName + "();");
		bw.newLine();
		bw = funGetSet(bw, columns, types, comments);
		bw.newLine();
		bw.write("\t        return obj;");
		bw.newLine();
		bw.write("\t }");
		bw.newLine();

		// ----------定义Mapper中的方法End----------
		bw.newLine();
		bw.write("}");
		bw.flush();
		bw.close();
	}

	/**
	 * 构建 基础 的 test case 文件
	 *
	 * @throws IOException
	 */
	@SuppressWarnings("unused")
	private void buildHessionXml() throws IOException {
		File folder = new File(testcase_path);
		if (!folder.exists()) {
			folder.mkdirs();
		}
		File mapperFile = new File(testcase_path, "Hesion.xml");
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(
				new FileOutputStream(mapperFile), "utf-8"));

		for (String modelName : modelNames) {
			String record = processResultMapId(modelName);
			bw.newLine();
			bw.write("<bean name=\"/"
					+ record
					+ "Service\" class=\"org.springframework.remoting.caucho.HessianServiceExporter\"> ");
			bw.newLine();
			bw.write("      <property name=\"service\" >");
			bw.newLine();
			bw.write("             <bean class=\"" + serviceimp_package + "."
					+ modelName + "ServiceImpl\" />");
			bw.newLine();
			bw.write("      </property>");
			bw.newLine();
			bw.write("      <property name=\"serviceInterface\" value=\""
					+ service_package + "." + modelName + "Service\" />");
			bw.newLine();
			bw.write("</bean>");
			bw.newLine();
		}

		for (String modelName : modelNames) {
			// String record = processResultMapId(modelName);
			bw.newLine();
			bw.write("<typeAlias alias=\"" + modelName + "\" type=\""
					+ model_package + "." + modelName + "\"/>");
		}

		bw.newLine();
		bw.write("========application-context-soa-member.xml============");

		for (String modelName : modelNames) {
			String record = processResultMapId(modelName);
			bw.newLine();
			bw.newLine();
			bw.write("<bean id=\""
					+ record
					+ "Service\" class=\"org.springframework.remoting.caucho.HessianProxyFactoryBean\"> ");
			bw.newLine();
			bw.write("     <property name=\"serviceUrl\" value=\"&URL;"
					+ record + "Service\"/>");
			bw.newLine();
			bw.write("     <property name=\"serviceInterface\" value=\""
					+ service_package + "." + modelName + "Service\"/>");
			bw.newLine();
			bw.write("     <property name=\"readTimeout\" value=\"&SOA_READTIMEOUT;\"/>");
			bw.newLine();
			bw.write("</bean>");
			bw.newLine();
		}

		// ----------定义Mapper中的方法End----------
		bw.newLine();
		bw.flush();
		bw.close();
	}

	/**
	 * 构建 基础 的 controller 文件
	 *
	 * @throws IOException
	 */
	@SuppressWarnings("unused")
	private void buildAction() throws IOException {
		File folder = new File(action_path);
		if (!folder.exists()) {
			folder.mkdirs();
		}
		String record = processResultMapId(modelName);
		String recordService = processResultMapId(modelName) + "Service";
		String mappername = processResultMapId(mapperName);
		File mapperFile = new File(action_path, modelName + "Action.java");
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(
				new FileOutputStream(mapperFile), "utf-8"));
		bw.write("package " + action_package + ";");

		bw.newLine();
		bw.write("import java.util.HashMap;");
		bw.newLine();
		bw.write("import java.util.Map;");

		bw.newLine();
		bw.write("import javax.servlet.http.HttpServletRequest;");
		bw.newLine();
		bw.write("import net.sf.json.JSONObject;");
		bw.newLine();
		bw.write("import org.springframework.beans.factory.annotation.Autowired;");
		bw.newLine();
		bw.write("import org.springframework.stereotype.Controller;");
		bw.newLine();
		bw.write("import org.springframework.web.bind.annotation.PathVariable;");
		bw.newLine();
		bw.write("import org.springframework.web.bind.annotation.RequestMapping;");
		bw.newLine();
		bw.write("import org.springframework.web.bind.annotation.RequestMethod;");
		bw.newLine();
		bw.write("import org.springframework.web.bind.annotation.RequestParam;");
		bw.newLine();
		bw.write("import org.springframework.web.bind.annotation.ResponseBody;");
		bw.newLine();
		bw.write("import com.founder.ec.base.action.BaseClassAction;");
		bw.newLine();
		bw.write("import com.founder.ec.common.utils.DateUtils;");
		bw.newLine();
		bw.write("import com.j1.base.dto.ServiceMessage;");
		bw.newLine();
		bw.write("import com.j1.base.page.Page;");
		bw.newLine();
		bw.write("import com.j1.base.type.MsgStatus;");
		bw.newLine();
		bw.write("import " + model_package + "." + modelName + ";");
		bw.newLine();
		bw.write("import " + service_package + "." + modelName + "Service;");
		bw.newLine();
		bw.newLine();
		bw.newLine();

		bw.newLine();
		bw.write("@Controller ");
		bw.newLine();
		bw.write("@RequestMapping(value=\"/" + record + "\") ");
		bw.newLine();
		bw.write("public class " + modelName
				+ "Action extends BaseClassAction {  ");
		bw.newLine();
		bw.newLine();
		bw.write("    @Autowired ");
		bw.newLine();
		bw.write("    private " + modelName + "Service " + recordService + "; ");
		bw.newLine();
		bw.newLine();
		bw.write("  /**");
		bw.newLine();
		bw.write("  *@description 分页查询\n");
		bw.newLine();
		bw.write("  */");
		bw.newLine();
		bw.write("  @RequestMapping(value=\"/getPage\",method=RequestMethod.POST) ");
		bw.newLine();
		bw.write("  public @ResponseBody Map<String,Object> getPage(@RequestParam(defaultValue=\"20\")Integer pageNo,@RequestParam(defaultValue=\"1\")Integer pageSize, "
				+ modelName + " obj){\n");
		bw.newLine();
		bw.write("        try{  ");
		bw.newLine();
		bw.write("  	      ServiceMessage<Page<" + modelName + ">> msgRes = "
				+ recordService + ".queryPageList(pageSize,pageNo,obj);");
		bw.newLine();
		bw.write("  	      if(!msgRes.getStatus().equals(MsgStatus.NORMAL)){");
		bw.newLine();
		bw.write("  		       logger.error(\"SOA服务异常\");");
		bw.newLine();
		bw.write("  		       return null;");
		bw.newLine();
		bw.write("  	      }");
		bw.newLine();
		bw.write("  	      Page<" + modelName + "> page = msgRes.getResult();");
		bw.newLine();
		bw.write("  	      Map<String,Object> resMap = new HashMap<String, Object>();");
		bw.newLine();
		bw.write("  	      resMap.put(\"total\", page.getTotalCount());");
		bw.newLine();
		bw.write("	          resMap.put(\"rows\",page.getData());");
		bw.newLine();
		bw.write("			  return resMap;");
		bw.newLine();
		bw.write("		  }catch(Exception e){");
		bw.newLine();
		bw.write("			  logger.error(e.getMessage(), e);");
		bw.newLine();
		bw.write("			  return null;");
		bw.newLine();
		bw.write("		  }");
		bw.newLine();
		bw.write("	}");
		bw.newLine();
		bw.newLine();
		bw.newLine();

		bw.newLine();
		bw.write("  /**\n");
		bw.newLine();
		bw.write("  *@description 根据主键查询Bean\n");
		bw.newLine();
		bw.write("  */ ");
		bw.newLine();
		bw.write("  @RequestMapping(value=\"/getBean/{getId}\",method=RequestMethod.POST) ");
		bw.newLine();
		bw.write("  public @ResponseBody String getBean(@PathVariable Long getId){ ");
		bw.newLine();
		bw.write("        try{  ");
		bw.newLine();
		bw.write("  	        ServiceMessage<" + modelName + "> msgRes = "
				+ recordService + ".selectByPrimaryKey(getId);");
		bw.newLine();
		bw.write("  	        if(!msgRes.getStatus().equals(MsgStatus.NORMAL)){");
		bw.newLine();
		bw.write("  		         logger.error(\"SOA服务异常\");");
		bw.newLine();
		bw.write("  		         return \"SOA服务异常\";");
		bw.newLine();
		bw.write("  	       }");
		bw.newLine();
		bw.write("  	        " + modelName + " object = msgRes.getResult();");
		bw.newLine();
		bw.write("			   return JSONObject.fromObject(object).toString();");
		bw.newLine();
		bw.write("		  }catch(Exception e){");
		bw.newLine();
		bw.write("			  logger.error(e.getMessage(), e);");
		bw.newLine();
		bw.write("			  return \"查询异常\";");
		bw.newLine();
		bw.write("		  }");
		bw.newLine();
		bw.write("	}");
		bw.newLine();
		bw.newLine();
		bw.newLine();

		bw.write("  /**\n");
		bw.newLine();
		bw.write("  *@description 保存或者更新\n");
		bw.newLine();
		bw.write("  */\n");
		bw.newLine();
		bw.write("  @RequestMapping(value=\"/saveOrUpdate\",method=RequestMethod.POST) ");
		bw.newLine();
		bw.write("  public  @ResponseBody String  updateOrSave(HttpServletRequest request,"
				+ modelName + " obj){\n");
		bw.newLine();
		bw.write("        try{  ");
		bw.newLine();
		bw.write("  	       Integer userId = (Integer)request.getSession().getAttribute(\"userId\");");
		bw.newLine();
		bw.write("  	       if (obj.getId() != null) { ");
		bw.newLine();
		bw.write("  		          obj.setEditUser(Long.valueOf(userId));");
		bw.newLine();
		bw.write("  		          obj.setEditTime(DateUtils.getCurrentDateString());");
		bw.newLine();
		bw.write("  		          ServiceMessage<" + modelName + "> msgRes = "
				+ recordService + ".updateByPrimaryKey(obj);");
		bw.newLine();
		bw.write("  		          if(!msgRes.getStatus().equals(MsgStatus.NORMAL)){");
		bw.newLine();
		bw.write("  		       	        logger.error(\"SOA服务异常\");");
		bw.newLine();
		bw.write("  		       	        return \"SOA服务异常\";");
		bw.newLine();
		bw.write("  		           }");
		bw.newLine();
		bw.write("  		          return  \"ok\";");
		bw.newLine();
		bw.write("  	        } else {");
		bw.newLine();
		bw.write("                    obj.setAddUser(Long.valueOf(userId));");
		bw.newLine();
		bw.write("                    obj.setIsDelete(\"N\");");
		bw.newLine();
		bw.write("                    obj.setAddTime(DateUtils.getCurrentDateString());");
		bw.newLine();
		bw.write("                    ServiceMessage<" + modelName
				+ "> msgRes = " + recordService + ".save(obj);");
		bw.newLine();
		bw.write("                    if(!msgRes.getStatus().equals(MsgStatus.NORMAL)){");
		bw.newLine();
		bw.write("	                        logger.error(\"SOA服务异常\");");
		bw.newLine();
		bw.write("	                        return \"SOA服务异常\";");
		bw.newLine();
		bw.write("                    }");
		bw.newLine();
		bw.write("			          return  \"ok\";");
		bw.newLine();
		bw.write("  	          } ");
		bw.newLine();
		bw.write("		  }catch(Exception e){");
		bw.newLine();
		bw.write("			  logger.error(e.getMessage(), e);");
		bw.newLine();
		bw.write("			  return  \"操作异常\";");
		bw.newLine();
		bw.write("		  }");
		bw.newLine();
		bw.write("	}");
		bw.newLine();
		bw.newLine();
		bw.newLine();

		bw.write("  /**\n");
		bw.newLine();
		bw.write("  *@description 逻辑删除根据Ids(id是用逗号隔开)\n");
		bw.newLine();
		bw.write("  */\n");
		bw.newLine();
		bw.write("  @RequestMapping(value=\"/deleteIdsLogic\",method=RequestMethod.POST) ");
		bw.newLine();
		bw.write("  public  @ResponseBody String  deleteIdsLogic(HttpServletRequest request){ ");
		bw.newLine();
		bw.write("      try{");
		bw.newLine();
		bw.write("    	    String ids = null;");
		bw.newLine();
		bw.write("			if (request.getParameter(\"ids\") == null) {");
		bw.newLine();
		bw.write("				return \"没有ID参数！\";");
		bw.newLine();
		bw.write("			}	");
		bw.newLine();
		bw.write("	        String[] idArr = request.getParameter(\"ids\").trim().split(\",\");	");
		bw.newLine();
		bw.write("			if (idArr.length < 0) {");
		bw.newLine();
		bw.write("				 return  \"没有ID参数！\";");
		bw.newLine();
		bw.write("			}	");
		bw.newLine();
		bw.write("			for (int i = 0; i < idArr.length; i++) {");
		bw.newLine();
		bw.write("		        " + modelName + " obj = new " + modelName + "();");
		bw.newLine();
		bw.write("		        obj.setId(Long.parseLong(idArr[i]));");
		bw.newLine();
		bw.write("		        obj.setIsDelete(\"Y\");");
		bw.newLine();
		bw.write("		        ServiceMessage<" + modelName + "> msgRes = "
				+ recordService + ".updateByPrimaryKey(obj);");
		bw.newLine();
		bw.write("		        if(!msgRes.getStatus().equals(MsgStatus.NORMAL)){");
		bw.newLine();
		bw.write("			        logger.error(\"SOA服务异常\");");
		bw.newLine();
		bw.write("			        return  \"SOA服务异常\";");
		bw.newLine();
		bw.write("		        }");
		bw.newLine();
		bw.write("	        }");
		bw.newLine();
		bw.write("	        return \"ok\";");
		bw.newLine();
		bw.write("      }catch(Exception e){");
		bw.newLine();
		bw.write("          logger.error(e.getMessage(), e);");
		bw.newLine();
		bw.write("          return \"删除异常\";");
		bw.newLine();
		bw.write("      }");
		bw.newLine();
		bw.write("  }");
		bw.newLine();
		bw.write("}");
		// ----------定义Mapper中的方法End----------
		bw.newLine();
		bw.flush();
		bw.close();
	}

	/**
	 * 构建 基础 的 JSP 文件
	 *
	 * @throws IOException
	 */
	@SuppressWarnings("unused")
	private void buildJSP(List<String> columns, List<String> types,
			List<String> comments) throws IOException {
		File folder = new File(jsp_path);
		if (!folder.exists()) {
			folder.mkdirs();
		}
		String record = processResultMapId(modelName);
		File mapperFile = new File(jsp_path, record + ".jsp");
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(
				new FileOutputStream(mapperFile), "utf-8"));
		bw.write("<%@ page language=\"java\" contentType=\"text/html; charset=UTF-8\" pageEncoding=\"UTF-8\"%>\n");
		bw.write("<%@ taglib prefix=\"c\" uri=\"http://java.sun.com/jsp/jstl/core\" %>\n");
		bw.write("<c:set var=\"ctx\" value=\"${pageContext.request.contextPath}\" />\n");
		bw.write("<jsp:include page=\"/jsp/common/header.jsp\"></jsp:include>\n");
		bw.write("<script src=\"${ctx }" + js_package + record
				+ ".js\"></script>\n");
		bw.write("<table class=\"queryTable\">\n");
		bw.write("  <tr>\n");
		int size = columns.size();
		for (int i = 0; i < size; i++) {
			if (!columns.get(i).equalsIgnoreCase("id")
					&& !columns.get(i).equalsIgnoreCase("is_delete")
					&& !columns.get(i).equalsIgnoreCase("add_time")
					&& !columns.get(i).equalsIgnoreCase("edit_time")
					&& !columns.get(i).equalsIgnoreCase("add_user")
					&& !columns.get(i).equalsIgnoreCase("edit_user")) {
				bw.newLine();
				bw.write("    <td class=\"queryTitle\" width=\"80px\">"
						+ comments.get(i) + "</td> ");
				bw.newLine();
				bw.write("    <td class=\"queryContent\" ><input class=\"inputText\" type=\"text\" id=\""
						+ processField(columns.get(i)) + "\" /> </td> ");
			}
		}
		bw.newLine();
		bw.write("    <td class=\"queryBtnTd\" ><a href=\"javascript:void(0)\" class=\"easyui-linkbutton\" iconCls=\"icon-search\"  onclick=\"doQuery()\">搜&nbsp;&nbsp;索</a></td>\n");
		bw.write("  </tr>\n");
		bw.write("</table>\n");
		bw.write("<table id=\"deliveryGrid\"></table>\n\n");
		bw.write("<div id=\"opreateHtml\" class=\"easyui-window\" title=\"\" iconCls=\"icon-edit\" style=\"width:600px; height:200px;text-align:center; background: #fafafa;\">\n");
		bw.write("  <div class=\"easyui-layout\" fit=\"true\">\n");
		bw.write("    <div region=\"center\" border=\"false\" style=\"background:#fff;border:1px solid #ccc;padding-left: 30px;\">\n");
		bw.write("       <form style=\"width: 580px;height:300px; text-align: center;\">\n");
		bw.write("           <input type=\"hidden\" id=\"idHidden\" name=\"idHidden\" value=\"\" />\n");
		bw.write("           <table  border=\"0\" class=\"queryTable\"  width=\"580px\" height=\"300px\" style=\"margin-bottom: 0px\">\n");
		for (int i = 0; i < size; i++) {
			if (!columns.get(i).equalsIgnoreCase("id")
					&& !columns.get(i).equalsIgnoreCase("is_delete")
					&& !columns.get(i).equalsIgnoreCase("add_time")
					&& !columns.get(i).equalsIgnoreCase("edit_time")
					&& !columns.get(i).equalsIgnoreCase("add_user")
					&& !columns.get(i).equalsIgnoreCase("edit_user")) {
				bw.write("        <tr>");
				bw.newLine();
				bw.write("               <td class=\"queryTitle\" width=\"120px\">"
						+ comments.get(i) + "</td> ");
				bw.newLine();
				bw.write("               <td class=\"queryContent\" ><input class=\"inputText\" type=\"text\" id=\"add"
						+ processField(columns.get(i)) + "\" /> </td> ");
				bw.newLine();
				bw.write("        </tr>");
			}
		}
		bw.write("           </table>\n");
		bw.write("       </form>\n");
		bw.write("    </div>\n");

		bw.write("  <div region=\"south\" border=\"false\" style=\"text-align:center;height:30px;line-height:30px;\">\n");
		bw.write("     <a class=\"easyui-linkbutton\" iconCls=\"icon-ok\" href=\"javascript:void(0);\" onclick=\"save();\">更新信息</a>&nbsp;&nbsp;\n");
		bw.write("     <a class=\"easyui-linkbutton\" iconCls=\"icon-cancel\" href=\"javascript:void(0);\" onclick=\"closeWin();\">取消</a>\n");
		bw.write("  </div>\n");
		bw.write(" </div>\n");
		bw.write("</div>\n");
		// ----------定义Mapper中的方法End----------
		bw.newLine();
		bw.flush();
		bw.close();
	}

	/**
	 * 构建 基础 的 JS 文件
	 *
	 * @throws IOException
	 */
	@SuppressWarnings("unused")
	private void buildJS(List<String> columns, List<String> types,
			List<String> comments) throws IOException {
		File folder = new File(js_path);
		if (!folder.exists()) {
			folder.mkdirs();
		}
		String record = processResultMapId(modelName);
		File mapperFile = new File(js_path, record + ".js");
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(
				new FileOutputStream(mapperFile), "utf-8"));

		bw.write("var appPath = getAppPath();");
		bw.write("$(function(){\n");
		bw.write("  $(\"#opreateHtml\").window(\"close\");\n");
		bw.write("  $(\"#deliveryGrid\").datagrid({\n");
		bw.write("    url:appPath+\"/page/" + record + "/getPage\",\n");
		bw.write("    height:\"full\",\n");
		bw.write("    striped:true,\n");
		bw.write("    remoteSort:false,\n");
		bw.write("    pagination:true,\n");
		bw.write("    rownumbers:true,\n");
		bw.write("    singleSelect:false,\n");
		bw.write("    queryParams:getQueryParam(),\n");
		bw.write("    frozenColumns:[[{field:\"ck\",checkbox:true},\n");
		bw.write("      {field:\"opt\",title:\"操作\",width:60,align:\"center\",\n");
		bw.write("        formatter:function(value,rowData,rowIndex){\n");
		bw.write("          var html=\"<img class='op-enable' src='\"+appPath+\"/js/lib/jquery-easyui/themes/icons/pencil.png' onClick='showWin(\"+rowData.id+\")' title='编辑'/>\";\n");
		bw.write("          return html;\n");
		bw.write("        }\n");
		bw.write("      }\n");
		bw.write("    ]],\n");
		bw.write("    columns:[[\n");

		int j = 1;
		int size = columns.size();
		for (int i = 0; i < size; i++) {
			if (!columns.get(i).equalsIgnoreCase("id")
					&& !columns.get(i).equalsIgnoreCase("is_delete")
					&& !columns.get(i).equalsIgnoreCase("add_time")
					&& !columns.get(i).equalsIgnoreCase("edit_time")
					&& !columns.get(i).equalsIgnoreCase("add_user")
					&& !columns.get(i).equalsIgnoreCase("edit_user")) {
				bw.write("       {field:'" + processField(columns.get(i))
						+ "',title:'" + comments.get(i)
						+ "',width:100,align:'left',sortable:true} ");
				if (j < size - 6) {
					bw.write(" ,\n ");
				}
				j++;
			}
		}

		// if(needProMap!=null)
		// {
		// List<Object>
		// fieldNameList=Arrays.asList(needProMap.keySet().toArray());
		// for(int i=0;i<fieldNameList.size();i++)
		// {
		// if(!"id".equals(StringUtils.getHumpByUnderline(fieldNameList.get(i).toString(),
		// false)))
		// {
		// sb.append("       {field:'").append(StringUtils.getHumpByUnderline(fieldNameList.get(i).toString(),
		// false)).append("',title:'").append(StringUtils.getHumpByUnderline(fieldNameList.get(i).toString(),
		// false)).append("',width:100,align:'left',sortable:true}");
		// if(i!=fieldNameList.size()-1)
		// {
		// sb.append(",\n");
		// }
		// }
		// }
		// }

		bw.write("\n");
		bw.write("   ]],\n");
		bw.write("   toolbar:[\n");
		bw.write("      {\n");
		bw.write("          id:'btnAdd',\n");
		bw.write("          text:'添加记录',\n");
		bw.write("          iconCls:'icon-add', \n");
		bw.write("          handler:function(){	\n");
		bw.write("             showWin(null);\n");
		bw.write("          }	\n");
		bw.write("      },\"-\",\n");
		bw.write("      {\n");
		bw.write("          id:'btnPass',\n");
		bw.write("          text:'批量删除',\n");
		bw.write("          iconCls:'icon-ok',\n");
		bw.write("          handler:function(){	\n");
		bw.write("             deletes();\n");
		bw.write("          }	\n");
		bw.write("      },\"-\",\n");
		bw.write("      {\n");
		bw.write("          id:'btnExcel',\n");
		bw.write("          text:'导出Excel',\n");
		bw.write("          iconCls:'icon-exportExcel',\n");
		bw.write("          handler:function(){	\n");
		bw.write("             exportExcel();\n");
		bw.write("          }	\n");
		bw.write("      }\n");
		bw.write("   ]\n");
		bw.write(" });\n");
		bw.write("});\n\n");
		bw.write("function getQueryParam(){\n");
		bw.write("  var " + record + " =new Object();\n");
		for (int i = 0; i < size; i++) {
			if (!columns.get(i).equalsIgnoreCase("id")
					&& !columns.get(i).equalsIgnoreCase("is_delete")
					&& !columns.get(i).equalsIgnoreCase("add_time")
					&& !columns.get(i).equalsIgnoreCase("edit_time")
					&& !columns.get(i).equalsIgnoreCase("add_user")
					&& !columns.get(i).equalsIgnoreCase("edit_user")) {

				bw.write("  //" + comments.get(i));
				bw.newLine();
				bw.write("  " + record + "." + processField(columns.get(i))
						+ "=$.trim($(\"#" + processField(columns.get(i))
						+ "\").val()); ");
				bw.newLine();
			}
		}
		bw.write("  return " + record + "; ");
		bw.newLine();
		bw.write("}\n\n");

		bw.write("function doQuery(){\n  $(\"#deliveryGrid\").datagrid('load',getQueryParam());\n}\n\n");
		bw.write("function exportExcel(){\n");
		bw.write("  $.messager.confirm('提示信息','您确定要导出到Excel?',function(r){\n");
		bw.write("      if(r){\n");
		bw.write("           var columns = $(\"#deliveryGrid\").datagrid(\"options\").columns[0];\n");
		bw.write("           var stringTitle = \"\";\n");
		bw.write("           var stringFields = \"\";\n");
		bw.write("           for(var i = 0; i < columns.length; i++){\n");
		bw.write("              stringTitle = stringTitle + columns[i].title + \",\";\n");
		bw.write("              stringFields = stringFields + columns[i].field + \",\";\n");
		bw.write("           }\n");
		bw.write("           var queryParams = $(\"#deliveryGrid\").datagrid(\"options\").queryParams;\n");
		bw.write("           queryParams.gridTitle = stringTitle;\n");
		bw.write("           queryParams.gridField = stringFields;\n");
		bw.write("           queryParams.moduleName = \"信息查询.xls\";\n");
		bw.write("           var formObj = $(\"<form></form>\").attr(\"method\",\"post\").attr(\"action\",appPath+\"/page/"
				+ record + "/exportExcel\");\n");
		bw.write("           formObj.append(\"<input type='text' name='gridTitle'>\")\n");
		bw.write("            .append(\"<input type='text' name='gridField'>\")\n");
		bw.write("            .append(\"<input type='text' name='moduleName'>\")\n");

		// if(needProMap!=null)
		// {
		// List<Object>
		// fieldNameList=Arrays.asList(needProMap.keySet().toArray());
		// for(int i=0;i<fieldNameList.size();i++)
		// {
		// if(!"id".equals(StringUtils.getHumpByUnderline(fieldNameList.get(i).toString(),
		// false)))
		// {
		// sb.append("           ").append(".append(\"<input type='text' name='").append(StringUtils.getHumpByUnderline(fieldNameList.get(i).toString(),
		// false)).append("'>\")\n");
		// }
		// }
		// }

		for (int i = 0; i < size; i++) {
			if (!columns.get(i).equalsIgnoreCase("id")
					&& !columns.get(i).equalsIgnoreCase("is_delete")
					&& !columns.get(i).equalsIgnoreCase("add_time")
					&& !columns.get(i).equalsIgnoreCase("edit_time")
					&& !columns.get(i).equalsIgnoreCase("add_user")
					&& !columns.get(i).equalsIgnoreCase("edit_user")) {
				bw.newLine();
				bw.write("        .append(\"<input type='text' name='"
						+ processField(columns.get(i)) + "'>\") ");
			}
		}
		bw.write("           .css('display','none').appendTo(\"body\");\n");
		bw.write("           formObj.form(\"load\",queryParams);\n");
		bw.write("           formObj.submit();\n");
		bw.write("           formObj.remove();\n");
		bw.write("      }\n");
		bw.write("   });\n");
		bw.write(" }\n\n");
		bw.write("function deletes(){\n");
		bw.write("  var selections = $(\"#deliveryGrid\").datagrid('getSelections');\n");
		bw.write("  if(selections == null || selections == ''){\n");
		bw.write("    $.messager.alert('提示信息','请选操作的记录','');\n");
		bw.write("    return;\n");
		bw.write("  }else{\n");
		bw.write("    var ids = '';\n");
		bw.write("    for(var i=0;i<selections.length;i++){\n");
		bw.write("       ids += selections[i].id+',';\n");
		bw.write("    }\n");
		bw.write("    $.messager.confirm('提示信息',\"您确定批量删除记录？\",function(r){\n");
		bw.write("       if(r){\n");
		bw.write("            $.post(\n");
		bw.write("                   appPath+\"/page/" + record
				+ "/deleteIdsLogic\", \n");
		bw.write("                   {\"ids\":ids}, \n");
		bw.write("                   function(data){\n");
		bw.write("                        if(data=='ok'){");
		bw.write("                   			$.messager.alert('提示信息','删除成功','');doQuery();  \n");
		bw.write("                   	  }else{\n");
		bw.write("                        		$.messager.alert('提示信息','删除失败','');doQuery();  \n");
		bw.write("                   	  }");
		bw.write("                   });\n");
		bw.write("       }\n");
		bw.write("    });\n");
		bw.write("  }\n");
		bw.write("}\n\n");

		bw.write("function showWin(id){\n");
		bw.write("  if(id==-1)\n");
		bw.write("    {if(getSelect()!=undefined){id=getSelect().id;}else{return;}}\n");
		bw.write("  $(\"#idHidden\").val(\"\");\n");
		// if(needProMap!=null)
		// {
		// List<Object>
		// fieldNameList=Arrays.asList(needProMap.keySet().toArray());
		// for(int i=0;i<fieldNameList.size();i++)
		// {
		// if(!"id".equals(StringUtils.getHumpByUnderline(fieldNameList.get(i).toString(),
		// false)))
		// {
		// sb.append("  $(\"#add").append(StringUtils.getHumpByUnderline(fieldNameList.get(i).toString(),
		// false)).append("\").val(\"\");\n");
		// }
		// }
		// }

		for (int i = 0; i < size; i++) {
			if (!columns.get(i).equalsIgnoreCase("id")
					&& !columns.get(i).equalsIgnoreCase("is_delete")
					&& !columns.get(i).equalsIgnoreCase("add_time")
					&& !columns.get(i).equalsIgnoreCase("edit_time")
					&& !columns.get(i).equalsIgnoreCase("add_user")
					&& !columns.get(i).equalsIgnoreCase("edit_user")) {
				bw.newLine();
				bw.write("   $(\"#add" + processField(columns.get(i))
						+ "\").val(\"\"); ");
			}
		}
		bw.newLine();
		bw.write("  var iconStr=\"icon-add\";\n");
		bw.write("  if(id!=null){\n");
		bw.write("     iconStr=\"icon-edit\";\n");
		bw.write("     $.post(\n");
		bw.write("        appPath+\"/page/" + record + "/getBean/\"+id, \n");
		bw.write("        {}, \n");
		bw.write("        function(da1){\n");
		bw.write("        var data = $.parseJSON(da1);");
		bw.newLine();
		bw.write("           $(\"#idHidden\").val(data.id);");
		// if(needProMap!=null)
		// {
		// List<Object>
		// fieldNameList=Arrays.asList(needProMap.keySet().toArray());
		// for(int i=0;i<fieldNameList.size();i++)
		// {
		// if(!"id".equals(StringUtils.getHumpByUnderline(fieldNameList.get(i).toString(),
		// false)))
		// {
		// sb.append("           $(\"#add").append(StringUtils.getHumpByUnderline(fieldNameList.get(i).toString(),
		// false)).append("\").val(data.").append(StringUtils.getHumpByUnderline(fieldNameList.get(i).toString(),
		// false)).append(");\n");
		// }
		// }
		// }

		for (int i = 0; i < size; i++) {
			if (!columns.get(i).equalsIgnoreCase("id")
					&& !columns.get(i).equalsIgnoreCase("is_delete")
					&& !columns.get(i).equalsIgnoreCase("add_time")
					&& !columns.get(i).equalsIgnoreCase("edit_time")
					&& !columns.get(i).equalsIgnoreCase("add_user")
					&& !columns.get(i).equalsIgnoreCase("edit_user")) {
				bw.newLine();
				bw.write("           $(\"#add" + processField(columns.get(i))
						+ "\").val(data." + processField(columns.get(i))
						+ "); ");
			}
		}

		bw.write("        },\"json\");\n");
		bw.write("  }\n");

		bw.write("  $('#opreateHtml').window({\n");
		bw.write("    title:'编辑',\n");
		bw.write("    iconCls:iconStr,\n");
		bw.write("    width:600,\n");
		bw.write("    height:450,\n");
		bw.write("    left:200,\n");
		bw.write("    modal: true,\n");
		bw.write("    shadow: true,\n");
		bw.write("    collapsible:false,\n");
		bw.write("    minimizable:false,\n");
		bw.write("    maximizable:false\n");
		bw.write("  });\n");
		bw.write("  $('#opreateHtml').window('move',{top:0});\n");
		bw.write("  $('#opreateHtml').window('open');\n");
		bw.write("}\n\n");
		bw.write("function closeWin(){\n");
		bw.write("  $('#opreateHtml').window('close');\n");
		bw.write("}\n\n");
		bw.write("function save(){\n");
		bw.write("     var " + record + "=new Object();\n");
		bw.write("     " + record + ".id=$(\"#idHidden\").val();\n");
		for (int i = 0; i < size; i++) {
			if (!columns.get(i).equalsIgnoreCase("id")
					&& !columns.get(i).equalsIgnoreCase("is_delete")
					&& !columns.get(i).equalsIgnoreCase("add_time")
					&& !columns.get(i).equalsIgnoreCase("edit_time")
					&& !columns.get(i).equalsIgnoreCase("add_user")
					&& !columns.get(i).equalsIgnoreCase("edit_user")) {
				bw.write("     " + record + "." + processField(columns.get(i))
						+ "=$(\"#add" + processField(columns.get(i))
						+ "\").val();\n");
			}
		}

		bw.write("    doAjax({\n");
		bw.write("      url:appPath+'/page/" + record + "/saveOrUpdate',\n");
		bw.write("      type:'post',\n");
		bw.write("      data:" + record + ",\n");
		bw.write("      success:function(data){\n");
		bw.write("           if(data=='ok'){\n");
		bw.write("               $.messager.alert('提示信息','保存成功','info');	\n");
		bw.write("               doQuery();\n");
		bw.write("               $('#opreateHtml').window('close');\n");
		bw.write("           }else{\n");
		bw.write("		          $.messager.alert('提示信息',data,'error');  \n");
		bw.write("           }\n");
		bw.write("      }\n");
		bw.write("  });\n");
		bw.write("}\n\n");

		bw.write("function getSelect()  { ");
		bw.write("   var selections = $(\"#deliveryGrid\").datagrid('getSelections');\n");
		bw.write("   if(selections == null || selections == ''){\n");
		bw.write("     $.messager.alert('提示信息','请选操作的记录','');\n");
		bw.write("     return;\n");
		bw.write("   }else if(selections.length>1){\n");
		bw.write("     $.messager.alert('提示信息','请选操作的记录只能为一项','');\n");
		bw.write("     return;\n");
		bw.write("   }else{\n");
		bw.write("     return selections[0];\n");
		bw.write("   }\n");
		bw.write("}\n");

		// ----------定义Mapper中的方法End----------
		bw.newLine();
		bw.flush();
		bw.close();
	}

	/**
	 * 获取所有的数据库表注释
	 *
	 * @return
	 * @throws SQLException
	 */
	private Map<String, String> getTableComment() throws SQLException {
		Map<String, String> maps = new HashMap<String, String>();
		PreparedStatement pstate = conn.prepareStatement("show table status");
		ResultSet results = pstate.executeQuery();
		while (results.next()) {
			String tableName = results.getString("NAME");
			String comment = results.getString("COMMENT");
			maps.put(tableName, comment);
		}
		return maps;
	}

	public  void generate() throws ClassNotFoundException, SQLException,
			IOException {
		init();
		String prefix = "show full fields from ";
		List<String> columns = null;
		List<String> types = null;
		List<String> comments = null;
		PreparedStatement pstate = null;
		List<String> tables = getTables();
		Map<String, String> tableComments = getTableComment();
		for (String table : tables) {
			columns = new ArrayList<String>();
			types = new ArrayList<String>();
			comments = new ArrayList<String>();
			pstate = conn.prepareStatement(prefix + table);
			ResultSet results = pstate.executeQuery();
			while (results.next()) {
				columns.add(results.getString("FIELD"));
				types.add(results.getString("TYPE"));
				comments.add(results.getString("COMMENT"));
			}
			tableName = table;
			processTable(table);
			// this.outputBaseBean();
			String tableComment = tableComments.get(tableName);
			buildEntityBean(columns, types, comments, tableComment);
			buildMapperNew();
			buildMapperXml(columns, types, comments);
			// 基础的系统生成的 service
			buildBaseService();
			buildBaseServiceImp();
			// 需要修改的 service
			buildService();
			buildServiceImp();

			buildTestCase(columns, types, comments);

			buildJSP(columns, types, comments);
			buildJS(columns, types, comments);
			buildAction();

			modelNames.add(modelName);
		}

		buildHessionXml();
		conn.close();
	}

	private BufferedWriter funGetSet(BufferedWriter bw, List<String> columns,
			List<String> types, List<String> comments) throws IOException {
		int size = columns.size();
		for (int i = 0; i < size; i++) {
			String tempType = processType(types.get(i));
			String _tempField = processField(columns.get(i));
			String tempField = _tempField.substring(0, 1).toUpperCase()
					+ _tempField.substring(1);
			bw.newLine();
			bw.write("\t          /**" + comments.get(i) + "**/");
			bw.newLine();
			bw.write("\t          obj.set" + tempField + "();");
			bw.newLine();
		}
		return bw;
	}

	public static void main(String[] args) {
		try {
			new EntityUtil().generate();
			// 自动打开生成文件的目录
			// Runtime.getRuntime().exec("cmd /c start explorer D:\\");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}