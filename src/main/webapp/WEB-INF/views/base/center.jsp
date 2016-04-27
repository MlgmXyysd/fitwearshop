<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/easyui.jsp"%>
<div data-options="region: 'center'">
	<div id="mainTabs_tools" class="tabs-tool">
		<table>
			<tr>
				<td><a id="mainTabs_jumpHome"
					class="easyui-linkbutton easyui-tooltip" title="跳转至主页选项卡"
					data-options="plain: true, iconCls: 'icon-hamburg-home'"></a></td>
				<td><div class="datagrid-btn-separator"></div></td>
				<td><a id="mainTabs_toggleAll"
					class="easyui-linkbutton easyui-tooltip" title="展开/折叠面板使选项卡最大化"
					data-options="plain: true, iconCls: 'icon-standard-arrow-out'"></a></td>
				<td><div class="datagrid-btn-separator"></div></td>
				<td><a id="mainTabs_refTab"
					class="easyui-linkbutton easyui-tooltip" title="刷新当前选中的选项卡"
					data-options="plain: true, iconCls: 'icon-standard-arrow-refresh'"></a></td>
				<td><div class="datagrid-btn-separator"></div></td>
				<td><a id="mainTabs_closeTab"
					class="easyui-linkbutton easyui-tooltip" title="关闭当前选中的选项卡"
					data-options="plain: true, iconCls: 'icon-standard-application-form-delete'"></a></td>
			</tr>
		</table>
	</div>
	<div id="mainTabs" class="easyui-tabs"
		data-options="fit: true, border: false, showOption: true, enableNewTabMenu: true, tools: '#mainTabs_tools', enableJumpTabMenu: true">
		<div id="homePanel"
			data-options="title: '主页', iconCls: 'icon-hamburg-home'">
			<div class="easyui-layout" data-options="fit: true">
				<div data-options="region: 'north', split: false, border: false"
					style="height: 33px;">首页内容</div>
				<div data-options="region: 'center', border: false"
					style="overflow: hidden;"></div>
			</div>
		</div>
	</div>
</div>