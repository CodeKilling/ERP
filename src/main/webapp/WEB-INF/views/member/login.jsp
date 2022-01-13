<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/js/default.css" >
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/js/login.css" >

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
function Login(){
	var flag = false;
	$("#loginForm").find("input[type!='button']").each(function(){
		if($(this).val().trim() == ''){
			alert($(this).attr("data-name") + " 항목을 입력하세요.");
			flag = true;
			return false;
		}
	});
	if(flag){
		return;
	}else{
		loginForm.submit();
	}
}
function mykeydown(){
	if(event.keyCode == 13){
		Login();
	}
}
</script>
</head>
<body>
	<div class="wrap">
		<div class="top">
			<c:import url="../default/header.jsp" />
		</div>
		<div class="left">
			<c:import url="../default/left.jsp" />
		</div>
		<div class="right">
			<c:if test="${msg ne null }">
				<script type="text/javascript">
					alert("${msg }");
				</script>
			</c:if>
			<div class="content">
				<form action="userlogin" method="post" id="loginForm">
					<label>ID : </label><br>
					<input type="text" name="id" placeholder="input your id" data-name="id" autofocus="autofocus"><br>
					<label>PASSWORD : </label><br>
					<input type="password" name="pwd" placeholder="input your password" data-name="password" onkeydown="mykeydown()"><br>
					<input type="button" value="Login" onclick="Login()" style="cursor: pointer;"><br><br><br><br><br><br><hr width="200px">
					<input type="button" value="Membership" onclick="location.href='membership'" style="cursor: pointer;"><br>
				</form>
			</div>
		</div>
		<div class="bottom">
			<c:import url="../default/footer.jsp" />
		</div>
	</div>
</body>
</html>