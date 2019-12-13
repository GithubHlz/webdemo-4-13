<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2019-12-8
  Time: 20:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String layuipath = request.getContextPath()+"/layui/";
	String layuicsspath = request.getContextPath()+"/layui/css/";
	String jsPath = request.getContextPath()+"/js/";
%>
<html>
<head>
	<meta charset="UTF-8">
	<title>权限管理界面1</title>

	<link rel="stylesheet" href=<%=layuicsspath+"layui.css"%>>
	<script src=<%=jsPath+"jquery.js"%>></script>
	<script src=<%=jsPath+"tool.js"%>></script>
	<script type="text/javascript" src="<%=layuipath+"layui.all.js"%>"></script>
	<script type="text/javascript" src="<%=layuipath+"layui.js"%>"></script>
	<%--	<script type="text/javascript" src="../layui/layui.js"></script>--%>
</head>
<body>

<div class="layui-form-item">

	<div class="layui-inline">
		<label class="layui-form-label">角色选择</label>
		<div class="layui-input-inline">
			<select name="xm" id="xm" lay-verify="required" lay-filter="xmFilter">
				<option value=""></option>
			</select>
		</div>
	</div>
</div>

<div id="test12" class="demo-tree-more"></div>
<div class="layui-btn-container">
	<button type="button" class="layui-btn layui-btn-sm" lay-demo="getChecked">分配</button>
</div>





<script>

	function treeRender(tree){
		$.post(
			'authority1.action',
			function(res){
				tree.render({
					elem: '#test12'
					,data: res
					,showCheckbox: true  //是否显示复选框
					,id: 'demoId1'
				});
			});

	}



	layui.use(['form','tree', 'util'], function(){
		var tree = layui.tree
			,layer = layui.layer
			,util = layui.util
			,form = layui.form;
			$.post(
				'authority1.action',
				function(res){
					tree.render({
						elem: '#test12'
						,data: res
						,showCheckbox: true  //是否显示复选框
						,id: 'demoId1'
					});
				});

				util.event('lay-demo', {
					getChecked: function(){
						var checkedData = tree.getChecked('demoId1'); //获取选中节点的数据
						var ob=JSON.stringify(checkedData);
						var xm = $("#xm").val();
						layer.alert(JSON.stringify(checkedData));
						$.post(
							'authority2.action',
							{
								msg:ob,
								xm:xm
							},
							function(res){

							});
					}
				});
			$.post(
				'role.action',
				function(data){
					$.each(data, function (index, item) {
						$('#xm').append(new Option(item.rolename, item.roleid));// 下拉菜单里添加元素
					});
					layui.form.render("select");
				});

			}
		);
</script>


</body>
</html>
