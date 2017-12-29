<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<%@include file="/public/head.jspf"%>
	<style type="text/css">
		#dd div{
			padding: 5px;
		}
	</style>
<body>
	<div class="wrapper">
		<%-- <%@include file="template/head.jsp" %> --%>
		<div class="section_container">
		
			<div id="dd" class="action_buttonbar" style="text-align:center;">
				<form method="post" action="${shop}/user_register.action">
				<div>
						注册页面
					</div>
					<div>
						<label for="login">账号:&nbsp;</label> 
						<input type="text" name="login" />
					</div>
					<div>
						<label for="pass">密码:&nbsp</label> 
						<input type="text" name="pass" />
					</div>
					<div>
						${sessionScope.error}  
					</div>
					<div>
						<input type="submit" value="注册" style="width:60px;height:30px" />
						
					</div>
			   </form>
			   <div style="clear:both"></div>
			</div>
		</div>
		<%-- <%@include file="template/footer.jsp" %> --%>
	</div>
</body>
</html>
