<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2019-11-17
  Time: 22:16
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
		<button class="layui-btn" data-type="add" id="add">新增</button>
		<button class="layui-btn" data-type="register" id="register">注册</button>
		<div class="layui-upload">
			<button type="button" class="layui-btn layui-btn-normal" id="test8">选择文件</button>
			<button type="button" class="layui-btn layui-btn-normal" id="test9">开始上传</button>
		</div>
	</div>

	<div id="table" style="width: 49%;padding-left: 26%;padding-top: 0.5%;">
		<table id="LAY_table_user" lay-filter="test"></table>
	</div>

	<script type="text/html" id="barDemo">
		<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
		<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
	</script>

	<script>
		layui.use('upload', function(){
			var $ = layui.jquery,
			upload = layui.upload;

			upload.render({
				elem: '#test8'
				,url: 'upload.action'
				,auto: false
				,accept: 'file' //普通文件
				,bindAction: '#test9'
				,done: function(json){
					//如果上传失败
					if(json.code === 0){
						return layer.msg('上传失败');
					}
					//上传成功
					if(json.code > 0) {
						return layer.msg('上传成功');
					}
				}
			});
		});
		layui.use('table', function(){
			var table = layui.table;
			//方法级渲染
			table.render({
				elem: '#LAY_table_user'
				,url: 'tableQuery.action'
				,defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
					title: '提示'
					,layEvent: 'LAYTABLE_TIPS'
					,icon: 'layui-icon-tips'
				}]
				,cols: [[
					{field: 'username', title: '用户', width:80, sort: true, fixed: 'left'}
					,{field: 'registeredtime', title: '注册时间', width:125,sort: true}
					,{field: 'integral', title: '积分', width:90, sort: true}
					,{field: 'uploaddocument', title: '上传文档数', width:115}
					,{field: 'downloaddocument', title: '下载文档数', width: 115}
					,{field: 'userstate', title: '用户状态', width: 115}
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

			function CloseWin(){
				parent.location.reload(); // 父页面刷新
				var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
				parent.layer.close(index); //再执行关闭
			}


			//监听行工具事件
			table.on('tool(test)', function(obj){
				var data = obj.data;
				//console.log(obj)
				if(obj.event === 'del'){
					layer.confirm('真的删除行么', function(index){
						obj.del();
						$.post(
							'delete.action',
							{
								USERNAME:data.username,
							},
							function(res){
								layer.msg(res.msg,function(index){
									layer.closeAll(index); //关闭当前窗口
									location.reload();
								});
							}
						);
						layer.close(index);
					});
				} else if(obj.event === 'edit'){
					$('#USERNAME').val(data.username);
					$('#REGISTEREDTIME').val(data.registeredtime);
					$('#INTEGRAL').val(data.integral);
					$('#UPLOADDOCUMENT').val(data.uploaddocument);
					$('#DOWNLOADDOCUMENT').val(data.downloaddocument);
					$('#USERSTATE').val(data.userstate);
					Popups('Change.action')
				}
			});



		});
		
		function Popups(url) {
			layer.open({
				type:1,
				title: '修改',
				area: ['400px', '440px'],
				content: $("#add-main"),
				btn:['确定','取消'],
				yes:function(){
					var USERNAME = $('#USERNAME').val();
					var REGISTEREDTIME=$('#REGISTEREDTIME').val();
					var INTEGRAL = $('#INTEGRAL').val();
					var UPLOADDOCUMENT=$('#UPLOADDOCUMENT').val();
					var DOWNLOADDOCUMENT = $('#DOWNLOADDOCUMENT').val();
					var USERSTATE=$('#USERSTATE').val();
					$.post(
						url,
						{
							USERNAME:USERNAME,
							REGISTEREDTIME:REGISTEREDTIME,
							INTEGRAL:INTEGRAL,
							UPLOADDOCUMENT:UPLOADDOCUMENT,
							DOWNLOADDOCUMENT:DOWNLOADDOCUMENT,
							USERSTATE:USERSTATE
						},
						function(res){
							layer.msg(res.msg,function(index){
								layer.closeAll(index); //关闭当前窗口
								location.reload();
								$('#USERNAME').val(null);
								$('#REGISTEREDTIME').val(null);
								$('#INTEGRAL').val(null);
								$('#UPLOADDOCUMENT').val(null);
								$('#DOWNLOADDOCUMENT').val(null);
								$('#USERSTATE').val(null);
							});
						}
					);
				},
				btn2:function(){
					layer.closeAll(index); //关闭当前窗口
				}
			});
		}

		function Popups1(url) {
			layer.open({
				type:1,
				title: '注册',
				area: ['400px', '440px'],
				content: $("#register-main"),
				btn:['注册','取消'],
				yes:function(){
					var uesrname = $('#uesrname').val();
					var password=$('#password').val();
					var repassword = $('#repassword').val();
					var admin=$('#admin').val();
					var profession = $('#profession').val();
					var position=$('#position').val();
					if (password===repassword) {
						$.post(
							url,
							{
								uesrname:uesrname,
								password:password,
								repassword:repassword,
								admin:admin,
								profession:profession,
								position:position
							},
							function(res){
								layer.msg(res.msg,function(index){
									layer.closeAll(index); //关闭当前窗口
									location.reload();
									$('#uesrname').val(null);
									$('#password').val(null);
									$('#repassword').val(null);
									$('#admin').val(null);
									$('#profession').val(null);
									$('#position').val(null);
								});
							}
						);
					}else {
						layer.msg("两次输入的密码不一致，请重新输入",function(index){
						});
					}

				},
				btn2:function(){
					layer.closeAll(index); //关闭当前窗口
				}
			});
		}
	</script>


	<div id="add-main" style="display: none;padding-top: 15px;">
			<div class="layui-form-item center" >
				<label class="layui-form-label" style="width: 100px" >用户名：&emsp;&emsp;</label>
				<div class="layui-input-block">
					<input type="text" id="USERNAME" value="" style="width: 240px"    autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item center" >
				<label class="layui-form-label" style="width: 100px" >注册时间：&emsp;</label>
				<div class="layui-input-block">
					<input type="date" id="REGISTEREDTIME" value="" style="width: 240px"  lay-verify="required"  autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item center" >
				<label class="layui-form-label" style="width: 100px" >上传文档数：</label>
				<div class="layui-input-block">
					<input type="text" id="INTEGRAL" value="" style="width: 240px"  lay-verify="required"  autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item center" >
				<label class="layui-form-label" style="width: 100px" >配置名称：&emsp;</label>
				<div class="layui-input-block">
					<input type="text" id="UPLOADDOCUMENT" value="" style="width: 240px"  lay-verify="required"  autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label" style="width: 100px">下载文档数：</label>
				<div class="layui-input-block">
					<input type="text" id="DOWNLOADDOCUMENT"  style="width: 240px" lay-verify="required" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label" style="width: 100px">用户状态：&emsp;</label>
				<div class="layui-input-block">
					<input type="text" id="USERSTATE" style="width: 240px" lay-verify="required" autocomplete="off" class="layui-input">
				</div>
			</div>
	</div>
	<div id="register-main" style="display: none;padding-top: 15px;">
		<div class="layui-form-item center" >
			<label class="layui-form-label" style="width: 100px" >用户名：&emsp;&emsp;</label>
			<div class="layui-input-block">
				<input type="text" id="uesrname" value="" style="width: 240px"    autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item center" >
			<label class="layui-form-label" style="width: 100px" >输入密码：&emsp;</label>
			<div class="layui-input-block">
				<input type="text" id="password" value="" style="width: 240px"  lay-verify="required"  autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item center" >
			<label class="layui-form-label" style="width: 100px" >确认密码：&emsp;</label>
			<div class="layui-input-block">
				<input type="text" id="repassword" value="" style="width: 240px"  lay-verify="required"  autocomplete="off" class="layui-input">
			</div>
		</div>
<%--		<div class="layui-form-item">--%>
<%--			<label class="layui-form-label">性别：</label>--%>
<%--			<div class="layui-input-block">--%>
<%--				<input type="radio" name="sex" value="男" title="男" checked="">--%>
<%--				<input type="radio" name="sex" value="女" title="女">--%>
<%--			</div>--%>
<%--			<input type="hidden" id="sex" value="男" >--%>
<%--		</div>--%>
		<div class="layui-form-item">
			<label class="layui-form-label" style="width: 100px" >账号：&emsp;</label>
			<div class="layui-input-inline">
				<input type="text" name="admin" id="admin" lay-verify="required"  autocomplete="off" class="layui-input"  style="width: 240px">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label" style="width: 100px" >学历：&emsp;</label>
			<div class="layui-input-inline">
				<input type="text" name="profession" id="profession" lay-verify="required"  autocomplete="off" class="layui-input"  style="width: 240px">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label" style="width: 100px" >工作：&emsp;</label>
			<div class="layui-input-inline">
				<input type="text" name="position" id="position" lay-verify="required"  autocomplete="off" class="layui-input"  style="width: 240px">
			</div>
		</div>
	</div>
</body>
</html>
