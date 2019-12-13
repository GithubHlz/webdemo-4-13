<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2019-12-9
  Time: 9:02
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
	<title>权限管理界面2</title>
	<link rel="stylesheet" href=<%=layuicsspath+"layui.css"%>>
	<script src=<%=jsPath+"jquery.js"%>></script>
	<script src=<%=jsPath+"tool.js"%>></script>
	<script type="text/javascript" src="<%=layuipath+"layui.all.js"%>"></script>
	<script type="text/javascript" src="<%=layuipath+"layui.js"%>"></script>
</head>

</html>
