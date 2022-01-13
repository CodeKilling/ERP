<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 관리</title>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/js/default.css" >
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/js/login.css" >
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/js/memberlist.css" >
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/js/select.css" >

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
function productDelete(productno, imageFileName){
	if(confirm("Do you want to Delete?")){
		location.href = "productDelete?productno=" + productno + "&imageFileName=" + imageFileName;
	}
}

function filtering(){
	var select = document.getElementById('filter');
	var category = select.options[select.selectedIndex].value;
	if(category == "ALL"){
		location.href = "productlist";
	}else{
		location.href = "productFilterList?category=" + category;	
	}
}

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
			<c:if test="${msg ne null }">
				<script type="text/javascript">
					alert("${msg }");
				</script>
			</c:if>
			<div class="content">
				<div align="right" style="margin-right: 180px; margin-bottom: 20px;">
					<form action="" style="width: 200px; margin: 0;" >
						<select id="filter" onchange="filtering()">
						<!-- <select name="filter" onfocus='this.size=4;' onchange='this.size=1; this.blur();' onblur='this.size=0;'> -->
							<option value="">--select category--</option>
							<option value="ALL">모두 보기</option>
							<c:forEach items="${category }" var="entry">
								<option value="${entry.category }">${entry.category }</option>	
							</c:forEach>
						</select>
					</form>
				</div>
				<div style="height: 850px; overflow: auto;">
					<table style="table-layout: fixed; width: 80%;">
						<tr>
							<th class="th1">no.</th>
							<th>image</th>
							<th>id</th>
							<th>name</th>
							<th>category</th>
							<th>modify</th>
							<th>delete</th>
						</tr>
						<c:if test="${productList.size() == 0 or productList eq null}">
						<tr>
							<td colspan="7">no data.</td>
						</tr>
						</c:if>
						<c:forEach items="${productList }" var="entry">
							<tr>
								<td>${entry.rowno }</td>
								<td>
									<c:choose>
										<c:when test="${ entry.imageFileName != 'nan' }">
											<img width="100%" height="100%"
												src="${contextPath}/product/download?imageFileName=${entry.imageFileName }">
										</c:when>
										<c:otherwise>
											no image.
										</c:otherwise>
									</c:choose>
								</td>
								<td>${entry.id }</td>
								<td>${entry.name }</td>
								<td>${entry.category }</td>
								<td><input type="button" style="width:50px; cursor: pointer;" value="수정" 
									onclick="location.href='productInfo?productno=${entry.productno }'"></td>
								<td><input type="button" style="width:50px; cursor: pointer;" value="삭제" 
									onclick="productDelete('${entry.productno }','${entry.imageFileName }')"></td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="7">
								<div align="center">
									<c:if test="${current > 1 }">
										<a href="productlist?num=${current -1}">[이전]</a>
									</c:if>
		                  			<c:forEach var="num" begin="1" end="${repeat }">
			                     		<a href="productlist?num=${num }">[${num }]</a>
		                  			</c:forEach>
		                  			<c:if test="${current ne repeat && current > 1}">
										<a href="productlist?num=${current +1}">[다음]</a>
									</c:if>
	               				</div>
							</td>
						</tr>
						<tr>
							<td colspan="7">
								<div align="center">
									<input type="button" style="width:200px; cursor: pointer;" value="제품 등록" onclick="location.href='productinsertform'">
								</div>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<div class="bottom">
			<c:import url="../default/footer.jsp" />
		</div>
	</div>
</body>
</html>