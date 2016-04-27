package com.org.szty.mybatis.plugin;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 生成=== 流程方法
 * ClassName: Generate <br/>
 * Function: TODO ADD FUNCTION. <br/>
 * Reason: TODO ADD REASON(可选). <br/>
 * date: 2016年3月22日 下午6:02:40 <br/>
 *
 * @author mao.ru
 * @version 
 * @since JDK 1.7
 */
public class Generate {

	public static void generate() throws ClassNotFoundException, SQLException, IOException {
		MyBatisConUtil.init();
		String prefix = "show full fields from ";
		List<String> columns = null;
		List<String> types = null;
		List<String> comments = null;
		PreparedStatement pstate = null;
		//获取要所有的表
		List<String> tables = MyBatisConUtil.getTables();
		Map<String, String> tableComments = TableUtil.getTableComment();
		for (String table : tables) {
			columns = new ArrayList<String>();
			types = new ArrayList<String>();
			comments = new ArrayList<String>();
			pstate = MyBatisConUtil.conn.prepareStatement(prefix + table);
			ResultSet results = pstate.executeQuery();
			while (results.next()) {
				columns.add(results.getString("FIELD"));
				types.add(results.getString("TYPE"));
				comments.add(results.getString("COMMENT"));
			}
			String tableName = table;
			TabClassUtil.processTable(table);
			String tableComment = tableComments.get(tableName);
			/* javaBean 生成 */
			EntityBeanUtil.buildEntityBean(columns, types, comments, tableComment);
			/* Mapper.java 生成 */
			MapperJavaUtil.buildMapper();
			/* Mapper.xml 生成 */
			MapperXmlUtil.buildMapperXml(columns, types, comments);
		}
		MyBatisConUtil.conn.close();
	}
}
