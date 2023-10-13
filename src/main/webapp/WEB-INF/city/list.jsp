<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list.jsp</title>
<style type="text/css">
body {
	background-color: #FAD1D1;
    margin: 0; /* body의 마진을 제거 */
    padding: 0; /* body의 패딩을 제거 */
    display: flex;
    flex-direction: column;
    align-items: center;
    width: 100%;
    height: 100%;
}
select {
  border: 1px solid #f19292; /* 테두리 스타일 및 색상 설정 */
  border-radius: 5px; /* 테두리의 모서리를 둥글게 만듭니다. */
  padding: 5px; /* select 요소 내의 여백 설정 */
}
th{
	color: white;
	background-color: #f19292;
	border:  solid #f19292;
}
td{
	background-color: white;
	border: 1px solid white;
}
hr {
  border: none; /* 기본 테두리 제거 */
  border-top: 3px dotted #ffffff; 
  width: 500px; 
  margin: 10px 0; /* 위아래 여백 추가 (선택적) */
}
#right {
	text-align: right;
}
#center {
	text-align: center;
}
#button {
    margin: 0 10px; /* 버튼 사이의 간격 조절 */
    background-color: white;
    color: #f19292;
    border: 2px solid white;
    border-radius: 50px;
    box-shadow: 2px 2px 4px rgba(250, 133, 133, 0.5);
  }
#heading{
    color: white;
    font-size: 50px;
    text-shadow: 2px 2px #f19292;
}
</style>
</head>
<body>
<h1 id="heading">City List</h1>
<hr>
<form action="/city/list">
<select name="code">
	<c:choose>
	<c:when test="${empty param.code}">
		<option value="" selected="selected">전체</option>
	</c:when>
	<c:otherwise>
		<option value="">전체</option>
	</c:otherwise>
	</c:choose>
<c:forEach var="m" items="${codes}">
	<c:choose>
	<c:when test="${!empty param.code and param.code eq m.code}">
		<option value="${m.code}" selected="selected">[${m.code}] ${m.name}</option>
	</c:when>
	<c:otherwise>
		<option value="${m.code}">[${m.code}] ${m.name}</option>
	</c:otherwise>
	</c:choose>
</c:forEach>	
</select>
<input id="button" type="submit" value="도시검색">
</form>
<hr>
<table>
	<thead>
		<tr>
			<th>no</th>
			<th>id</th>
			<th>name</th>
			<th>countryCode</th>
			<th>district</th>
			<th>population</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="city" items="${list}" varStatus="status">
		<tr>
			<td id="right">${status.count}</td>
			<td id="right">${city.id}</td>
			<td>${city.name}</td>
			<td id="center">${city.countryCode}</td>
			<td>${city.district}</td>
			<td id="right">${city.population}</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
</body>
</html>