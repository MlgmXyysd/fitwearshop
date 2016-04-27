<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/easyui.jsp"%>
<div id="northPanel" data-options="region: 'north', border: false"
	style="height: 80px; overflow: hidden;">
	<div id="topbar" class="top-bar">
		<div class="top-bar-left">
			<h1 style="margin-left: 10px; margin-top: 10px; color: #fff">
				数字<span style="color: #3F4752">后台管理系统</span>
			</h1>
		</div>
		<div class="top-bar-right">
			<div id="timerSpan"></div>
			<div id="themeSpan">
				<a id="btnHideNorth" class="easyui-linkbutton"
					data-options="plain: true, iconCls: 'layout-button-up'"></a>
			</div>
		</div>
	</div>
	<div id="toolbar"
		class="panel-header panel-header-noborder top-toolbar">
		<div id="infobar">
			<span class="icon-hamburg-user"
				style="padding-left: 25px; background-position: left center;">
				<shiro:principal property="name" />，您好
			</span>
		</div>

		<div id="buttonbar">
			<span>更换皮肤：</span> <select id="themeSelector"></select> <a
				href="javascript:void(0);" class="easyui-menubutton"
				data-options="menu:'#layout_north_set'" iconCls="icon-standard-cog">系统</a>
			<div id="layout_north_set">
				<div id="btnFullScreen" data-options="iconCls:'key'">全屏切换</div>
				<div id="btnExit" data-options="iconCls:'logout'">退出系统</div>
			</div>
			<a id="btnShowNorth" class="easyui-linkbutton"
				data-options="plain: true, iconCls: 'layout-button-down'"
				style="display: none;"></a>
		</div>
	</div>
</div>