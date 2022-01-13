<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Info</title>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/js/default.css" >
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/js/login.css" >
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/js/membership.css" >

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
function Modify(){
	var flag = false;
	$("#modifyForm").find("input[type!='button']").each(function(){
		if($(this).val().trim() == ''){
			alert($(this).attr("data-name") + " 항목을 입력하세요.");
			flag = true;
			return false;
		}
	});
	if(flag){
		return;
	}else{
		modifyForm.submit();
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
				<form action="memberModify" method="post" id="modifyForm">
					<label>ID : </label><br>
					<input type="text" name="id" data-name="id" placeholder="input your id" autofocus="autofocus" value="${member.id }"><br>
					<label>PASSWORD : </label><br>
					<input type="text" name="pwd" data-name="password" placeholder="input your password" value="${member.pwd }"><br>
					<label>NAME : </label><br>
					<input type="text" name="name" data-name="name" placeholder="input your name" value="${member.name }"><br>
					<label>GRADE : </label><br>
					<input type="radio" name="grade" value="normal" checked="checked" class="radio"><label class="label">사용자</label>
					<input type="radio" name="grade" value="master" class="radio"><label class="label">관리자</label><br>
					<input type="hidden" name="memno" value="${member.memno }"><br>
					<input type="button" value="Modify" style="cursor: pointer;" onclick="Modify()"><br>
					<input type="button" value="Cancle" style="cursor: pointer;" onclick="location.href='javascript:history.back();'"><br><br><br><br><br><br><hr>
				</form>
			</div>
		</div>
		<div class="bottom">
			<c:import url="../default/footer.jsp" />
		</div>
	</div>
</body>
</html>