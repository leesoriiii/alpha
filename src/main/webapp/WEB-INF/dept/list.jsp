<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>    
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
<h1 id="heading">Dept List</h1>
<hr>
<form id="textBox" action="/dept/list">
	<input type="text" name="search">
	<input id="button" type="submit" value="부서검색">
</form>
<hr>
<table width= "500px" style="text-align: center;">
	<thead>
		<tr>
			<th>deptno</th>
			<th>dname</th>
			<th>loc</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="dept" items="${list}">
		<tr>
			<td>${dept.deptno}</td>
			<td>${dept.dname}</td>
			<td>${dept.loc}</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
</body>
</html>