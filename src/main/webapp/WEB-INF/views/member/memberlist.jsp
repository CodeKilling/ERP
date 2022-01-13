<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member List</title>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/js/default.css" >
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/js/login.css" >
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/js/memberlist.css" >

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
function memberDelete(memno){
	if(confirm("Do you want to Delete?")){
		location.href = "memberDelete?memno="+memno;
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
				<table style="width: 80%;">
					<tr><th class="th1">no.</th><th>id</th><th>name</th><th>grade</th></tr>
					<c:if test="${memberList.size() == 0 or memberList eq null}">
					<tr>
						<td colspan="4">no data.</td>
					</tr>
					</c:if>
					<c:forEach items="${memberList }" var="entry">
						<tr>
							<td>${entry.rowno }</td>
							<td>${entry.id }</td>
							<td>${entry.name }</td>
							<td>${entry.grade }</td>
							<c:if test="${loginGrade eq 'master' }">
								<td><input type="button" style="width:50px; cursor: pointer;" value="수정" onclick="location.href='memberInfo?memno=${entry.memno }'"></td>
								<td>
									<c:if test="${entry.grade ne 'master' }">
										<input type="button" style="width:50px; cursor: pointer;" value="삭제" onclick="memberDelete('${entry.memno }')">
									</c:if>
								</td>
							</c:if>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="4">
							<div align="center">
								<c:if test="${current > 1 }">
									<a href="memberlist?num=${current -1}">[이전]</a>
								</c:if>
	                  			<c:forEach var="num" begin="1" end="${repeat }">
		                     		<a href="memberlist?num=${num }">[${num }]</a>
	                  			</c:forEach>
	                  			<c:if test="${current ne repeat }">
									<a href="memberlist?num=${current +1}">[다음]</a>
								</c:if>
               				</div>
               				<%-- <a href="${contextPath }/board/writeForm">글작성</a> --%>
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