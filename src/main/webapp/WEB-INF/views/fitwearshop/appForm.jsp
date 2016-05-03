<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title></title>
<%@ include file="/WEB-INF/views/include/easyui.jsp"%>
</head>
<body>
	<div>
		<form id="mainform" action="${ctx}/fitshop/app/${action}"
			method="post">
			<table class="formTable">
				<tr >
					<td><strong>*应用名称</strong></td>
					<td>
					<input type="hidden" name="id" value="${fitwearApp.id }"/>
				    <input type="hidden" name="type" value="F"/>
					<input type="text" id="appname"
						name="appname" value="${fitwearApp.appname}"/></td>
				</tr>
				<tr >
					<td><strong>*应用名称-En</strong></td>
					<td>
					<input type="text" id="appnameEn"
						name="appnameEn" value="${fitwearApp.appnameEn}"/></td>
				</tr>
				<tr >
					<td><strong>分类</strong></td>
					<td>
					<select name="category" id="category">
							<c:forEach var="sw" items="${scCategory}" varStatus="status">
								<option value="${sw.id}">${sw.catename}(${sw.id})</option>
							</c:forEach>
					</select>
					</td>
				</tr>
				<tr>
					<td><strong>开发者</strong></td>
					<td><input type="text" id="developer"
						name="developer" /></td>
				</tr>
				<tr>
					<td><strong>开发者-En</strong></td>
					<td ><input type="text" id="developerEn"
						name="developerEn" /></td>
				</tr>
				<tr>
					<td><strong>版本名称</strong></td>
					<td ><input type="text" id="vername"
						name="vername" /></td>
				</tr>
				<tr>
					<td><strong>版本名称-En</strong></td>
					<td ><input type="text" id="vernameEn"
						name="vernameEn" /></td>
				</tr>
				<tr >
					<td><strong>包名</strong></td>
					<td ><input type="text" id="packagename"
						name="packagename" /></td>
				</tr>
				<tr>
					<td><strong>版本号</strong></td>
					<td><input type="text" id="vercode"
						name="vercode" /></td>
				</tr>
				<tr>
					<td><strong>排序</strong></td>
					<td><input type="text" id="sortorder"
						name="sortorder" value="0"/></td>
				</tr>

				<tr>
					<td><strong>一句话描述</strong></td>
					<td><input type="text" id="summary"
						name="summary" /></td>
				</tr>
				<tr>
					<td><strong>一句话描述-En</strong></td>
					<td><input type="text" id="summaryEn"
						name="summaryEn" /></td>
				</tr>
				<tr>
					<td><strong>应用介绍</strong></td>
					<td><textarea id="descript" name="descript"></textarea></td>
				</tr>
				<tr>
					<td><strong>应用介绍-En</strong></td>
					<td><textarea id="descriptEn" name="descriptEn"></textarea></td>
				</tr>
				<tr>
					<td><strong>应用图标</strong></td>
					<td><button
						onclick="document.getElementById('ddsend').value='ddlogourl';showUpLogo(this);return false;">上传应用图标</button></td>
				</tr>
				<tr>
					<td><strong>*图标地址</strong></td>
					<td><input type="text" id="logo" name="logo" onclick="showpic(this,'vlogo')" />
					</td>
				</tr>
				<tr>
					<td><strong>*图标</strong></td>
					<td id='vlogo'></td>
				</tr>
				<tr>
					<td><strong>*应用截图</strong></td>
					<td ><button onclick="document.getElementById('ddsend').value='dddetailurl';showUpLogo(this);return false;">上传截图</button>
					</td>
				</tr>
				<tr>
					<td><strong>上传详情图片地址</strong></td>
					<td ><input type="text" id="imgs"
						name="imgs" onclick="showpic(this,'vimg')" />
						<input type="hidden" id="dddetailurlsize" value="0"
						name="dddetailurlsize" /></td>
				</tr>
				<tr>
					<td><strong>*截图</strong></td>
					<td id='vimg'></td>
				</tr>
				<tr>
					<td><strong>*上传手机应用</strong></td>
					<td >
					<button onclick="document.getElementById('ddsend').value='ddmapk';showUpLogo(this);return false;">上传手机应用</button></td>
				</tr>
				<tr>
					<td><strong>手机应用地址</strong></td>
					<td><input type="text" id="ddmapk" name="ddmapk" /><input
						type="hidden" id="ddmapksize" name="ddmapksize" value="0" /></td>
				</tr>
				<tr>
					<td><strong>*上传手表应用</strong></td>
					<td><button
							onclick="document.getElementById('ddsend').value='ddfapk';showUpLogo(this);return false;">上传手表应用</button></td>
				</tr>
				<tr>
					<td><strong>手表应用地址</strong></td>
					<td><input type="text" id="ddfapk" name="ddfapk" /><input
						type="hidden" id="ddfapksize" name="ddfapksize" value="0" /></td>
				</tr>
				<c:if test="${ not empty magentList}">
					<tr>
						<td>*支持机型</td>
						<td><c:forEach var="var" items="${magentList}"
								varStatus="status">
								<input type="checkbox" name="magentlist"
									value="${var.magCode}"
									<c:if test="${fn:contains(magentValues,var.magCode)}">checked="checked"</c:if>>${var.magName}</input></c:forEach>
						</td>
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