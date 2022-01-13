<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Membership</title>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/js/default.css" >
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/js/login.css" >
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/js/membership.css" >

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
function Register(){
	var flag = false;
	$("#registerForm").find("input[type!='button']").each(function(){
		if($(this).val().trim() == ''){
			alert($(this).attr("data-name") + " 항목을 입력하세요.");
			flag = true;
			return false;
		}
	});
	/* $("#registerForm").find("input[type='password']").each(function(){
		if($(this).val().trim() == ''){
			alert($(this).attr("data-name") + " 항목을 입력하세요.");
			flag = true;
			return false;
		}
	}); */
	if(flag){
		return;
	}else{
		registerForm.submit();
	}
}
function mykeydown(){
	if(event.keyCode == 13){
		Register();
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
			<div class="content">
				<form action="register" method="post" id="registerForm">
					<label>ID : </label><br>
					<input type="text" name="id" data-name="id" placeholder="input your id" autofocus="autofocus"><br>
					<label>PASSWORD : </label><br>
					<input type="password" name="pwd" data-name="password" placeholder="input your password"><br>
					<label>NAME : </label><br>
					<input type="text" name="name" data-name="name" placeholder="input your name" onkeydown="mykeydown()"><br>
					<label>GRADE : </label><br>
					<input type="radio" name="grade" value="normal" checked="checked" class="radio"><label class="label">사용자</label>
					<input type="radio" name="grade" value="master" class="radio"><label class="label">관리자</label><br>
					<input type="button" value="Register" style="cursor: pointer;" onclick="Register()"><br><br><br><br><br><br><hr>
					<!-- <input type="submit" value="Register" style="cursor: pointer;"><br><br><br><br><br><br><hr> -->
					<!-- <input type="button" value="Membership" onclick="location.href='membership'" style="cursor: pointer;"><br> -->
				</form>
			</div>
		</div>
		<div class="bottom">
			<c:import url="../default/footer.jsp" />
		</div>
	</div>
</body>
</html>