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
	<c:when test="${command eq 'insert' }">
		제품 등록
	</c:when>
	<c:otherwise>
		제품 수정
	</c:otherwise>
</c:choose>
</title>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/js/default.css" >
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/js/login.css" >
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/js/memberlist.css" >
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/js/img.css" >
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/js/select.css" >


<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function readURL(input) {
		var file = input.files[0] //파일에 대한 정보
		console.log(file)
		if (file != '') {
			var reader = new FileReader();
			reader.readAsDataURL(file); //파일의 정보를 토대로 파일을 읽고 
			reader.onload = function(e) { // 파일 로드한 값을 표현한다
				//e : 이벤트 안에 result값이 파일의 정보를 가지고 있다.
				$('#preview').attr('src', e.target.result);
			}
		}
	}
	
	function Run(){
		var flag = false;
		$("#insertForm").find("input[type='text']").each(function(){
			if($(this).val().trim() == ''){
				alert($(this).attr("data-name") + " 항목을 입력하세요.");
				flag = true;
				return false;
			}
		});
		var category = document.getElementById("category");
		if(category.value == ""){
			alert("Category 항목을 선택하세요.");
			flag = true;
			return false;
		}
		/* var account = document.getElementById("account");
		if(category.value == ""){
			alert("Warehouse 항목을 선택하세요.");
			flag = true;
			return false;
		} */
		var input = document.getElementById("originFileName");
		if(input.value == ""){
			alert("Image 항목을 선택하세요.");
			flag = true;
			return false;
		}
		if(flag){
			return;
		}else{
			insertForm.submit();
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
			<%-- <c:if test="${msg ne null }">
				<script type="text/javascript">
					alert("${msg }");
				</script>
			</c:if> --%>
			<div class="content">
				<%-- <c:choose>
					<c:when test="${command eq 'insert' }">
				<form action="${contextPath }/product/productInsert" enctype="multipart/form-data" method="post" id="insertForm">	
					</c:when>
					<c:otherwise>
				<form action="${contextPath }/product/productModify" enctype="multipart/form-data" method="post" id="insertForm">					
					</c:otherwise>
				</c:choose> --%>
				
					<form action="
						<c:choose>
							<c:when test="${command eq 'insert' }">
								${contextPath }/product/productInsert
							</c:when>
							<c:otherwise>
								${contextPath }/product/productModify
							</c:otherwise>
						</c:choose>" enctype="multipart/form-data" method="post" id="insertForm"> 
				
					<label>ID : </label><br>
					<input type="text" name="id" data-name="id" placeholder="input product id" autofocus="autofocus" value="${product.id }"><br>
					<label>NAME : </label><br>
					<input type="text" name="name" data-name="name" placeholder="input product name" value="${product.name }"><br>
					<label>CATEGORY : </label><br>
					<select name="category" id="category">
						<option value="">--select category--</option>
						<c:forEach items="${category }" var="entry">
							<c:choose>
								<c:when test="${entry.category eq product.category }">
									<option value="${entry.category }" selected>${entry.category }</option>
								</c:when>
								<c:otherwise>
									<option value="${entry.category }">${entry.category }</option>	
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select><br><br>
					<%-- <label>WAREHOUSE : </label><br>
					<select name="account" id="account">
						<option value="">--select warehouse--</option>
						<c:forEach items="${account }" var="entry">
							<c:choose>
								<c:when test="${entry.accountName eq product.accountName }">
									<option value="${entry.accountNo }" selected>${entry.accountName}</option>
								</c:when>
								<c:otherwise>
									<option value="${entry.accountNo }">${entry.accountName}</option>	
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select><br><br> --%>
					
					<label>IMAGE : </label><br>
					<label for="upload" id="uploadlabel">select file</label><br>
					<input id="upload" type="file" name="image_file_name" onchange="readURL(this);" value="${product.imageFileName }"/><br>
					<c:choose>
      					<c:when test="${command eq 'insert' }">
      						<input type="hidden" id="originFileName" name="originFileName" value="nan"/><br>	
      					</c:when>
      					<c:otherwise>
      						<input type="hidden" id="originFileName" name="originFileName" value="${product.imageFileName }"/><br>
      					</c:otherwise>
      				</c:choose>
					
					<input type="hidden" name="productno" value="${product.productno }"/><br>
					
					<c:choose>
						<c:when test="${product.imageFileName != 'nan' }">
							<img id="preview" src="${contextPath}/product/download?imageFileName=${product.imageFileName}" width=200 height=200 alt="선택된 이미지가 없습니다" /><br>
						</c:when>
						<c:otherwise>
							<img id="preview" src="#" width=200 height=200 alt="선택된 이미지가 없습니다" /><br>	
						</c:otherwise>
					</c:choose>
      				
      				<c:choose>
      					<c:when test="${command eq 'insert' }">
      						<input type="button" value="Insert" style="cursor: pointer;" onclick="Run()"><br>	
      					</c:when>
      					<c:otherwise>
      						<input type="button" value="Modify" style="cursor: pointer;" onclick="Run()"><br>
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