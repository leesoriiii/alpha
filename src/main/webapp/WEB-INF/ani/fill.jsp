<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fill.jsp</title>
<style type="text/css">
#surface{
	border-collapse: collapse;
	font-family: monospace;
	font-size:1.5em;
	border:10px solid #f19292;
	background: url('/media/alpha.png');
/*	background-repeat: no-repeat;    배경이 크기가 모자라도 하나만 나옴*/
	}
#heading{
    color: white;
    font-size: 50px;
    text-shadow: 2px 2px #f19292;
}
body {
	background-color: #FAD1D1;
	display: flex;
 	flex-direction: column;
    justify-content: center;
	justify-content: center;
    align-items: center;
}
button {
    margin: 0 10px; /* 버튼 사이의 간격 조절 */
    background-color: #f19292;
    color: white;
    border: 2px solid #f19292;
    border-radius: 50px;
    box-shadow: 2px 2px 4px rgba(250, 133, 133, 0.5);
}
hr {
  border: none; /* 기본 테두리 제거 */
  border-top: 3px dotted #ffffff; 
  width: 500px; /* 가로 너비 */
  margin: 10px 0; /* 위아래 여백 추가 (선택적) */
}
#Xcount {
	color: white;
	border: 1px solid #ffffff; 
	border-collapse: collapse;
	background-color: #f19292;
}
#surface td{
     opacity: 0.5;
     position:relative;
     
     top:0px;
     left:0px;
     transition:left 2s, transform 4s;
/*      transition:all 2s; */
/*      transition-delay:200ms;   */
}
</style>
<script type="text/javascript">
window.onload = function(){
//	surface.onmousedown = e => e.preventDefault(); //브라우져 기본 마우스기능 차단, 
//  밑의 테이블 태그안의 onmousedown="event.preventDefault();" 과 동일 기능, oncontextmenu은 우측마우스기능
}
function startBtn_click(e){ //button tag의 startBtn_click(event)의 event를 매개변수e로 표현
	console.log("start");
	start.disabled = true;
	clear.disabled = true;
	
	let timer = setInterval(function(){
		seconds.innerText = ++seconds.innerText;
	}, 1000)
	
	
	
	let tid = setInterval(function(){
		
		forCount.innerText = ++forCount.innerText;  //자바스크립트는 문자열이지만 산술연산자 붙으면 숫자로 바꾼다 그리고 다시 문자열로 변경됨
		if(count.innerText == 800){
			clearInterval(tid);
			clearInterval(timer);
			start.disabled = false;
			clear.disabled = false;
			
			Array.from(surface.rows).forEach(function(row) {
				   Array.from(row.cells).forEach(function(td) {
					    td.style.color = 'black';
						td.style.left = '0px';
					});
				  });
			
			return; //return없애려면 if문을 setInterval 마지막에 두면 된다
		}
		let xhr = new XMLHttpRequest();
		xhr.open('GET', '/ani/data');
		xhr.responseType = 'json';
		xhr.onload = e =>{
			let alpha = xhr.response;
			console.log(alpha);
			
			let td = surface.rows[alpha.line-1].cells[alpha.column-1];
			
			if(td.style.color =='black' && td.style.background =='black'){
				count.innerText = ++count.innerText;
//				setTimeout(() => td.style.left="700px",1); 
 				td.style.left = "700px";
 				td.style.transform = `rotate(\${360*10}deg)`;
			}
			
			td.style.color = alpha.fg;
			td.style.background = alpha.bg;
			td.innerText = alpha.ch;
		}
		xhr.send();
	}, 10);
	
	
}


function clearBtn_click(e){
	console.log("clear");
/*	for(let i=0; i<surface.rows.length; i++){
		for(let j=0; j<surface.rows[i].cells.length; j++){
			surface.rows[i].cells[j].style.color = 'black';
			surface.rows[i].cells[j].style.background = 'black';
		}*/
/*	for(let row of surface.rows){
		for(let td of row.cells){
			td.style.color = 'black';
			td.style.background = 'black';
		}*/
		
	Array.from(surface.rows).forEach(function(row) {
	   Array.from(row.cells).forEach(function(td) {
		    td.style.color = 'black';
			td.style.background = 'black';
		});
	  });	
		
		
	forCount.innerText = 0;
	count.innerText = 0;
	seconds.innerText = 0;
	
	
	
}
</script>
</head>
<body>
<h1 id="heading">Transition/Position(Spring MVC + XMLHttpRequest)</h1>
<hr>
<button id="start" onclick="startBtn_click(event);">Start</button>
<button id="clear" onclick="clearBtn_click(event);">Clear</button>
<hr>
<table id="Xcount" border="1" width="500">
  <thead>
  <tr>
  	<th>forCount</th><th>count</th><th>seconds</th>
  </tr>
  </thead>
  <tbody>
  <tr>
    <td id="forCount" align="right">0</td>
    <td id="count"    align="right">0</td>
    <td id="seconds"  align="right">0</td>
  </tr>
  </tbody>
</table>
<hr>
<table id="surface" onmousedown="event.preventDefault();" oncontextmenu="event.preventDefault();">
  <tbody>
    <c:forEach var="row" items="${surface}">
      <tr>
    	<c:forEach var="alpha" items="${row}">
   	      <td style="color: ${alpha.fg}; background: ${alpha.bg};">${alpha.ch}</td> 
<%--           <td style="color:black; background:black">${alpha.ch}</td> --%>
<%-- 	 	  <td> ${alpha.ch}</td>  --%>
    	</c:forEach>
      </tr>	  
    </c:forEach>  
  </tbody>
</table>
<hr>

</body>
</html>