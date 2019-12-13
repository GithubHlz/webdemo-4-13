<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2019-11-17
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
	<title>管理员登录界面</title>

	<link rel="stylesheet" href=<%=layuicsspath+"layui.css"%>>
	<script src=<%=jsPath+"jquery.js"%>></script>
	<script src=<%=jsPath+"tool.js"%>></script>
	<script type="text/javascript" src="<%=layuipath+"layui.all.js"%>"></script>
	<script type="text/javascript" src="<%=layuipath+"layui.js"%>"></script>
<%--	<script type="text/javascript" src="../layui/layui.js"></script>--%>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
	<div class="layui-header">
		<div class="layui-logo">文档分享后台布局</div>
		<!-- 头部区域（可配合layui已有的水平导航） -->
		<ul class="layui-nav layui-layout-right">
			<li class="layui-nav-item">
				<a href="javascript:;">
					<img src="http://t.cn/RCzsdCq" class="layui-nav-img">
					贤心
				</a>
				<dl class="layui-nav-child">
					<dd><a href="">基本资料</a></dd>
					<dd><a href="">安全设置</a></dd>
				</dl>
			</li>
			<li class="layui-nav-item"><a href="">退了</a></li>
		</ul>
	</div>

	<div class="layui-side layui-bg-black">
		<div class="layui-side-scroll">
			<ul class="layui-nav layui-nav-tree"  lay-filter="test">
				<c:if test="${requestScope.menu != null}">
					<c:forEach items="${requestScope.menu}" begin="0" step="1" var="X">
						<li class="layui-nav-item ">
							<a class="" href="javascript:;">${X.key}</a>
							<dl class="layui-nav-child">
								<c:forEach items="${X.value}" begin="0" step="1" var="Y">
									<dd><a title="${Y.link}" href="javascript:void(0)" target="page-view" onclick="changeURL(this)">${Y.sonMenu}</a></dd>
								</c:forEach>
							</dl>
						</li>
					</c:forEach>
				</c:if>
			</ul>

<%--			<!-- 左侧导航区域（可配合layui已有的垂直导航） -->--%>
<%--			<ul class="layui-nav layui-nav-tree"  lay-filter="test">--%>
<%--				<li class="layui-nav-item ">--%>
<%--					<a class="" href="javascript:;">用户管理</a>--%>
<%--					<dl class="layui-nav-child">--%>
<%--						<dd><a title="userQuery.action" href="javascript:void(0)" target="page-view" onclick="changeURL(this)">用户查询</a></dd>--%>
<%--						<dd><a href="javascript:;">用户管控</a></dd>--%>
<%--					</dl>--%>
<%--				</li>--%>
<%--				<li class="layui-nav-item">--%>
<%--					<a href="javascript:;">文档管理</a>--%>
<%--					<dl class="layui-nav-child">--%>
<%--						<dd><a href="javascript:;">文档审核</a></dd>--%>
<%--						<dd><a href="javascript:;">文档配置</a></dd>--%>
<%--					</dl>--%>
<%--				</li>--%>
<%--				<li class="layui-nav-item">--%>
<%--					<a href="javascript:;">日志管理</a>--%>
<%--					<dl class="layui-nav-child">--%>
<%--						<dd><a href="javascript:;">日志列表</a></dd>--%>
<%--					</dl>--%>
<%--				</li>--%>

<%--				<li class="layui-nav-item">--%>
<%--					<a href="javascript:;">系统配置</a>--%>
<%--					<dl class="layui-nav-child">--%>
<%--						<dd><a href="javascript:;">上传奖励配置</a></dd>--%>
<%--						<dd><a href="javascript:;">注册奖励配置</a></dd>--%>
<%--					</dl>--%>
<%--				</li>--%>
<%--			</ul>--%>
		</div>
	</div>

	<div class="layui-body">
		<!-- 内容主体区域 -->
		<iframe src="" frameborder="0"  name="page-view" id="myiframe" style="width: 100%;height: 100%">
		</iframe>

	</div>

	<div class="layui-footer">
		<!-- 底部固定区域 -->
		© layui.com - 底部固定区域
	</div>
</div>
	<script>
		//JavaScript代码区域
		layui.use('element', function(){
			var element = layui.element;

		});
		<c:if test="${requestScope.flag eq 'success'}">
		layer.open({
			title: '提示'
			,content: '登录成功'
		});
		</c:if>
	</script>
</body>
</html>
