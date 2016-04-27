package com.org.szty.mybatis.plugin;

import java.io.BufferedWriter;
import java.io.IOException;

/**
 * 一些帮助类 类型转换
 * ClassName: OtherUtil <br/>
 * Function: TODO ADD FUNCTION. <br/>
 * Reason: TODO ADD REASON(可选). <br/>
 * date: 2016年3月22日 下午5:12:33 <br/>
 *
 * @author mao.ru
 * @version 
 * @since JDK 1.7
 */
public class OtherUtil {

	/**
	 * 依据数据库字段类型生成Javabeam 数据类型
	 * 
	 * @param type
	 * @return
	 */
	public static String processType(String type) {
		
		if (type.indexOf(CreateStart.type_char) > -1) {
			return "String";
		} else if (type.indexOf(CreateStart.type_bigint) > -1) {
			return "Long";
		} else if (type.indexOf(CreateStart.type_int) > -1) {
			return "Long";
		} else if (type.indexOf(CreateStart.type_date) > -1) {
			return "String";
		} else if (type.indexOf(CreateStart.type_text) > -1) {
			return "String";
		} else if (type.indexOf(CreateStart.type_timestamp) > -1) {
			return "Date";
		} else if (type.indexOf(CreateStart.type_bit) > -1) {
			return "Boolean";
		} else if (type.indexOf(CreateStart.type_decimal) > -1) {// 计算类型
			return "BigDecimal";
		} else if (type.indexOf(CreateStart.type_blob) > -1) {
			return "byte[]";
		}
		return null;
	}
	
	/**
	 * 将实体类名首字母改为小写
	 *
	 * @param beanName
	 * @return
	 */
	public static String processResultMapId(String beanName) {
		return beanName;
		//return beanName.substring(0, 1).toLowerCase() + beanName.substring(1);
	}

	/**
	 * 构建类上面的注释
	 *
	 * @param bw
	 * @param text
	 * @return
	 * @throws IOException
	 */
	public static  BufferedWriter buildClassComment(BufferedWriter bw, String text)
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
	public static  BufferedWriter buildMethodComment(BufferedWriter bw, String text)
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
}
