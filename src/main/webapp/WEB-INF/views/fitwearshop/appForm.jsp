<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<title></title>
<%@ include file="/WEB-INF/views/include/easyui.jsp"%>
</head>
<body>
	<div class="easyui-panel">
		<form id="mainform" action="${ctx}/fitshop/app/${action}.html" method="post" enctype="multipart/form-data" >
			<table class="formTable">
				<tr>
					<td>*应用名称</td>
					<td><input type="hidden" name="id" value="${fitwearApp.id}" />
						<input type="hidden" name="type" value="F" /> <input type="text"
						id="appname" name="appname" value="${fitwearApp.appname}"
						data-options="required:true" class="easyui-validatebox"/>
					</td>
					<td>应用名称-En</td>
					<td><input type="text" id="appnameEn" name="appnameEn"
						value="${fitwearApp.appnameEn}" class="easyui-validatebox"/></td>
				</tr>
				<tr>
					<td>分类</td>
					<td><select name="category" id="category">
							<c:forEach var="sw" items="${scCategory}" varStatus="status">
								<option value="${sw.id}">${sw.catename}(${sw.id})</option>
							</c:forEach>
					</select></td>
					<td>包名</td>
					<td><input type="text" id="packagename" name="packagename" value="${fitwearApp.packagename}" class="easyui-validatebox"  data-options="required:true" /></td>
				</tr>
				<tr>
					<td>开发者</td>
					<td><input type="text" id="developer" name="developer" value="${fitwearApp.developer}" class="easyui-validatebox"/></td>
					<td>开发者-En</td>
					<td><input type="text" id="developerEn" name="developerEn" value="${fitwearApp.developerEn}" class="easyui-validatebox" /></td>
				</tr>
				<tr>
					<td>版本名称</td>
					<td><input type="text" id="vername" name="vername" value="${fitwearApp.vername}" class="easyui-textbox" /></td>
					<td>版本名称-En</td>
					<td><input type="text" id="vernameEn" name="vernameEn" value="${fitwearApp.vernameEn}" class="easyui-textbox"/></td>
				</tr>
				<tr>
					<td>版本号</td>
					<td><input type="text" id="vercode" name="vercode" value="${fitwearApp.vercode}" data-options="required:true" class="easyui-validatebox"/></td>
					<td>排序</td>
					<td><input type="text" id="sortorder" name="sortorder" data-options="required:true"
						value="${fitwearApp.sortorder}" class="easyui-validatebox"/></td>
				</tr>
				<tr>
					<td>一句话描述</td>
					<td><input type="text" id="summary" name="summary" value="${fitwearApp.summary}" class="easyui-textbox"/></td>
					<td>一句话描述-En</td>
					<td><input type="text" id="summaryEn" name="summaryEn" value="${fitwearApp.summaryEn}" class="easyui-textbox"/></td>
				</tr>
				<tr>
					<td>应用介绍</td>
					<td><input id="descript" name="descript" value="${fitwearApp.descript}" class="easyui-validatebox" style="height:60px"/></td>
					<td>应用介绍-En</td>
					<td><input id="descriptEn" name="descriptEn" value="${fitwearApp.descriptEn}" class="easyui-validatebox" style="height:60px"/></td>
				</tr>
				<tr>
					<td>LOGO上传</td>
					<td colspan="3">
					<input type="file" name="logofile" id="logofile" />
					</td>
				</tr>
				<tr>
					<td>*LOGO地址</td>
					<td colspan="3"><input type="text" id="logo" name="logo" value="${fitwearApp.logo}"
					 style="width:300px" readonly="readonly"
					 class="easyui-textbox"/></td>
				</tr>
				<tr>
					<td>*LOGO</td>
					<td colspan="3">
					<img src="${fn:replace(fitwearApp.logo, ',', '')}" style="width:35px;height:35px;"/></td>
				</tr>
				<tr>
					<td>*应用截图上传</td>
					<td colspan="3">
					<input class="easyui-filebox" type="file"  name="cutfile" id="cutfile"/>
					</td>
				</tr>
				<tr>
					<td>截图地址</td>
					<td colspan="3">
					<input type="text" id="imgs" name="imgs" value="${fitwearApp.imgs}" 
					style="width:300px" readonly="readonly"
					class="easyui-textbox"/></td>
				</tr>
				<tr>
					<td>*截图</td>
					<td colspan="3">
						<c:forTokens items="${fitwearApp.imgs}" delims="," var="name">
							<img src="${name}" style="width:35px;height:35px;"/>
						</c:forTokens>
					</td>
				</tr>
				<tr>
					<td>*上传手机应用</td>
					<td colspan="3">
					<input name="mapkfile" type="file" id="mapkfile" />
					</td>
				</tr>
				<tr>
					<td>手机应用地址</td>
					<td colspan="3"><input type="text" id="mApk" name="mApk" value="${fitwearApp.mApk}" readonly="readonly"/>
					<input type="hidden" id="mApkSize" name="mApkSize"  value="${fitwearApp.mApkSize}"/></td>
				</tr>
				<tr>
					<td>*上传手表应用</td>
					<td colspan="3">
					<input name="fapkfile" type="file" id="fapkfile" />
					</td>
				</tr>
				<tr>
					<td>手表应用地址</td>
					<td colspan="3"><input type="text" id="fApk" name="fApk" value="${fitwearApp.fApk}" readonly="readonly"/>
					<input type="hidden" id="fApkSize" name="fApkSize" value="${fitwearApp.fApkSize}" /></td>
				</tr>
				<c:if test="${ not empty magentList}">
					<tr>
						<td>*支持机型</td>
						<td colspan="3"><c:forEach var="var" items="${magentList}"
								varStatus="status">
								<input type="checkbox" name="magentValues" value="${var.magCode}"
									<c:if test="${fn:contains(magentValues,var.magCode)}">checked="checked"</c:if>>${var.magName}</input>
							</c:forEach></td>
					</tr>
				</c:if>
			</table>
		</form>
	</div>

	<script type="text/javascript">
		//父级权限
		var action = "${action}";
		if (action == 'create') {
			$('#pid').val(parentPermId);
		} else if (action == 'update') {
			$('#pid').val(parentPermId);
		} 
		$('#mainform').form({
			onSubmit : function() {
				var action = "${action}"
				if (action == 'create') {
					// logo
					if(($("#logofile").val()).length < 1){
						alert();
						return false
					}
					// cut
					if($("#cutfile").val().length < 1){
						return false
					}
					//fapk
					if($("#fapkfile").val().length < 1){
						return false
					}
					//mapk
					if($("#mapkfile").val().length < 1){
						return false
					}
				} else if (action == 'update') {
					// logo
					if($("#logo").val().length < 1){
						return false
					}
					// cut
					if($("#imgs").val().length < 1){
						return false
					}
					//fapk
					if($("#mApk").val().length < 1){
						return false
					}
					//mapk
					if($("#fApk").val().length < 1){
						return false
					}
				}
				if($("[name='magentValues'][checked]").val().lenth<1){
					return false;
				}
				var isValid = $(this).form('validate');
				return isValid; // 返回false终止表单提交
			},
			success : function(data) {
				if (successTip(data, dg, d))
					dg.treegrid('reload');
			}
		});
	</script>
</body>
</html>