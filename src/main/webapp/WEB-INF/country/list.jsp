<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list.jsp</title>
<style type="text/css">
*{
    padding: 10px;
}
#heading{
    color: white;
    font-size: 50px;
    text-shadow: 2px 2px #f19292;
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
tbody > tr:hover{
	background: #FAD1D1;
}
hr {
  border: none; /* 기본 테두리 제거 */
  border-top: 3px dotted #ffffff; 
  width: 400px; 
  margin: 10px 0; /* 위아래 여백 추가 (선택적) */
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
select {
  border: 1px solid #f19292; /* 테두리 스타일 및 색상 설정 */
  border-radius: 5px; /* 테두리의 모서리를 둥글게 만듭니다. */
  padding: 5px; /* select 요소 내의 여백 설정 */
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
<script type="text/javascript">

function setRegions(regions){
	console.log(regions)
	let region = document.forms[0].region;
	region.innerTaxt="";
	
	let regionParam = new URL(location.href).searchParams.get('region');
	
	let option = document.createElement('option');
	option.value='';
	option.innerText = '전체';
	if(regionParam == null || regionParam == '')
		option.selected = true;
	region.append(option);
	
	for(let r of regions){
		let option = document.createElement('option');
		option.value = r;
		option.innerText = r;
		if(r==regionParam)
			option.selected = true;
		region.append(option);
	}
	
}

window.onload = function(){
	let continent = document.forms[0].continent;
	
	
	continent.onchange = function(){
		
		console.log(this.value);
		let xhr = new XMLHttpRequest();
		xhr.open('GET', `/country/regions?continent=\${this.value}`)
		xhr.send();
		xhr.onload = e =>{
			
			setRegions(JSON.parse(xhr.responseText));
//			console.log(xhr.responseText)
		}
		
		
	}
	
	continent.onchange();
	
	
//	region.innerTaxt="";
}
</script>
</head>
<body>
<h1 id='heading'>Country List</h1>
<hr>
<form action="/country/list">
<select name="continent">
 <c:choose>
 <c:when test="${empty param.continent}">
   <option id="option" value="" selected="selected">전체</option>
 </c:when>
 <c:otherwise>
   <option value="">전체</option> 
 </c:otherwise>
 </c:choose>
<!-- <option value="">전체</option> -->
 <c:forEach var="continent" items="${continents}">
 <c:choose>
 <c:when test="${param.continent eq continent}">
   <option value="${continent}" selected="selected">${continent}</option>
 </c:when>
 <c:otherwise>
   <option value="${continent}">${continent}</option>
 </c:otherwise>
 </c:choose>
<%--     <option value="${continent}">${continent}</option> --%>
  </c:forEach>
</select>
<select name="region">
<!-- <option value="">전체</option> 옵션은 자바스크립트의 ajax를 이용해서 만들고 있으므로 여기서는 주석처리-->
<%--   <c:forEach var="region" items="${regions}"> --%>
<%--     <option value="${region}">${region}</option> --%>
<%--   </c:forEach> --%>
</select>
<input id="button" type="submit" value="조회">
</form>
<hr>
<table>
  <thead>
   <tr>
    <th>no</th>
    <th>code</th>
    <th>name</th>
    <th>continent</th>
    <th>region</th>
    <th>surfaceArea</th>
    <th>indepYear</th>
    <th>population</th>
    <th>lifeExpectancy</th>
    <th>gnp</th>
    <th>gnpOld</th>
    <th>localName</th>
    <th>governmentForm</th>
    <th>heatOfState</th>
    <th>capital</th>
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
        <td>${c.indepYear}</td>
        <td>${c.population}</td>
        <td>${c.lifeExpectancy}</td>
        <td>${c.gnp}</td>
        <td>${c.gnpOld}</td>
        <td>${c.localName}</td>
        <td>${c.governmentForm}</td>
        <td>${c.headOfState}</td>
        <td>${c.capital}</td>
        <td>${c.code2}</td>
      </tr>
    </c:forEach>
  </tbody>
</table>
</body>
</html>