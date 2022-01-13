<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래처 관리</title>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/js/default.css" >
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/js/login.css" >
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/js/memberlist.css" >

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
function accountDelete(accountNo){
	if(confirm("Do you want to Delete?")){
		location.href = "accountDelete?accountNo=" + accountNo;
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
				<table style="table-layout: fixed; width: 80%;">
					<tr>
						<th class="th1">no.</th>
						<th>name</th>
						<th>contact</th>
						<th>address</th>
						<th>modify</th>
						<th>delete</th>
					</tr>
					<c:if test="${accountList.size() == 0 or accountList eq null}">
					<tr>
						<td colspan="6">no data.</td>
					</tr>
					</c:if>
					<c:forEach items="${accountList }" var="entry">
						<tr>
							<td>${entry.rowNo }</td>
							<td>${entry.name }</td>
							<td>${entry.contact }</td>
							<td>${entry.addr }</td>
							<td><input type="button" style="width:50px; cursor: pointer;" value="수정" 
								onclick="location.href='accountForm?cmd=Modify&accountNo=${entry.accountNo }'"></td>
							<td><input type="button" style="width:50px; cursor: pointer;" value="삭제" 
								onclick="accountDelete('${entry.accountNo }')"></td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="6">
							<div align="center">
								<c:if test="${current > 1 }">
									<a href="accountList?num=${current -1}">[이전]</a>
								</c:if>
	                  			<c:forEach var="num" begin="1" end="${repeat }">
		                     		<a href="accountList?num=${num }">[${num }]</a>
	                  			</c:forEach>
	                  			<c:if test="${current ne repeat && current > 1}">
									<a href="accountList?num=${current +1}">[다음]</a>
								</c:if>
               				</div>
						</td>
					</tr>
					<tr>
						<td colspan="6">
							<div align="center">
								<input type="button" style="width:200px; cursor: pointer;" value="거래처 등록" onclick="location.href='accountForm?cmd=Insert'">
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