<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title></title>
<%@ include file="/WEB-INF/views/include/easyui.jsp"%>
</head>
<body style="font-family: '微软雅黑'">
<div id="tb" style="padding:5px;height:auto">
	<div>
		名称: <input type="text" id="appname1" name="appname1" />
		分类: <input id="category1" name="category1"/>
		<a href="#" id="submit_search" class="easyui-linkbutton" iconCls="icon-search">查询</a>
	</div>
    <div>
    	<shiro:hasPermission name="fitshop:app:add">
    	<a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-add" onclick="add();">添加</a>
    	<span class="toolbar-item dialog-tool-separator"></span>
    	</shiro:hasPermission>
        <shiro:hasPermission name="fitshop:app:delete">
        <a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-remove" onclick="del()">删除</a>
        <span class="toolbar-item dialog-tool-separator"></span>
        </shiro:hasPermission>
        <shiro:hasPermission name="fitshop:app:update">
        <a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-edit" onclick="upd()">修改</a>
        </shiro:hasPermission>
    </div>
</div>
<table id="dg"></table>
 
<div id="dlg"></div> 
<div id="icon_dlg"></div>  

<script type="text/javascript">
var dg;
var d;
var permissionDg;
var parentPermId;
$(function(){   
	dg=$('#dg').datagrid({  
	method: "get",
    url:'${ctx}/fitshop/app/list.json', 
    fit : true,
	fitColumns : true,
	border : false,
	idField : 'id',
	iconCls: 'icon',
	animate:true, 
	rownumbers:true,
	singleSelect:true,
	striped:true,
	pagination:true,
    columns:[[    
        {field:'id',title:'id',width:20},    
        {field:'appname',title:'名称CN',width:80},
        {field:'appnameEn',title:'名称EN',width:80},
        {field:'category',title:'分类',width:120},
        {field:'logo',title:'LOGO',width:120,
        	formatter:function(value, rec){//使用formatter格式化刷子
        		arr=value.split(","); 
        		return '<img src="'+arr[0]+'" style="width:35px;height:35px;"/>';
        	}
        },
        {field:'packagename',title:'包名'}
    ]],
    toolbar:'#tb',
	});
    $('#category1').combobox({
        url:'${ctx}/fitshop/category/all.json',
        valueField:'id',
        textField:'catename',
        panelHeight:"auto",
        editable: false,
        onLoadSuccess: function () { //数据加载完毕事件
            var data = $('#category1').combobox('getData');
            if (data.length > 0) {
                $("#category1").combobox('select', data[0].id);
            }
        }
    });
    $("#submit_search").click(function () {
        $('#dg').datagrid({ queryParams: {
        	appname:$("#appname1").val(),
        	category:$("#category1").combobox("getValue")
        	}});   //点击搜索
    });
});


//弹窗增加
function add() {
	//父级权限
	var row = dg.treegrid('getSelected');
	if(row){
		parentPermId=row.id;
	}
	d=$('#dlg').dialog({    
	    title: '添加分类',    
	    width: 650,    
	    height: 480,    
	    closed: false,    
	    cache: false,
	    maximizable:true,
	    resizable:true,
	    href:'${ctx}/fitshop/app/create',
	    modal: true,
	    buttons:[{
			text:'确认',
			handler:function(){
				$("#mainform").submit();
			}
		},{
			text:'取消',
			handler:function(){
					d.panel('close');
				}
		}]
	});
}
//修改
function upd(){
	var row = dg.treegrid('getSelected');
	if(rowIsNull(row)) return;
	//父级权限
	parentPermId=row.pid;
	d=$("#dlg").dialog({   
	    title: '修改分类',    
	    width: 650,    
	    height: 480,    
	    href:'${ctx}/fitshop/app/update/'+row.id,
	    maximizable:true,
	    modal:true,
	    buttons:[{
			text:'确认',
			handler:function(){
				$("#mainform").submit();
			}
		},{
			text:'取消',
			handler:function(){
					d.panel('close');
				}
		}]
	});

}

//删除
function del(){
	var row = dg.treegrid('getSelected');
	if(rowIsNull(row)) return;
	parent.$.messager.confirm('提示', '删除后无法恢复您确定要删除？', function(data){
		if (data){
			$.ajax({
				type:'get',
				url:"${ctx}/fitshop/app/delete/"+row.id,
				success: function(data){
					if(successTip(data,dg))
			    		dg.treegrid('reload');
				}
			});
			//dg.datagrid('reload'); //grid移除一行,不需要再刷新
		} 
	});

}
var nowIcon;
var icon_dlg;
</script>
</body>
</html>