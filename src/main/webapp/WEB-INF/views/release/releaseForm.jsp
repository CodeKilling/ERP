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
		/* var product = document.getElementById("product");
		if(product.value == ""){
			alert("제품 항목을 선택하세요.");
			flag = true;
			return false;
		} */
		/* var account = document.getElementById("account");
		if(account.value == ""){
			alert("거래처 항목을 선택하세요.");
			flag = true;
			return false;
		} */
		var count = document.getElementById("count");
		if(count.value == ""){
			alert("수량 항목을 입력하세요.");
			flag = true;
			return false;
		}
		/* var date = document.getElementById("date");
		if(date.value == ""){
			alert("출고일 항목을 선택하세요.");
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
			return false;
		}
		var total = document.getElementById("totalCount");
		var origin = document.getElementById("originCount");
		if(num > (total.value * 1)){
			console.log(num);
			console.log(total.value);
			alert("현재 재고를 초과하여 출고 할 수 없습니다.");
			event.target.value = origin.value;
			return false;
		}
	}
	
	window.onload = function() {
		offset = new Date().getTimezoneOffset() * 60000;
		today = new Date(Date.now() - offset);
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
								${contextPath }/release/releaseInsert
							</c:when>
							<c:otherwise>
								${contextPath }/release/releaseModify
							</c:otherwise>
						</c:choose>" method="post" id="form"> 
				
					<label>NAME : </label><br>
					<input type="text" name="name" data-name="NAME" placeholder="input release name" readonly="readonly" value="${stock.name }"><br>
					<label>COMMENTS : </label><br>
					<input type="text" name="comments" data-name="COMMENTS" placeholder="input release comments" readonly="readonly" value="${stock.comments }"><br>
					<c:choose>
						<c:when test="${command eq 'Insert' }">
							<label>입고일 : </label><br>
							<input type="date" readonly="readonly" value="${stock.stockDay }" ><br>		
						</c:when>
						<c:otherwise>
							<label>출고일 : </label><br>
							<input type="date" readonly="readonly" value="${stock.releaseDay }" ><br>
						</c:otherwise>
					</c:choose>
					
					<label>제품 : </label><br>
					<input type="text" name="productName" data-name="productName" readonly="readonly" value="${stock.productName }"><br>
					<input type="hidden" name="productNo" data-name="productNo" readonly="readonly" value="${stock.productNo }"><br>
					<%-- <label>제품 : </label><br>
					<select name="productNo" id="product">
						<option value="">--select product--</option>
						<c:forEach items="${product }" var="entry">
							<c:choose>
								<c:when test="${entry.rpNo eq release.productNo }">
									<option value="${entry.rpNo }" selected>${entry.rpName }</option>
								</c:when>
								<c:otherwise>
									<option value="${entry.rpNo }">${entry.rpName }</option>	
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select><br> --%>
					
					<label>거래처 : </label><br>
					<input type="text" name="accountName" data-name="accountName" readonly="readonly" value="${stock.accountName }"><br>
					<input type="hidden" name="accountNo" data-name="accountNo" readonly="readonly" value="${stock.accountNo }"><br>
					<%-- <label>거래처 : </label><br>
					<select name="accountNo" id="account">
						<option value="">--select account--</option>
						<c:forEach items="${account }" var="entry">
							<c:choose>
								<c:when test="${entry.raNo eq release.accountNo }">
									<option value="${entry.raNo }" selected>${entry.raName }</option>
								</c:when>
								<c:otherwise>
									<option value="${entry.raNo }">${entry.raName }</option>	
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select><br> --%>
					
					
					<label>현재재고량 : </label><br>
					<input type="number" id="totalCount" readonly="readonly" value="${stock.totalCount }"><br>
					
					<label>출고량 : </label><br>
					<c:choose>
						<c:when test="${command eq 'Insert' }">
							<input type="number" id="count" min="0" onkeyup="chkCount(event)" name="count" autofocus="autofocus" data-name="수량" placeholder="input product 수량" value="${stock.totalCount }"><br>
							<input type="hidden" id="originCount" name="originCount" value="${stock.totalCount }"><br>
						</c:when>
						<c:otherwise>
							<input type="number" id="count" min="0" onkeyup="chkCount(event)" name="count" autofocus="autofocus" data-name="수량" placeholder="input product 수량" value="${stock.count }"><br>
							<input type="hidden" id="originCount" name="originCount" value="${stock.count }"><br>
						</c:otherwise>
					</c:choose>
					
					
					<label>출고일 : </label><br>
					<input type="date" id="date" name="releaseDay" ><br>
					
					<c:choose>
						<c:when test="${command eq 'Insert' }">
						</c:when>
						<c:otherwise>
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
						</c:otherwise>
					</c:choose>
					
					
					<c:if test="${command eq 'Modify' }">
						<input type="hidden" name="releaseNo" value="${stock.releaseNo }" >
					</c:if>
					<c:choose>
						<c:when test="${command eq 'Insert' }">
							<input type="button" value="출고" style="cursor: pointer;" onclick="Run()"><br>
						</c:when>
						<c:otherwise>
							<input type="button" value="수정" style="cursor: pointer;" onclick="Run()"><br>
						</c:otherwise>
					</c:choose>
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