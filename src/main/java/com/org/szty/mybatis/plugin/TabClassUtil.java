package com.org.szty.mybatis.plugin;

/**
 * 生成-- javabeanname=modelName
 * 生成-- beanName
 * 生成-- mapperName
 * ClassName: TableUtil <br/>
 * Function: TODO ADD FUNCTION. <br/>
 * Reason: TODO ADD REASON(可选). <br/>
 * date: 2016年3月22日 下午5:38:35 <br/>
 *
 * @author mao.ru
 * @version 
 * @since JDK 1.7
 */
public class TabClassUtil {

	public static String tableName = null;
	public static String beanName = null;
	public static String modelName = null;
	public static String mapperName = null;

	/**
	 * 数据库列定义类型为a_b_.. 模式 依据table那么 生成 TableName_Mapper
	 * 
	 * @param table
	 */
	public static void processTable(String table) {
		StringBuffer sb = new StringBuffer(table.length());
		String tableNew = table.toLowerCase();
		String[] tables = tableNew.split("_");
		String temp = null;
		for (int i = 0; i < tables.length; i++) {
			temp = tables[i].trim();
			sb.append(temp.substring(0, 1).toUpperCase()).append(temp.substring(1));
		}
		beanName = sb.toString();// 增加
		modelName = beanName;
		mapperName = beanName + "Mapper";
		tableName= tableNew;
	}
	
	
	/**
	 * 数据库列定义类型为a_b_.. 模式 依据字段类型生成Javabeam 成员变量
	 * 
	 * @param field
	 * @return
	 */
	public static String processField(String field) {
		StringBuffer sb = new StringBuffer(field.length());
		String[] fields = field.toLowerCase().split("_");
		String temp = null;
		sb.append(fields[0]);
		for (int i = 1; i < fields.length; i++) {
			temp = fields[i].trim();
			sb.append(temp.substring(0, 1).toUpperCase()).append(
					temp.substring(1));
		}
		return sb.toString();
	}
	
	
}
