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
function releaseDelete(releaseNo, productNo, count){
	if(confirm("Do you want to Delete?")){
		location.href = "releaseDelete?releaseNo=" + releaseNo
									+"&productNo=" + productNo
									+"&count=" + count;
	}
}

/* function filtering(){
	var select = document.getElementById('filter');
	var category = select.options[select.selectedIndex].value;
	if(category == "ALL"){
		location.href = "productlist";
	}else{
		location.href = "productFilterList?category=" + category;	
	}
} */

/* window.onmouseover = function(event)
{
 console.log(event.target.nodeName);
} */
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
						<th>출고일</th>
						<th>제품</th>
						<th>수량</th>
						<th>거래처</th>
						<th>검수</th>
						<th>modify</th>
						<th>delete</th>
					</tr>
					<c:if test="${release.size() eq 0 or release eq null }">
						<tr>
							<td colspan="10">no data.</td>
						</tr>
					</c:if>
					<c:forEach items="${release }" var="entry">
						<tr>
							<td>${entry.rowNo }</td>
							<td>${entry.name }</td>
							<td>${entry.comments }</td>
							<td>${entry.releaseDay }</td>
							<td>${entry.productName }</td>
							<td>${entry.count }</td>
							<td>${entry.accountName }</td>
							<c:choose>
								<c:when test="${entry.confirm eq 'true' }">
									<td>Confirmed.</td>		
								</c:when>
								<c:otherwise>
									<td>Not Confirmed.</td>
								</c:otherwise>
							</c:choose>
							<td>
								<input type="button" style="width:50px; cursor: pointer;" value="수정" 
									onclick="location.href='releaseInfo?releaseNo=${entry.releaseNo }'">
							</td>
							<td>
								<c:choose>
									<c:when test="${entry.confirm eq 'true' }">
										검수 완료.									
									</c:when>
									<c:otherwise>
										<input type="button" style="width:50px; cursor: pointer;" value="삭제" 
											onclick="releaseDelete('${entry.releaseNo }','${entry.productNo }','${entry.count }')">	
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="10">
							<div align="center">
								<c:if test="${current > 1 }">
									<a href="releaseList?num=${current -1}">[이전]</a>
								</c:if>
	                  			<c:forEach var="num" begin="1" end="${repeat }">
		                     		<a href="releaseList?num=${num }">[${num }]</a>
	                  			</c:forEach>
	                  			<c:if test="${current ne repeat && current > 1}">
									<a href="releaseList?num=${current +1}">[다음]</a>
								</c:if>
               				</div>
						</td>
					</tr>
					<tr>
						<td colspan="10">
							<div align="center">
								<input type="button" style="width:200px; cursor: pointer;" value="출고 등록" onclick="location.href='releasePreForm'">
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