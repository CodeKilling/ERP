<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출고</title>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/js/default.css" >
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/js/login.css" >
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/js/memberlist.css" >
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/js/select.css" >

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

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
				<table style="table-layout: fixed; width: 80%;">
					<tr>
						<th class="th1">no.</th>
						<th>name</th>
						<th>comments</th>
						<th>입고일</th>
						<th>제품</th>
						<th>현재재고량</th>
						<th>거래처</th>
						<th>출고</th>
					</tr>
					<c:if test="${preData.size() eq 0 or preData eq null }">
						<tr>
							<td colspan="8">no data.</td>
						</tr>
					</c:if>
					<c:forEach items="${preData }" var="entry">
						<tr>
							<td>${entry.rowNo }</td>
							<td>${entry.name }</td>
							<td>${entry.comments }</td>
							<td>${entry.stockDay }</td>
							<td>${entry.productName }</td>
							<td>${entry.count }</td>
							<td>${entry.accountName }</td>
							<td>
								<input type="button" style="width:50px; cursor: pointer;" value="출고" 
									onclick="location.href='releaseForm?stockNo=${entry.stockNo }'">
							</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="8">
							<div align="center">
								<c:if test="${current > 1 }">
									<a href="releasePreForm?num=${current -1}">[이전]</a>
								</c:if>
	                  			<c:forEach var="num" begin="1" end="${repeat }">
		                     		<a href="releasePreForm?num=${num }">[${num }]</a>
	                  			</c:forEach>
	                  			<c:if test="${current ne repeat && current > 1}">
									<a href="releasePreForm?num=${current +1}">[다음]</a>
								</c:if>
               				</div>
						</td>
					</tr>
					<tr>
						<td colspan="8">
							<div align="center">
								<input type="button" value="Cancle" style="cursor: pointer;" onclick="history.back();">
							</div>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="bottom">
			<c:import url="../default/footer.jsp" />
		</div>
	</div>
</body>
</html>