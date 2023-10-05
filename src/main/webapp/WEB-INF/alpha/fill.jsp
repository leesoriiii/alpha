
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fill.jsp</title>
<style type="text/css">
#surface { 
 	border-collapse: collapse;
	font-family: monospace;
	font-size: 2em;
	border: 20px solid #f19292;
	background: url('../media/rose.png');
	background-repeat: no-repeat;
}
#surface td {
	opacity: 0.5; 
	text-align: center;
	vertical-align: middle;
}
#Xcount {
	border: 2px solid #ff8c88; 
	border-collapse: collapse;
}
</style>
 <script type="text/javascript">

let tid;
let timer;
 
function startBtn_click(e) {
	start.disabled = true;
	clear.disabled = false;
	
	timer = setInterval(function() {
		seconds.innerText = ++seconds.innerText;
	}, 1000)
	
	tid = setInterval(function() {
		
		forCount.innerText = ++forCount.innerText;	
		
		if(count.innerText == 800) {
			clearInterval(tid);
			return;
		}
		
		let xhr = new XMLHttpRequest();
		xhr.open('GET', '/alpha/data');
		xhr.responseType = 'json';
		xhr.onload = e => {
			let alpha = xhr.response;
			//console.log(alpha);
			
			let td = surface.rows[alpha.line-1].cells[alpha.column-1];
						
			if(td.style.color=='black' && td.style.backgroundColor=='black') {
				count.innerText = ++count.innerText;
			}
			
			td.style.color = alpha.fg;
			td.style.background = alpha.bg;
			td.style.innerText = alpha.ch;
			
			
		}
		xhr.send();
	}, 30);
}
function clearBtn_click(e) {
	start.disabled = true;
	/*
	for(let i=0; i<surface.rows.length; i++) {
		for(let j=0; j<surface.rows[i].cells.length; j++) {
			surface.rows[i].cells[j].style.color = 'black'
			surface.rows[i].cells[j].style.background = 'black'
			
		}
	}
	*/
	/*
	for(let row of surface.rows) {
		for(let td of row.cells) {
			td.style.color = 'black';
			td.style.background = 'black';
		}
	}
	*/
	
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
function stopBtn_click(e) {
	start.disabled = false;
	clear.disabled = true;
	
	Array.from(surface.rows).forEach(function(row) {
		Array.from(row.cells).forEach(function(td) {
			td.style.color = 'black';
			td.style.background = 'black';
		});
	});
	
	clearInterval(tid)
	clearInterval(timer)
	
	forCount.innerText = 0;
	count.innerText = 0;
	seconds.innerText = 0;
	
	
}
</script>
</head>
<body>
<h1 style="color:#f19292">Spring MVC + XMLHttpRequest</h1>
<hr>
<button id="start" onclick="startBtn_click(event);">Start</button>
<button id="clear" onclick="clearBtn_click(event);">Clear</button>
<button id="stop" onclick="stopBtn_click(event);">Stop</button>
<hr>
<table id="Xcount" border="2px" width="500">
	<thead>
		<th>ForCount</th><th>Count</th><th>Seconds</th>
	</thead>
	<tbody>
		<td id="forCount" align="right">0</td>
		<td id="count" align="right">0</td>
		<td id="seconds" align="right">0</td>
	</tbody>
</table>
<hr>
<table id="surface" onmousedown="event.preventDefault();" oncontextmenu="event.preventDefault();">
	<tbody>
	<c:forEach var="row" items="${surface}">
		<tr>
		<c:forEach var="alpha" items="${row}">
		<td style="color: ${alpha.fg} ; background:${alpha.bg};">${alpha.ch}</td>
		</c:forEach>
		</tr>
	</c:forEach>
	</tbody>
</table>
</body>
</html>