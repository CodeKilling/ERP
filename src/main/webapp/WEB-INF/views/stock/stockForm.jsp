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
		입고 등록
	</c:when>
	<c:otherwise>
		입고 수정
	</c:otherwise>
</c:choose>
</title>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/js/default.css" >
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/js/login.css" >
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/js/memberlist.css" >
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/js/img.css" >
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/js/select.css" >
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/js/date.css" >

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function Run(){
		var flag = false;
		$("#form").find("input[type='text']").each(function(){
			if($(this).val().trim() == ''){
				alert($(this).attr("data-name") + " 항목을 입력하세요.");
				flag = true;
				return false;
			}
		});
		var product = document.getElementById("product");
		if(product.value == ""){
			alert("제품 항목을 선택하세요.");
			flag = true;
			return false;
		}
		var account = document.getElementById("account");
		if(account.value == ""){
			alert("거래처 항목을 선택하세요.");
			flag = true;
			return false;
		}
		var count = document.getElementById("count");
		if(count.value == ""){
			alert("수량 항목을 입력하세요.");
			flag = true;
			return false;
		}
		var date = document.getElementById("date");
		if(date.value == ""){
			alert("입고일 항목을 선택하세요.");
			flag = true;
			return false;
		}
		/* var input = document.getElementById("upload");
		if(input.value == ""){
			alert("Image 항목을 선택하세요.");
			flag = true;
			return false;
		} */
		if(flag){
			return;
		}else{
			form.submit();
		}
	}
	
	function chkCount(event){
		var num = event.target.value;
		if(num < 0){
			alert("0보다 크거나 같아야 합니다.");
			event.target.value = 0;
		}
	}
	
	window.onload = function() {
		today = new Date();
		console.log("today.toISOString() >>>" + today.toISOString());
		today = today.toISOString().slice(0, 10);
		console.log("today >>>> " + today);
		date = document.getElementById("date");
		date.value = today;
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
								${contextPath }/stock/stockInsert
							</c:when>
							<c:otherwise>
								${contextPath }/stock/stockModify
							</c:otherwise>
						</c:choose>" method="post" id="form"> 
				
					<label>NAME : </label><br>
					<input type="text" name="name" data-name="NAME" placeholder="input stock name" autofocus="autofocus" value="${stock.name }"><br>
					<label>COMMENTS : </label><br>
					<input type="text" name="comments" data-name="COMMENTS" placeholder="input stock comments" value="${stock.comments }"><br>
					<label>입고일 : </label><br>
					<input type="date" id="date" name="stockDay" value="${stock.stockDay }" ><br>
					
					<label>제품 : </label><br>
					<select name="productNo" id="product">
						<option value="">--select product--</option>
						<c:forEach items="${product }" var="entry">
							<c:choose>
								<c:when test="${entry.spNo eq stock.productNo }">
									<option value="${entry.spNo }" selected>${entry.spName }</option>
								</c:when>
								<c:otherwise>
									<option value="${entry.spNo }">${entry.spName }</option>	
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select><br>
					
					<label>수량 : </label><br>
					<input type="number" id="count" min="0" onkeyup="chkCount(event)" name="count" data-name="수량" placeholder="input product 수량" value="${stock.count }"><br>
					<c:if test="${command eq 'Modify' }">
						<input type="hidden" name="originCount" value="${stock.count }">
					</c:if>
					<label>거래처 : </label><br>
					<select name="accountNo" id="account">
						<option value="">--select account--</option>
						<c:forEach items="${account }" var="entry">
							<c:choose>
								<c:when test="${entry.saNo eq stock.accountNo }">
									<option value="${entry.saNo }" selected>${entry.saName }</option>
								</c:when>
								<c:otherwise>
									<option value="${entry.saNo }">${entry.saName }</option>	
								</c:otherwise>
							</c:choose>
							<%-- ${entry.saNo }<br> --%>
						</c:forEach>
					</select><br>
					<label>검수 : </label><br>
					<select name="confirm" id="confirm">
						<c:choose>
							<c:when test="${stock.confirm eq 'true' }">
								<option value="true" selected>Confirmed.</option>
								<option value="false" >Not Confirm.</option>
							</c:when>
							<c:otherwise>
								<option value="true" >Confirmed.</option>
								<option value="false" selected>Not Confirm.</option>	
							</c:otherwise>
						</c:choose>
					</select><br><br>
					
					<c:if test="${command eq 'Modify' }">
						<input type="hidden" name="stockNo" value="${stock.stockNo }" >
					</c:if>
					<input type="button" value="${command }" style="cursor: pointer;" onclick="Run()"><br>
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