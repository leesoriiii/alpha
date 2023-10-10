<%@page import="jakarta.servlet.jsp.tagext.Tag"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="jakarta.tags.core" %>
 <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list3.jsp</title>

<script type="text/javascript">

function setRegions(regions) {
	console.log(regions)
	let region = document.forms[0].region;
	region.innerText = "";
	
	let option = document.createElement('option');
	option.value = '';
	option.innerText = '전체';
	if (regionParam == null || regionParam == '')
		option.selected = true;
	
	for(let r of regions) {
		let option = document.createElement('option')
		option.value = r;
		option.innerText = r;
		if(r == regionParam)
			option.selected = true;
		region.append(option);
		
	}
}

window.onload = function() {
	let continent = document.forms[0].continent;
	let region = document.forms[0].region;
	
	continent.onchange = function() {
		console.log(this.value)
		let xhr = new XMLHttpRequest();
		xhr.open('GET', `/contry/regions?continent=${this.value}`)
		xhr.send();
		xhr.onload = e => {
			console.log(xhr.responseText)
			
		}
	}
	
	region.innerText="";
	
}
</script>
</head>
<body>
<h1>Country List</h1>
<hr>
<form action="/country/list">
<select name="continent">
	<c:choose>
	<c:when test="${empty param.continent}">
		<option value="${continents}" selected="selected">전체</option>
	</c:when>
	<c:otherwise>
		<option value="">전체</option>
	</c:otherwise>
	</c:choose>
<c:forEach var="continent" items="${continents}">
	<c:choose>
	<c:when test="${param.continent eq continent}">
		<option value="${continent}" selected="selected">${continent}</option>
	</c:when>
	<c:otherwise>
		<option value="${continent}">${continent}</option>
	</c:otherwise>
	</c:choose>
</c:forEach>
</select>
<select name="region">
<!-- option은 javastript에서 ajax를 이용하여 만들고 있음  -->
	<c:choose>
	<c:when test="${empty param.region}">
		<option value="${regions}" selected="selected">전체</option>
	</c:when>
	<c:otherwise>
		<option value="">전체</option>
	</c:otherwise>
	</c:choose>
<c:forEach var="region" items="${regions}">
	<c:choose>
	<c:when test="${param.region eq region}">
		<option value="${region}" selected="selected">${region}</option>
	</c:when>
	<c:otherwise>
		<option value="${region}" >${region}</option>
	</c:otherwise>
	</c:choose>
</c:forEach>
</select>
<input type="submit" value="조회">
</form>
<hr>
<table border="1">
	<thead>
	<tr>
		<th>no</th>
		<th>code</th>
		<th>name</th>
		<th>continent</th>
		<th>region</th>
		<th>surfaceArea</th>
		<th>indepYrar</th>
		<th>population</th>
		<th>lifeExpectancy</th>
		<th>gnp</th>
		<th>gnpOld</th>
		<th>localName</th>
		<th> governmentForm</th>
		<th>headOfState</th>
		<th>capltal</th>
		<th>code2</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach var="c" items="${list}" varStatus="status">
	<tr>
		<td>${status.count}</td>
		<td>${c.code}</td>
		<td>${c.name}</td>
		<td>${c.continent}</td>
		<td>${c.region}</td>
		<td>${c.surfaceArea}</td>
		<td>${c.indepYrar}</td>
		<td>${c.population}</td>
		<td>${c.lifeExpectancy}</td>
		<td>${c.gnp}</td>
		<td>${c.gnpOld}</td>
		<td>${c.localName}</td>
		<td>${c.governmentForm}</td>
		<td>${c.headOfState}</td>
		<td>${c.capltal}</td>
		<td>${c.code2}</td>
	</tr>
	</c:forEach>
	</tbody>
</table>
</body>
</html>