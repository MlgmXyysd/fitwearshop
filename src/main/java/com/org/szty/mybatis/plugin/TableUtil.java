package com.org.szty.mybatis.plugin;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 表的一些用去
 * ClassName: TableUtils <br/>
 * date: 2016年3月22日 下午4:38:20 <br/>
 * @author mao.ru
 * @version 
 * @since JDK 1.7
 */
public class TableUtil {
	
	
	public static List<String> modelNames = new ArrayList<String>();
	
	/**
	 * 获取所有的数据库表注释
	 *
	 * @return
	 * @throws SQLException
	 */
	public static Map<String, String> getTableComment() throws SQLException {
		Map<String, String> maps = new HashMap<String, String>();
		PreparedStatement pstate = MyBatisConUtil.conn.prepareStatement("show table status");
		ResultSet results = pstate.executeQuery();
		while (results.next()) {
			String tableName = results.getString("NAME");
			String comment = results.getString("COMMENT");
			maps.put(tableName, comment);
		}
		return maps;
	}
}
