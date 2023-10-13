<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>race.jsp</title>
<style>
body {
	display: flex;
 	flex-direction: column;
    justify-content: center;
	justify-content: center;
    align-items: center;
}

#surface {
	border-collapse: collapse;
	font-family: monospace;
	font-size: 1.5em;
	background-color: #f19292;
	background-image: url('/img/BackgroundFront.png'), url('/img/BackgroundBack.png');
	background-size: 100%;
	background-repeat: no-repeat;
	
	
}
#surface td {
	opacity: 0.7;
	
}
#startBtn {
	padding: 5px 10px;
}
table {
	border: 3px solid #ffffff; 
	border-collapse: collapse;
	background-color: #f19292;
	}

hr {
  border: none; /* 기본 테두리 제거 */
  border-top: 3px dotted #f19292; /* 상단 테두리 설정 (빨간색) */
  width: 400px; /* 가로 너비 */
  margin: 10px 0; /* 위아래 여백 추가 (선택적) */
}


button {
    margin: 0 10px; 
    background-color: #f19292;
    color: white;
    border: 2px solid #f19292;
    border-radius: 50px;
    box-shadow: 2px 2px 4px rgba(250, 133, 133, 0.5);
  }
#heading{
    color: #f19292;
    font-size: 50px;
    text-shadow: 2px 2px #FAD1D1;
}

#Xcount {
	border: 3px solid #ffffff; 
	border-collapse: collapse;
	background-color: #f19292;
} 
  
  
</style>

<script type="text/javascript">

function race(alpha) {
	
	console.log("race().."+alpha)
	
	let speed = Math.random() * 100 + 10;
	let direction = 0; // 0: right, 1: down, 2: laft, 3:up
	
	alpha.line = 1;
	alpha.column = 1;
	
	let td = surface.rows[alpha.line-1].cells[alpha.column-1];
	td.style.color = alpha.fg;
	td.style.background = alpha.bg;
	td.innerText = alpha.ch;
		
	let tr 		= document.createElement('tr');
	let tdNo 	= document.createElement('td');
	let tdAlpha = document.createElement('td');
	let tdCount = document.createElement('td');
	
	tr.append(tdNo);
	tr.append(tdAlpha);
	tr.append(tdCount);

	stat.tBodies[0].append(tr);
	
	tdNo.align = 'right';
	tdAlpha.align = 'center';
	tdCount.align = 'right';
	
	tdNo.innerText = tr.parentElement.rows.length;
	
	tdAlpha.innerText = alpha.ch;
	tdAlpha.style.color = alpha.fg;
	tdAlpha.style.background = alpha.bg;
	
	tdCount.innetText = 0;
		
	setTimeout(function move() {
		
		let td = surface.rows[alpha.line-1].cells[alpha.column-1];
		td.style.color = "white";
		td.style.background = "white";
		
		switch(direction) {
		case 0: //right
			alpha.column++
			break;
		case 1: // down
			alpha.line++
			break;
		case 2: // left
			alpha.column--;
			break;
		case 3: // up
			alpha.line--;
			break;
		}
		
		console.log(`[\${alpha.line},\${alpha.column}]`)
		
		
		if(alpha.line == 1 && alpha.column == 1){
			direction = 0;
			roundCount.innerText = ++roundCount.innerText;
			tdCount.innerText = ++tdCount.innerText;
		}
		else if(alpha.line == 1 && alpha.column == 40)
			direction = 1;
		else if(alpha.line == 20 && alpha.column == 40)
			direction = 2;
		else if(alpha.line == 20 && alpha.column == 1)
			direction = 3; 
		
		
		td = surface.rows[alpha.line-1].cells[alpha.column-1];
		td.style.color = alpha.fg;
		td.style.background = alpha.bg;
		td.innerText = alpha.ch;
		
		setTimeout(move, speed);
	}, speed);
	
	if(count.innerText == 1) {
		setInterval(function() {
			ellipse.innerText = ++ellipse.innerText;
		}, 1000);
	}
	
}
	

window.onload = function() {
	startBtn.onclick = e => {
		
		count.innerText = ++count.innerText;
		
		fetch('/alpha/data')
		.then(response => response.json())
		.then(alpha => {
			race(alpha);
		});
		
	}
}
</script>
<style type="text/css">
section > table {
	float: left;
	margin: 10px;
}
</style> 
</head>
<body>
<h1 id="heading">Ajax->fetch 활용</h1>
<button id="startBtn">Start</button>
<hr>
<table style="color: white;" border="1" width="400">
	<thead>
		<tr>
		<th>roundCount</th><th>count</th><th>ellipse</th>
		</tr>
	</thead>
	<tbody>
		<tr>
		<td id="roundCount" align="right">0</td>
		<td id="count" align="right">0</td>
		<td id="ellipse" align="right">0</td>
		</tr>
	</tbody>
</table>
<hr>
<section>
<table style="color: white;" id="stat" width="400" border="1">
	<thead>
		<tr>
			<th>no</th><th>alpha</th><th>Roundcount</th>
		</tr>
	</thead>
	<tbody style="color: white;" align="right">
	</tbody>
</table>
<table id="surface" onmousedown="event.preventDefault()" oncontextmenu="evevt.preventDefault();">
	<tbody>
	<c:forEach var="i" begin="0" end="${surface.size()-1}">
		<tr>
		<c:forEach var="j" begin="0" end="${surface.get(i).size()-1}">
			<c:set var="alpha" value="${surface[i][j]}"/>
			<td style="color: white; background: white">${alpha.ch}</td>
		</c:forEach>
		</tr>
	</c:forEach>
	</tbody>
</table>
</section>
</body>
</html>
