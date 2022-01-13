<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
.navdiv {
	width: 100%;
	height: 903.33px;
	background-color: black;
}

nav {
	background-color: black;
	/* width: 100%; */
}

nav ul {
	list-style: none;
	/* display: flex;
	justify-content: flex-end; */
}

nav ul li {
	margin: 0 3px;
	padding: 10px 10px;
}

nav ul li a {
	text-decoration: none;
	color: white;
}

nav ul li a:hover {
	color: orange;
	padding-bottom: 3px; /* a태그 밑줄과 글씨 간격*/
	border-bottom: 1px solid orange;
	transition: all 0.25s;
}
</style>

</head>
<body>
	<div class="navdiv">
		<div class="wrap">
			<nav>
				<ul>
					<li><a href="${contextPath }/index">HOME</a></li>
					<li><a href="${contextPath }/stock/stockList">입고</a></li>
					<li><a href="${contextPath }/release/releaseList">출고</a></li>
					<li><a href="${contextPath }/inventory/inventoryStatus">재고현황</a></li>
					<li><a href="${contextPath }/account/accountlist">거래처관리</a></li>
					<li><a href="${contextPath }/product/productlist">제품관리</a></li>
					<li><a href="${contextPath }/member/memberlist">사용자관리</a></li>
					<%-- <li><a href="${contextPath }/member/login">LOGIN</a></li> --%>
					
					<%-- <li><a href="${contextPath }/member/memberInfo">MEMBER_SHIP</a></li>
					<li><a href="${contextPath }/board/boardAllList">BOARD</a></li>
					<li><a href="${contextPath }/board/list">BOARD</a></li> --%>

					<c:choose>
						<c:when test="${loginUser ne null }">
							<li><a href="${contextPath }/member/logout">LOGOUT</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="${contextPath }/member/login">LOGIN</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</nav>
		</div>
	</div>
</body>
</html>