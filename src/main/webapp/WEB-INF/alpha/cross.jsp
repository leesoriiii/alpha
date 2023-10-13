<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cross.jsp</title>
<style type="text/css">
* {
margin:-100;
padding: -100;
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
button {
    background-color: white;
    width:70px;
    height:70px;
    color: #f19292;
    border: none;
    border-radius: 50px;
    box-shadow: 2px 2px 4px rgba(250, 133, 133, 0.5);
}
hr {
  border: none; /* 기본 테두리 제거 */
  border-top: 3px dotted #ffffff; 
  width: 500px; /* 가로 너비를 100%로 설정 */
  margin: 10px 0; /* 위아래 여백 추가 (선택적) */
}
#heading{
    color: white;
    font-size: 50px;
    text-shadow: 2px 2px #f19292;
}
#surface { 
	border-collapse: collapse;
	font-family: monospace;
	font-size: 150%;
	
	border: 20px outset #f19292;
}
#surface td {
	opacity: 0.8;
}
</style>
<script type="text/javascript">

function sleep(millis) {
	return new Promise(function(resolve, reject) { 
		setTimeout(resolve, millis);
	});
}

class Cross {
	constructor() {
		this.direction = parseInt(Math.random()*4);
		this.speed = Math.random()*200 + 10;
	}
	
	show() {
		let td = surface.rows[this.alpha.line-1].cells[this.alpha.column-1];
		td.style.color = this.alpha.fg;
		td.style.background = this.alpha.bg;
		td.innerText = this.alpha.ch;
	}
	hide() {
		let td = surface.rows[this.alpha.line-1].cells[this.alpha.column-1];
		td.style.color = 'white';
		td.style.background = 'white';
	}
	
	move() {
		this.hide();
		
		switch(this.direction) {
		case 0:	// TOP
			this.alpha.line--;
			break;
		case 1:	// RIGHT
			this.alpha.column++;
			break;	
		case 2:	// BOTTOM
			this.alpha.line++;
			break;
		case 3:	// LEFT
			this.alpha.column--;
			break;	
		}
		
		let alpha = this.alpha;
		if (alpha.line==0 || alpha.column==0 || alpha.line==21 || alpha.column==41)
			return false;
		
		this.show();
		return true;
	}
	
	async run() {
		let response = await fetch('/alpha/data');
		this.alpha = await response.json();
		this.alpha.line = 10;
		this.alpha.column = 20;
		console.log(this.alpha);
		
		this.show();
		
		for(;;) {
			await sleep(1000);
			
			if(!this.move())
				break;
		}
	}
}

window.onload = () => {
	
	createBtn.onclick = () => {
		let cross = new Cross();
		cross.run();
	}
		
}
</script>
</head>
<body>
<h1 id="heading">async/await + class</h1>
<hr>
<button id="createBtn">Create</button>
<hr>
<table id="surface" onmousedown="event.preventDefault()" oncontextmenu="event.preventDefault()">
	<tbody>
	<c:forEach var="i" begin="0" end="${surface.size()-1}">
		<tr>
		<c:forEach var="alpha" items="${surface[i]}">
			<td style="color: #ffffff; background: #ffffff;">${alpha.ch}</td>
		
		</c:forEach>
		</tr>
	</c:forEach>
	</tbody>
</table>
</body>
</html>