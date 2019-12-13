<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2019-11-15
  Time: 10:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String layuipath = request.getContextPath()+"/layui/";
	String layuicsspath = request.getContextPath()+"/layui/css/";
%>
<html>
<head>
	<meta charset="UTF-8">
	<title>管理员登录界面</title>
<%--	<link rel="stylesheet" href="../layui/css/layui.css">--%>
	<link rel="stylesheet" href=<%=layuicsspath+"layui.css"%>>
<%--	<script src="<%=layuipath+"layui.js"%>"></script>--%>
	<script src="<%=layuipath+"layui.all.js"%>"></script>
</head>
<body>

	<div class="layui-main login" style="width: 385px;top: 200px">
		<h2 style="text-align: center">登录</h2>
		<form class="layui-form" action="login.action" method="post" style="top: 10px">
			<div class="layui-form-item">
				<label class="layui-form-label">输入框</label>
				<div class="layui-input-inline">
					<input type="text" name="USERNAME" value="1" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">密码框</label>
				<div class="layui-input-inline">
					<input type="password" name="uPass" value="12" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn" lay-submit lay-filter="formDemo">提交</button>
					<button type="reset" class="layui-btn layui-btn-primary">重置</button>
				</div>
			</div>
		</form>
	</div>
	<script>
		<c:if test="${requestScope.flag eq 'fail'}">
			layer.open({
				title: '提示'
				,content: '账号或密码输入错误，请重新输入'
			});
		</c:if>
	</script>

</body>
</html>
