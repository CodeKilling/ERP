<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재고 현황</title>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/js/default.css" >
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/js/login.css" >
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/js/memberlist.css" >
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/js/select.css" >

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

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
				<table style="table-layout: fixed; width: 80%; border: none;">
					<tr style="border: none;">
						<td class="th1" style="border: none;"></td>
						<td style="border: none;"></td>
						<td style="border: none;">
							<input style="width: 100%;" name="name" type="text" id="name-search" placeholder="제품명" class="table-search-filters">
						</td>
						<td style="border: none;">
							<input style="width: 100%;" name="category" type="text" id="category-search" placeholder="CATEGORY" class="table-search-filters">
						</td>
						<td style="border: none;"></td>
						<td style="border: none;">
							<input style="width: 100%;" name="account" type="text" id="account-search" placeholder="거래처" class="table-search-filters">
						</td>
						<td style="border: none;"></td>
						<td style="border: none;"></td>
					</tr>
				</table>
			</div>
			<br><br>
			<div style="height: 850px; overflow: auto;">
				<table id="custom-table" style="table-layout: fixed; width: 80%;">
					<thead>
						<tr>
							<th class="th1">no.</th>
							<th>제품ID</th>
							<th>제품명</th>
							<th>CATEGORY</th>
							<th>총량</th>
							<th>거래처</th>
							<th>연락처</th>
							<th>거래처 보유량</th>
						</tr>
						<c:if test="${inventory.size() eq 0 or inventory eq null }">
							<tr>
								<td colspan="8">no data.</td>
							</tr>
						</c:if>
					</thead>
					<tbody>
						<c:forEach items="${inventory }" var="entry">
							<tr>
								<td>${entry.rowNo }</td>
								<td>${entry.id }</td>
								<td>${entry.productName }</td>
								<td>${entry.category }</td>
								<td>${entry.productTotal }</td>
								<td>${entry.accountName }</td>
								<td>${entry.contact }</td>
								<td>${entry.warehouseTotal }</td>
							</tr>
						</c:forEach>
					</tbody>
						<tr>
							<td colspan="8">
								<div align="center">
									<c:if test="${current > 1 }">
										<a href="inventoryStatus?num=${current -1}">[이전]</a>
									</c:if>
		                  			<c:forEach var="num" begin="1" end="${repeat }">
			                     		<a href="inventoryStatus?num=${num }">[${num }]</a>
		                  			</c:forEach>
		                  			<c:if test="${current ne repeat && current > 0}">
										<a href="inventoryStatus?num=${current +1}">[다음]</a>
									</c:if>
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
<script type="text/javascript">

const sourceList = Array.from(document.querySelectorAll("#custom-table tbody tr"));

const nameFilter = (value, item) => !value || item.querySelector("td:nth-child(3)").textContent.toLowerCase().includes(value.toLowerCase());

const categoryFilter = (value, item) => !value || item.querySelector("td:nth-child(4)").textContent.toLowerCase().includes(value.toLowerCase());

const accountFilter = (value, item) => !value || item.querySelector("td:nth-child(6)").textContent.toLowerCase().includes(value.toLowerCase());

const mainFilter = ({name, category, account}, item) => {
  return nameFilter(name, item) && categoryFilter(category, item) && accountFilter(account, item);
}

const currentFilters = {
  name: '',
  category: '',
  account: '',
};

document.addEventListener('input', event => {
	console.log(sourceList);
	console.log(event.target);
  if (event.target.matches('.table-search-filters')) {
  
    currentFilters[event.target.name] = event.target.value;   
    sourceList.forEach(item => {
      const isVisible = mainFilter(currentFilters, item);

      item.style.display = !isVisible ? 'none' : 'table-row';
      console.log(item.style.display);
    })
  }
})

const table = document.querySelector('table');

</script>
</html>