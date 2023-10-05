<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>race.jsp</title>
<style>

#surface {
	border-collapse: collapse;
	font-family: monospace;
	font-size: 1.5em;
	background-color: red;
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
	tdAlpha.align = 'right';
	tdCount.align = 'right';
	
	tdNo.innerText = tr.parentElement.rows.length;
	
	tdAlpha.innerText = alpha.ch;
	tdAlpha.style.color = alpha.fg;
	tdAlpha.style.background = alpha.bg;
	
	tdCount.innetText = 0;
		
	setTimeout(function move() {
		
		let td = surface.rows[alpha.line-1].cells[alpha.column-1];
		td.style.color = "Black";
		td.style.background = "Black";
		
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
<h1 style="color:#f19292">Ajax->fetch 활용</h1>
<button id="startBtn">Start</button>
<hr>
<table border="1" width="400">
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
<table id="stat" width="400" border="1">
	<thead>
		<tr>
			<th>no</th><th>alpha</th><th>Roundcount</th>
		</tr>
	</thead>
	<tbody align="right">
	</tbody>
</table>
<table id="surface" onmousedown="event.preventDefault()" oncontextmenu="evevt.preventDefault();">
	<tbody>
	<c:forEach var="i" begin="0" end="${surface.size()-1}">
		<tr>
		<c:forEach var="j" begin="0" end="${surface.get(i).size()-1}">
			<c:set var="alpha" value="${surface[i][j]}"/>
			<td style="color: black; background: black">${alpha.ch}</td>
		</c:forEach>
		</tr>
	</c:forEach>
	</tbody>
</table>
</section>
</body>
</html>
