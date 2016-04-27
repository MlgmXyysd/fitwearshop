package com.org.szty.mybatis.plugin;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.List;

public class MapperXmlUtil {

	public static final String xml_path = CreateStart.PATH + "dao";
	public static final String mapper_package = CreateStart.PACKAGE + ".dao";

	/**
	 * 构建实体类映射XML文件
	 *
	 * @param columns
	 * @param types
	 * @param comments
	 * @throws IOException
	 */
	public static void buildMapperXml(List<String> columns, List<String> types, List<String> comments)
			throws IOException {

		File folder = new File(xml_path);
		if (!folder.exists()) {
			folder.mkdirs();
		}

		File mapperXmlFile = new File(xml_path, TabClassUtil.mapperName + ".xml");
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(mapperXmlFile)));
		// 文件头
		bw = getHeadXMl(bw);
		// 实体map映射
		int size = columns.size();
		bw = getJavaMapXMl(size, columns, comments, bw);
		// 通用结果列
		bw = getColumnList(size, columns, bw);
		// where 条件
		bw = getWhereSql(size, columns, bw);
		// 分页条件查询
		bw = getLimitSql(bw);
		//新增
		bw = getSqlAdd(bw, columns, types);
		bw = getSqlAddSelective(bw, columns, types);
		bw = getSqlAddBatch(bw, columns, types);
		//修改
		//bw = getSqlUpdate(bw, columns, types);
		bw = getSqlUpdateSelective(bw, columns, types);
		//删除
        //		bw = get
		//查询
		bw = getSqlQueryByPrimaryKey(bw, columns, types);
		bw = getSqlQueryList(bw, columns, types);
		bw = getSqlQueryPageCount(bw, columns, types);
		bw = getSqlQueryPageList(bw, columns, types);
		bw.write("</mapper>");
		bw.flush();
		bw.close();
	}

	/**
	 * 分页查询条件
	 * getLimitSql:(这里用一句话描述这个方法的作用). <br/>
	 * TODO(这里描述这个方法适用条件 – 可选).<br/>
	 * TODO(这里描述这个方法的执行流程 – 可选).<br/>
	 * TODO(这里描述这个方法的使用方法 – 可选).<br/>
	 * TODO(这里描述这个方法的注意事项 – 可选).<br/>
	 *
	 * @author mao.ru
	 * @param bw
	 * @return
	 * @throws IOException
	 * @since JDK 1.7
	 */
	public static BufferedWriter getLimitSql(BufferedWriter bw) throws IOException {

		// where 分页条件生成
		bw.write("\t<sql id=\"limitsql\">");
		bw.newLine();
		bw.write("\t\t\t<if test=\"limitStart != null and pageSize != null\"" + ">");
		bw.newLine();
		bw.write("\t\t\t\t <![CDATA[  ");
		bw.newLine();
		bw.write("\t\t\t\t order by id desc limit #{limitStart} , #{pageSize} ");
		bw.newLine();
		bw.write("\t\t\t\t ]]>  ");
		bw.newLine();
		bw.write("\t\t\t</if>");
		bw.newLine();
		bw.write("\t</sql>");
		return bw;
	}

	/**
	 * where条件拼接
	 * 
	 * getWhereSql:(这里用一句话描述这个方法的作用). <br/>
	 * 
	 * @author mao.ru
	 * @since JDK 1.7
	 */
	public static BufferedWriter getWhereSql(int size, List<String> columns, BufferedWriter bw) throws IOException {
		// where 条件生成
		bw.write("\t<!-- 查询条件-->");
		bw.newLine();
		bw.write("\t<sql id=\"wheresql\">");
		bw.newLine();
		bw.write("\t<where>");
		bw.newLine();
		String tepfile = null;
		for (int i = 0; i < size; i++) {
			if (CreateStart.ISFILEDM) {
				tepfile = TabClassUtil.processField(columns.get(i));
			} else {
				tepfile = columns.get(i).toLowerCase();
			}
			bw.write("\t\t\t<if test=\"" + tepfile + " != null and " + tepfile + " != '' \">");
			bw.newLine();
			bw.write("\t\t\t\t and " + columns.get(i).toLowerCase() + " = #{" + tepfile + "}");
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
		return bw;

	}

	/**
	 * 文件头 getHeadXMl:(这里用一句话描述这个方法的作用). <br/>
	 * 
	 * @author mao.ru
	 * @since JDK 1.7
	 */
	public static BufferedWriter getHeadXMl(BufferedWriter bw) throws IOException {

		bw.write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		bw.newLine();
		bw.write("<!DOCTYPE mapper PUBLIC \"-//mybatis.org//DTD Mapper 3.0//EN\" ");
		bw.newLine();
		bw.write("    \"http://mybatis.org/dtd/mybatis-3-mapper.dtd\">");
		bw.newLine();
		bw.write("<mapper namespace=\"" + mapper_package + "." + TabClassUtil.mapperName + "\">");
		bw.newLine();
		bw.newLine();

		return bw;

	}

	/**
	 * 实体映射 getJavaMapXMl:(这里用一句话描述这个方法的作用). <br/>
	 * 
	 * @author mao.ru
	 * @since JDK 1.7
	 */
	public static BufferedWriter getJavaMapXMl(int size, List<String> columns, List<String> comments, BufferedWriter bw)
			throws IOException {
		// resultMap 名称
		String mapname = OtherUtil.processResultMapId(TabClassUtil.modelName) + "Map";
		String typeName = EntityBeanUtil.bean_package + "." + OtherUtil.processResultMapId(TabClassUtil.modelName);
		bw.write("\t<!--实体映射-->");
		bw.newLine();
		bw.write("\t<resultMap id=\"" + mapname + "\" type=\"" + typeName + "\">");
		bw.newLine();
		for (int i = 0; i < size; i++) {
			bw.write("\t\t<!--" + comments.get(i) + "-->");
			bw.newLine();
			if (CreateStart.ISFILEDM) {
				bw.write("\t\t<result column=\"" + columns.get(i).toLowerCase() + "\"  property=\""
						+ TabClassUtil.processField(columns.get(i)) + "\" />");
			} else {
				bw.write("\t\t<result column=\"" + columns.get(i).toLowerCase() + "\"  property=\"" + columns.get(i) + "\" />");
			}
			bw.newLine();
		}
		bw.write("\t</resultMap>");
		bw.newLine();
		bw.newLine();
		bw.newLine();
		return bw;

	}

	/**
	 * 通用查询结果列 getColumnList:(这里用一句话描述这个方法的作用). <br/>
	 * 
	 * @author mao.ru
	 * @since JDK 1.7
	 */
	public static BufferedWriter getColumnList(int size, List<String> columns, BufferedWriter bw) throws IOException {
		// resultMap 名称
		bw.write("\t<!-- 通用查询结果列-->");
		bw.newLine();
		bw.write("\t<sql id=\"columnList\">");
		bw.newLine();
		for (int i = 0; i < size; i++) {
			bw.write("\t" + columns.get(i).toLowerCase());
			if (i != size - 1) {
				bw.write(",");
			}
		}
		bw.newLine();
		bw.write("\t</sql>");
		bw.newLine();
		bw.newLine();
		bw.newLine();
		return bw;

	}

	/**
	 * 
	 * 
	 * getSqlAdd:(新增). <br/>
	 *
	 * @author mao.ru
	 * @param bw
	 * @param columns
	 * @param types
	 * @return
	 * @throws IOException
	 * @since JDK 1.7
	 */
	public static BufferedWriter getSqlAdd(BufferedWriter bw, List<String> columns, List<String> types)
			throws IOException {
		int size = columns.size();
		// 添加insert方法
		bw.write("\t<!-- 添加 -->");
		bw.newLine();
		bw.write("\t<insert id=\"save\" parameterType=\"" + TabClassUtil.modelName + "\">");
		bw.newLine();
		bw.write("\t\t <selectKey resultType=\"long\" keyProperty=\"id\">");
		bw.newLine();
		bw.write("\t\t SELECT LAST_INSERT_ID()");
		bw.newLine();
		bw.write("\t\t </selectKey>");
		bw.newLine();
		bw.write("\t\t INSERT INTO " + TabClassUtil.tableName);
		bw.newLine();
		bw.write(" \t\t(");
		for (int i = 0; i < size; i++) {
			if (!columns.get(i).equalsIgnoreCase(CreateStart.primary_key)) {
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
			String tepfile;
			if (CreateStart.ISFILEDM) {
				tepfile = TabClassUtil.processField(columns.get(i));
			} else {
				tepfile = columns.get(i).toLowerCase();
			}
			if (!columns.get(i).equalsIgnoreCase(CreateStart.primary_key)) {
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
		return bw;
	}

	/**
	 * 
	 * getSqlAddSelective:(添加 --匹配有值的字段). <br/>
	 *
	 * @author mao.ru
	 * @param bw
	 * @param columns
	 * @param types
	 * @return
	 * @throws IOException
	 * @since JDK 1.7
	 */
	public static BufferedWriter getSqlAddSelective(BufferedWriter bw, List<String> columns, List<String> types)
			throws IOException {
		int size = columns.size();
		bw.write("\t<!-- 添加 （匹配有值的字段）-->");
		bw.newLine();
		bw.write("\t<insert id=\"insertSelective\" parameterType=\""
				+ OtherUtil.processResultMapId(TabClassUtil.beanName) + "\">");
		bw.newLine();
		bw.write("\t\t INSERT INTO " + TabClassUtil.tableName);
		bw.newLine();
		bw.write("\t\t <trim prefix=\"(\" suffix=\")\" suffixOverrides=\",\" >");
		bw.newLine();

		
		for (int i = 0; i < size; i++) {
			String tempField = null;
			if (CreateStart.ISFILEDM) {
				tempField = TabClassUtil.processField(columns.get(i));
			} else {
				tempField = columns.get(i).toLowerCase();
			}
			bw.write("\t\t\t<if test=\"" + tempField + " != null\">");
			bw.newLine();
			bw.write("\t\t\t\t " + columns.get(i).toLowerCase() + ",");
			bw.newLine();
			bw.write("\t\t\t</if>");
			bw.newLine();
		}

		bw.newLine();
		bw.write("\t\t </trim>");
		bw.newLine();

		bw.write("\t\t <trim prefix=\"values (\" suffix=\")\" suffixOverrides=\",\" >");
		bw.newLine();

		
		for (int i = 0; i < size; i++) {
			String tempField = null;
			if (CreateStart.ISFILEDM) {
				tempField = TabClassUtil.processField(columns.get(i));
			} else {
				tempField = columns.get(i).toLowerCase();
			}
			bw.write("\t\t\t<if test=\"" + tempField + "!=null and " + tempField + "!='' \">");
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
		return bw;
	}

	/**
	 * 
	 * getSqlAddBatch:(批量添加). <br/>
	 *
	 * @author mao.ru
	 * @param bw
	 * @param columns
	 * @param types
	 * @return
	 * @throws IOException
	 * @since JDK 1.7
	 */
	public static BufferedWriter getSqlAddBatch(BufferedWriter bw, List<String> columns, List<String> types)
			throws IOException {
		int size = columns.size();
		// --------------- saveBatch方法（匹配有值的字段）
		// 添加insert方法
		bw.write("\t<!-- 添加 -->");
		bw.newLine();
		bw.write("\t<insert id=\"saveBatch" + TabClassUtil.beanName + "\" parameterType=\"java.util.List\">");
		bw.newLine();
		bw.write("\t\t INSERT INTO " + TabClassUtil.tableName);
		bw.newLine();
		bw.write(" \t\t(");
		for (int i = 0; i < size; i++) {
			if (!columns.get(i).equalsIgnoreCase(CreateStart.primary_key)) {
				bw.write(columns.get(i).toLowerCase());
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
			if (!columns.get(i).equalsIgnoreCase(CreateStart.primary_key)) {
				bw.write("#{item." + TabClassUtil.processField(columns.get(i)) + "}");
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

		return bw;
	}

//	public static BufferedWriter getSqlUpdate(BufferedWriter bw, List<String> columns, List<String> types)
//			throws IOException {
//		int size = columns.size();
//		// 修改update方法
//		bw.write("\t<!-- 修 改-->");
//		bw.newLine();
//		bw.write("\t<update id=\"updateByPrimaryKeySelective\" parameterType=\""
//				+ OtherUtil.processResultMapId(TabClassUtil.modelName) + "\">");
//		bw.newLine();
//		bw.write("\t\t UPDATE " + TabClassUtil.tableName);
//		bw.newLine();
//		bw.write(" \t\t <set> ");
//		bw.newLine();
//
//		
//		for (int i = 0; i < size; i++) {
//			String tempField = null;
//			if (CreateStart.ISFILEDM) {
//				tempField = TabClassUtil.processField(columns.get(i));
//			} else {
//				tempField = columns.get(i).toLowerCase();
//			}
//			bw.write("\t\t\t<if test=\"" + tempField + "!=null and " + tempField + "!='' \">");
//			bw.newLine();
//			bw.write("\t\t\t\t #{" + tempField + "},");
//			bw.newLine();
//			bw.write("\t\t\t</if>");
//			bw.newLine();
//		}
//		bw.newLine();
//		bw.write(" \t\t </set>");
//		bw.newLine();
//
//		if (CreateStart.ISFILEDM) {
//			bw.write("\t\t WHERE " + columns.get(0).toLowerCase() + " = #{" + TabClassUtil.processField(columns.get(0)) + "}");
//		} else {
//			bw.write("\t\t WHERE " + columns.get(0).toLowerCase() + " = #{" + columns.get(0).toLowerCase() + "}");
//		}
//
//		bw.newLine();
//		bw.write("\t</update>");
//		bw.newLine();
//		bw.newLine();
//		// update方法完毕
//		return bw;
//
//	}

	public static BufferedWriter getSqlUpdateSelective(BufferedWriter bw, List<String> columns, List<String> types)
			throws IOException {

		// ----- 修改（匹配有值的字段）
		int size = columns.size();
		bw.write("\t<!-- 修 改-->");
		bw.newLine();
		bw.write("\t<update id=\"updateByPrimaryKey\" parameterType=\""
				+ OtherUtil.processResultMapId(TabClassUtil.beanName) + "\">");
		bw.newLine();
		bw.write("\t\t UPDATE " + TabClassUtil.tableName);
		bw.newLine();
		bw.write("\t\t SET ");

		bw.newLine();
		String tempField = null;
		for (int i = 1; i < size; i++) {
			if (CreateStart.ISFILEDM) {
				tempField = TabClassUtil.processField(columns.get(i));
			} else {
				tempField = columns.get(i);
			}
			bw.write("\t\t\t<if test=\"" + tempField + " != null\">");
			bw.newLine();
			bw.write("\t\t\t\t " + columns.get(i).toLowerCase() + " = #{" + tempField + "},");
			bw.newLine();
			bw.write("\t\t\t</if>");
			bw.newLine();
		}
		if (CreateStart.ISFILEDM) {
			bw.write("\t\t WHERE " + columns.get(0).toLowerCase() + " = #{" + TabClassUtil.processField(columns.get(0)) + "}");
		} else {
			bw.write("\t\t WHERE " + columns.get(0).toLowerCase() + " = #{" + columns.get(0).toLowerCase() + "}");
		}
		bw.newLine();
		bw.write("\t</update>");
		bw.newLine();

		// ----- 修改（匹配有值的字段）

		return bw;
	}

	public static BufferedWriter getSqlQueryByPrimaryKey(BufferedWriter bw, List<String> columns, List<String> types)
			throws IOException {
		String mapname = OtherUtil.processResultMapId(TabClassUtil.modelName) + "Map";
		// 查询（根据主键ID查询）
		bw.write("\t<!-- 查询（根据主键ID查询） -->");
		bw.newLine();
		bw.write("\t<select id=\"selectByPrimaryKey\"  resultMap=\"" + mapname + "\" parameterType=\"java.lang."
				+ OtherUtil.processType(types.get(0)) + "\">");
		bw.newLine();
		bw.write("\t\t SELECT");
		bw.newLine();
		bw.write("\t\t <include refid=\"Base_Column_List\" />");
		bw.newLine();
		bw.write("\t\t FROM " + TabClassUtil.tableName);
		bw.newLine();
		if (CreateStart.ISFILEDM) {
			bw.write("\t\t WHERE " + columns.get(0).toLowerCase() + " = #{" + TabClassUtil.processField(columns.get(0)) + "}");
		} else {
			bw.write("\t\t WHERE " + columns.get(0).toLowerCase() + " = #{" + columns.get(0).toLowerCase() + "}");
		}
		bw.newLine();
		bw.write("\t</select>");
		bw.newLine();
		bw.newLine();

		return bw;
	}

	public static BufferedWriter getSqlQueryList(BufferedWriter bw, List<String> columns, List<String> types)
			throws IOException {
		String mapname = OtherUtil.processResultMapId(TabClassUtil.modelName) + "Map";
		String typeName = EntityBeanUtil.bean_package + "." + OtherUtil.processResultMapId(TabClassUtil.modelName);
		// 查询list
		bw.write("\t<!-- 查询  List 查询 -->");
		bw.newLine();
		bw.write("\t<select id=\"queryList\" resultMap=\"" + mapname + "\" parameterType=\"" + typeName + "\">");
		bw.newLine();
		bw.write("\t\t SELECT");
		bw.newLine();
		bw.write("\t\t <include refid=\"columnList\" />");
		bw.newLine();
		bw.write("\t\t FROM " + TabClassUtil.tableName);
		bw.newLine();
		bw.write("\t\t  ");
		bw.newLine();
		bw.write("\t\t <include refid=\"wheresql\" />");
		bw.newLine();
		bw.write("\t</select>");
		bw.newLine();
		bw.newLine();
		return bw;
	}

	public static BufferedWriter getSqlQueryPageCount(BufferedWriter bw, List<String> columns, List<String> types)
			throws IOException {
		String typeName = EntityBeanUtil.bean_package + "." + OtherUtil.processResultMapId(TabClassUtil.modelName);
		// 统计
		bw.write("\t<!-- 查询 分页总数 -->");
		bw.newLine();
		bw.write("\t<select id=\"queryCount\"  resultType=\"java.lang.Integer\"  parameterType=\"" + typeName + "\">");
		bw.newLine();
		bw.write("\t\t SELECT");
		bw.newLine();
		bw.write("\t\t count(1)");
		bw.newLine();
		bw.write("\t\t FROM " + TabClassUtil.tableName);
		bw.newLine();
		bw.write("\t\t  ");
		bw.newLine();
		bw.write("\t\t <include refid=\"wheresql\" />");
		bw.newLine();
		bw.write("\t</select>");
		bw.newLine();
		return bw;
	}

	public static BufferedWriter getSqlQueryPageList(BufferedWriter bw, List<String> columns, List<String> types)
			throws IOException {
		String typeName = EntityBeanUtil.bean_package + "." + OtherUtil.processResultMapId(TabClassUtil.modelName);
		String mapname = OtherUtil.processResultMapId(TabClassUtil.modelName) + "Map";
		// 分页查询
		bw.write("\t<!-- 查询 分页查询 -->");
		bw.newLine();
		bw.write("\t<select id=\"queryPageList\" resultMap=\"" + mapname + "\"  parameterType=\""
				+ TabClassUtil.modelName + "\">");
		bw.newLine();
		bw.write("\t\t SELECT");
		bw.newLine();
		bw.write("\t\t <include refid=\"columnList\" />");
		bw.newLine();
		bw.write("\t\t FROM " + TabClassUtil.tableName);
		bw.newLine();
		bw.write("\t\t  ");
		bw.newLine();
		bw.write("\t\t <include refid=\"wheresql\" />");
		bw.newLine();
		bw.write("\t\t <include refid=\"limitsql\" />");
		bw.newLine();
		bw.write("\t</select>");
		bw.newLine();
		bw.newLine();
		return bw;
	}
}
