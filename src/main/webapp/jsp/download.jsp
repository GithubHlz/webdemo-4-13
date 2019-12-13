<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2019-12-12
  Time: 14:59
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
	<title>用户查询</title>
	<link rel="stylesheet" href=<%=layuicsspath+"layui.css"%>>
	<script type="text/javascript" src="<%=layuipath+"layui.all.js"%>"></script>
	<script type="text/javascript" src="<%=layuipath+"layui.js"%>"></script>
	<script src=<%=jsPath+"jquery.js"%>></script>
</head>
<body>

<div class="demoTable" style="padding-left: 26%;padding-top: 8%;">
	用户名：
	<div class="layui-inline">
		<input class="layui-input" name="USERNAME" id="demoReload" autocomplete="off">
	</div>
	<button class="layui-btn" data-type="reload">搜索</button>
</div>

<div id="table" style="width: 49%;padding-left: 26%;padding-top: 0.5%;">
	<table id="LAY_table_user" lay-filter="test"></table>
</div>

<script type="text/html" id="barDemo">
	<a class="layui-btn layui-btn-xs" lay-event="download">下载</a>
</script>

<script>
	layui.use('table', function(){
		var table = layui.table;
		//方法级渲染
		table.render({
			elem: '#LAY_table_user'
			,url: 'filequery.action'
			,cols: [[
				{field: 'name', title: '文档标题', width:80, sort: true, fixed: 'left'}
				,{field: 'adminName', title: '上传人', width:125,sort: true}
				,{field: 'upload_date', title: '上传时间', width:90, sort: true}
				,{field: 'down_integral', title: '下载积分', width:115}
				,{field: 'fileType', title: '文档类型', width: 115}
				,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
			]]
			,id: 'testReload'
			,page: true
			,limit: 5 //每页默认显示的数量
			,height: 300
		});
		var $ = layui.$, active = {
			reload: function(){
				var demoReload = $('#demoReload');
				//执行重载
				table.reload('testReload', {
					page: {
						curr: 1 //重新从第 1 页开始
					}
					,where: {
						// key: {
						flag:"search",
						username: demoReload.val()
						// }
					}
				}, 'data');
			},
			add: function(){
				Popups('addUser.action')
			},
			register: function(){
				Popups1('registered.action')
			}
		};

		$('.demoTable .layui-btn').on('click', function(){
			var type = $(this).data('type');
			active[type] ? active[type].call(this) : '';
		});


		//监听行工具事件
		table.on('tool(test)', function(obj){
			var data = obj.data;
			//console.log(obj)
			if(obj.event === 'download'){
				layer.confirm('是否下载', function(index){
					alert(JSON.stringify(data));
					var fileName=data['name']+"."+data['fileType'];
					var url="/webdemo-4-11/Download.action?fileName="+fileName;
					var xmlResquest = new XMLHttpRequest();
					xmlResquest.open("POST",url, true);
					xmlResquest.setRequestHeader("Content-type", "application/json");
					xmlResquest.setRequestHeader("Authorization", "Bearer 6cda86e3-ba1c-4737-972c-f815304932ee");
					xmlResquest.responseType = "blob";
					xmlResquest.onload = function (oEvent) {
						var content = xmlResquest.response;
						var elink = document.createElement('a');
						elink.download = fileName;
						elink.style.display = 'none';
						var blob = new Blob([content]);
						elink.href = URL.createObjectURL(blob);
						document.body.appendChild(elink);
						elink.click();
						document.body.removeChild(elink)
					};
					xmlResquest.send();
					table.reload('demo');
					layer.msg('已下载');
				});
			}
		});

	});


</script>

</body>
</html>
