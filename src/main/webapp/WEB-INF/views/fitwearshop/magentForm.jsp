<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title></title>
<%@ include file="/WEB-INF/views/include/easyui.jsp"%>
</head>
<body>
	<div>
		<form id="mainform" action="${ctx}/fitshop/magent/${action}"
			method="post">
			<table class="formTable">
				<tr>
					<td>机型编码：</td>
					<td>
					<input type="hidden" name="magId" value="${fitwearMagent.magId }" /> 
					<input type="hidden" name="type"value="F" /> 
					<input id="magCode"
						name="magCode" type="text" class="easyui-validatebox"
						value="${fitwearMagent.magCode }"
						data-options="width: 150,required:'required'" /></td>
				</tr>
				<tr>
					<td>机型名称：</td>
					<td><input id="magName" name="magName" type="text"
						class="easyui-validatebox"
						value="${fitwearMagent.magName }"
						data-options="width: 150,required:'required'" /></td>
				</tr>
				<tr>
					<td>所属厂家：</td>
					<td><input id="prudName" name="prudName" type="text"
						class="easyui-validatebox"
						value="${fitwearMagent.prudName }"
						data-options="width: 150,required:'required'" /></td>
				</tr>
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