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
	<title>管理员注册界面</title>

	<link rel="stylesheet" href=<%=layuicsspath+"layui.css"%>>
	<script src=<%=jsPath+"jquery.js"%>></script>
	<script src=<%=jsPath+"tool.js"%>></script>
	<script type="text/javascript" src="<%=layuipath+"layui.all.js"%>"></script>
	<script type="text/javascript" src="<%=layuipath+"layui.js"%>"></script>
</head>
<body>
<div class="layadmin-user-login layadmin-user-display-show" id="LAY-user-login" >
	<div class="layadmin-user-login-box layadmin-user-login-body layui-form">

		<div class="layui-form" lay-filter="layuiadmin-form-useradmin" id="layuiadmin-form-useradmin" style="padding: 20px 0 0 0;">
			<div class="layadmin-user-login-main">

				<div class="layui-form-item">
					<label class="layui-form-label">用户名</label>
					<div class="layui-input-inline">
						<input type="text" name="tb_name" id="tb_name" lay-verify="required"  autocomplete="off" class="layui-input"  >
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">密码</label>
					<div class="layui-input-inline">
						<input type="password" name="tb_pass" id="tb_pass" lay-verify="required"  autocomplete="off" class="layui-input"  >
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">确认密码</label>
					<div class="layui-input-inline">
						<input type="password" name="PASS" id="PASS" lay-verify="required"  autocomplete="off" class="layui-input" >
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">性别：</label>
					<div class="layui-input-block">
						<input type="radio" name="tb_sex" value="男" title="男" checked="">
						<input type="radio" name="tb_sex" value="女" title="女">
					</div>
					<input type="hidden" id="sex" value="男" >
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">学历:</label>
					<div class="layui-input-inline">
						<input type="text" name="tb_study" id="tb_study" lay-verify="required"  autocomplete="off" class="layui-input"  >
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">专业:</label>
					<div class="layui-input-inline">
						<input type="text" name="tb_professional" id="tb_professional" lay-verify="required"  autocomplete="off" class="layui-input"  >
					</div>
				</div>


				<div class="layui-form-item">
					<label class="layui-form-label">手机号:</label>
					<div class="layui-input-inline">
						<input type="text" name="tb_phone" id="tb_phone" lay-verify="required"  autocomplete="off" class="layui-input"  >
					</div>
				</div>


				<div class="layui-form-item">
					<label class="layui-form-label">邮箱:</label>
					<div class="layui-input-inline">
						<input type="text" name="email" id="email" lay-verify="required"  autocomplete="off" class="layui-input"  >
					</div>
				</div>

				<div class="layui-form-item">
					<button class="layui-btn layui-btn-fluid" lay-submit lay-filter="LAY-user-reg-submit" >注 册</button>
				</div>



			</div>
		</div>
	</div>
</div>

<script>
	layui.use(['form', 'jquery'], function() {
		var form = layui.form
			, $ = layui.$;
		form.render();
		form.on('radio', function (data) {
			//console.log(data.elem); //得到radio原始DOM对象
			//console.log(data.value); //被点击的radio的value值
			if (data.value === "男") {
				$("#sex").val("男")
			} else if (data.value === "女") {
				$("#sex").val("女")
			}


		});
		form.on('submit(LAY-user-reg-submit)', function (obj) {


			var tb_name=$("#tb_name").val()
			var tb_pass=$("#tb_pass").val()
			var tb_sex=$("#sex").val()
			var tb_study=$("#tb_study").val()
			var tb_professional=$("#tb_professional").val()
			var tb_phone=$("#tb_phone").val()
			var email=$("#email").val()
			var myDate = new Date();
			var tb_time= myDate.toLocaleDateString();
			var ob = {tb_name:tb_name,tb_pass:tb_pass,tb_sex:tb_sex,tb_study:tb_study,tb_professional:tb_professional,tb_phone:tb_phone,email:email,tb_time:tb_time};
			alert(ob);
			$.ajax({
				type:"POST",//提交的方式
				url:"/Demo13/AddServlet.action",//提交的地址
				data:ob,//提交的数据
				dataType:"json",//希望返回的数据类型
				async: true,//异步操作
				success:function (msg) {//成功的方法  msg为返回数据
					if(msg.msg==="1"){
						alert("增加成功")

					}else if(msg.msg==="2"){
						alert("增加失败");

					}

				},
				error:function () {//错误的方法
					alert("服务器正忙")
				}
			});


		});
	});

</script>

</body>
</html>
