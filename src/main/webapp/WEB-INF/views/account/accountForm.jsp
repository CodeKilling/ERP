<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>
	<c:choose>
		<c:when test="${command eq 'Insert' }">
			거래처 등록
		</c:when>
		<c:otherwise>
			거래처 수정
		</c:otherwise>
	</c:choose>
</title>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/js/default.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/js/login.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/js/memberlist.css">

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function Run() {
		var flag = false;
		$("#form").find("input[type='text']").each(function() {
			if ($(this).val().trim() == '') {
				alert($(this).attr("data-name") + " 항목을 입력하세요.");
				flag = true;
				return false;
			}
		});
		if (flag) {
			return;
		} else {
			form.submit();
		}
	}
	function mykeydown(){
		if(event.keyCode == 13){
			Run();
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
				<form action="
					<c:choose>
						<c:when test="${command eq 'Insert' }">
							accountInsert
						</c:when>
						<c:otherwise>
							accountModify
						</c:otherwise>
					</c:choose>
					" method="post" id="form">
					<label>NAME : </label><br>
					<input type="text" name="name" data-name="name" placeholder="input account name" autofocus="autofocus" value="${account.name }"><br>
					<label>CONTACT : </label><br>
					<input type="text" name="contact" data-name="contact" placeholder="input account contact" value="${account.contact }"><br>
					<label>ADDRESS : </label><br>
					<input type="text" name="addr" data-name="address" placeholder="input account address" onkeydown="mykeydown()" value="${account.addr }"><br>
					
					<c:if test="${command eq 'Modify' }">
						<input type="hidden" name="accountNo" value="${account.accountNo }" /><br>
					</c:if>

					<input type="button" value="${command }" style="cursor: pointer;" onclick="Run()">
					<input type="button" value="Cancle" style="cursor: pointer;" onclick="history.back();"><br><br><br><br><br><br><hr>
				</form>
			</div>
		</div>
		<div class="bottom">
			<c:import url="../default/footer.jsp" />
		</div>
	</div>
</body>
</html>