<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title></title>
<%@ include file="/WEB-INF/views/include/easyui.jsp"%>
</head>
<body>
<div>
	<form id="mainform" action="${ctx}/fitshop/category/${action}" method="post">
	<table  class="formTable">
		<tr>
			<td>类别名称：</td>
			<td>
				<input type="hidden" name="id" value="${scCategory.id }"/>
				<input type="hidden" name="type" value="F"/>
				<input id="catename" name="catename" type="text" value="${scCategory.catename }" class="easyui-validatebox" data-options="width: 180,required:'required',validType:'length[2,20]'"/>
			</td>
		</tr>
	</table>
	</form>
</div> 
<script type="text/javascript">
//父级权限
var action="${action}";
if(action=='create'){
	$('#pid').val(parentPermId);
}else if(action=='update'){
	$('#pid').val(parentPermId);
}

$('#mainform').form({    
    onSubmit: function(){    
    	var isValid = $(this).form('validate');
		return isValid;	// 返回false终止表单提交
    },    
    success:function(data){   
    	if(successTip(data,dg,d))
    		dg.treegrid('reload');
    }    
});   
</script>
</body>
</html>