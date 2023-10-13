<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list.jsp</title>
<style type="text/css">
@font-face {
    font-family: 'Dovemayo_gothic';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.1/Dovemayo_gothic.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
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
th{
	color: white;
	background-color: #f19292;
	border:  solid #f19292;
}
td{
	border: 1px solid white;
}

tr {
	background-color: white;
}
#textBox input[type="text"] {
	border: 1px solid #f19292;
	border-radius: 5px; /* 테두리의 모서리를 둥글게 만듭니다. */
	padding: 5px; /* 텍스트 상자 내의 여백 설정 */
}
select {
  border: 1px solid #f19292; /* 테두리 스타일 및 색상 설정 */
  border-radius: 5px; /* 테두리의 모서리를 둥글게 만듭니다. */
  padding: 5px; /* select 요소 내의 여백 설정 */
}
#right {
	text-align: right;
}
#center {
	text-align: center;
}
#heading{
    color: white;
    font-size: 50px;
    text-shadow: 2px 2px #f19292;
}
#button {
    margin: 0 10px; /* 버튼 사이의 간격 조절 */
    background-color: white;
    color: #f19292;
    border: 2px solid white;
    border-radius: 50px;
    box-shadow: 2px 2px 4px rgba(250, 133, 133, 0.5);
}
</style>
</head>
<body>
<h1 id="heading">Emp List</h1>
<hr>
<form id="textBox" action="/emp/list">
	<label style="color: #f19292; font-family: 'Dovemayo_gothic'; font-size: 1.5em; text-shadow: 2px 2px white;" >부서 선택</label>
	<select name="deptno">
			<c:choose>
			<c:when test="${empty param.deptno}">
				<option value="" selected="selected">전체</option>
			</c:when>
			<c:otherwise>
				<option value="">전체</option>
			</c:otherwise>
			</c:choose>
		<c:forEach var="dept" items="${depts}">
			<c:choose>
			<c:when test="${param.deptno eq dept.deptno}">
				<option value="${dept.deptno}" selected="selected">${dept.deptno} ${dept.dname}</option>
			</c:when>
			<c:otherwise>
				<option value="${dept.deptno}">${dept.deptno} ${dept.dname}</option>
			</c:otherwise>
			</c:choose>
		</c:forEach>
	</select>
	<input type="text" name="search">
	<input id="button" type="submit" value="직원검색">
</form>
<hr>
<table width="800">
	<thead>
		<tr>
			<th>empno</th>
			<th>ename</th>
			<th>gender</th>
			<th>job</th>
			<th>mgr</th>
			<th>hiredate</th>
			<th>sal</th>
			<th>comm</th>
			<th>deptno</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="emp" items="${list}">
		<tr id="center">
			<td>${emp.empno}</td>
			<td>${emp.ename}</td>
			<td>${emp.gender}</td>
			<td>${emp.job}</td>
			<td>${emp.mgr}</td>
			<td>${emp.hiredate}</td>
			<td align="right">${emp.sal}</td>
			<td align="right">${emp.comm}</td>
			<td>${emp.deptno}</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
</body>
</html>