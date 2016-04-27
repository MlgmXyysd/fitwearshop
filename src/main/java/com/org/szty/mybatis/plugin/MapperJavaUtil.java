package com.org.szty.mybatis.plugin;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;

/**
 * Mapper 生成 
 * ClassName: MapperJavaUtil <br/>
 * date: 2016年3月22日 下午5:36:44 <br/>
 *
 * @author mao.ru
 * @version
 * @since JDK 1.7
 */
public class MapperJavaUtil {

	public static final String mapper_path = CreateStart.PATH + "dao";
	public static final String mapper_package = CreateStart.PACKAGE + ".dao";
	
	/**
	 * 构建Mapper文件
	 *
	 * @throws IOException
	 */
	public static void buildMapper() throws IOException {
		File folder = new File(mapper_path);
		if (!folder.exists()) {
			folder.mkdirs();
		}
		String record = OtherUtil.processResultMapId(TabClassUtil.modelName);
		File mapperFile = new File(mapper_path, TabClassUtil.mapperName + ".java");
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(
				new FileOutputStream(mapperFile), "utf-8"));
		bw.write("package " + mapper_package + ";");
		bw.newLine();
		bw.newLine();
		bw.write("import " + EntityBeanUtil.bean_package + "." + TabClassUtil.modelName + ";");
		bw.newLine();
		bw.write("import java.util.List;");
		bw.newLine();
		bw = OtherUtil.buildClassComment(bw, TabClassUtil.mapperName + "数据库操作接口类");
		bw.newLine();
		bw.newLine();
		bw.write("public interface " + TabClassUtil.mapperName + "{");
		bw.newLine();
		bw.newLine();
		// ----------定义Mapper中的方法Begin----------

		bw = OtherUtil.buildMethodComment(bw, "添加");
		bw.newLine();
		bw.write("\t public " + "void save( " + TabClassUtil.modelName + " " + record + ");");
		bw.newLine();
		bw = OtherUtil.buildMethodComment(bw, "添加 （匹配有值的字段）");
		bw.newLine();
		bw.write("\t public " + "void saveBySelective( " + TabClassUtil.modelName + " "
				+ record + ");");
		bw.newLine();
		bw = OtherUtil.buildMethodComment(bw, "批量新增");
		bw.newLine();
		bw.write("\t public " + "void saveBatch" + TabClassUtil.modelName + "(List<"
				+ TabClassUtil.modelName + "> list);");
		bw.newLine();
//		bw = OtherUtil.buildMethodComment(bw, "修改 （匹配有值的字段）");
//		bw.newLine();
//		bw.write("\t public " + "int updateBySelective( " + TabClassUtil.modelName + " "
//				+ record + ");");
//		bw.newLine();
		bw = OtherUtil.buildMethodComment(bw, "主键ID修改 ");
		bw.newLine();
		bw.write("\t public " + "int updateByPrimaryKey( " + TabClassUtil.modelName + " "
				+ record + ");");
		bw.newLine();
		bw.newLine();
		bw = OtherUtil.buildMethodComment(bw, "查询（根据主键ID查询）");
		bw.newLine();
		bw.write("\t public " + TabClassUtil.modelName + "  selectByPrimaryKey (Long id );");
		bw.newLine();
		bw = OtherUtil.buildMethodComment(bw, "多条数据");
		bw.newLine();
		bw.write("\t public " + "List<" + TabClassUtil.modelName + ">  queryList ("
				+ TabClassUtil.modelName + " " + record + ");");
		bw.newLine();
		bw = OtherUtil.buildMethodComment(bw, "分页查询");
		bw.newLine();
		bw.write("\t public " + "List<" + TabClassUtil.modelName + ">  queryPageList("
				+ TabClassUtil.modelName + " " + record + ");");
		bw.newLine();
		bw = OtherUtil.buildMethodComment(bw, "分页查询");
		bw.newLine();
		bw.write("\t public " + "Integer  queryPageCount (" + TabClassUtil.modelName + " "
				+ record + ");");
		bw.newLine();
		// ----------定义Mapper中的方法End----------
		bw.newLine();
		bw.write("}");
		bw.flush();
		bw.close();
	}
}
