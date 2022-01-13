<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/js/default.css">

</head>
<body>
	<div class="wrap">
		<div class="top">
			<c:import url="default/header.jsp" />
		</div>
		<div class="left">
			<c:import url="default/left.jsp" />
		</div>
		<div class="right">
			<div class="divmain">
				<c:choose>
					<c:when test="${loginUser ne null}">
						<i class="main">${loginUser }님 선영전자 ERP에 오신것을 환영합니다.<br>
						오늘 할일은 내일로 미루자.</i>
					</c:when>
					<c:otherwise>
						<i class="main">선영전자 ERP에 오신것을 환영합니다.<br>
						오늘 할일은 내일로 미루자.</i>	
					</c:otherwise>
				</c:choose>
			</div>
			<div class="divname">
				<i class="name">- 박 선 영</i>
			</div>
		</div>
		<div class="bottom">
			<c:import url="default/footer.jsp" />
		</div>
	</div>
</body>
</html>