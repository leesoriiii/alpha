<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cross.jsp</title>
<style type="text/css">
body {
	background-image:url('/media/rose.png')
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
	return new Promise(funtion(resolve, reject) {
		setTimeout(resolve, millis);
	});
}

class Cross {
	constructor() {
		
	}
	
	async run() {
		for(;;) {
			await sleep(1000);
			console.log(this.cnt++)
			
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
<h1>async/await + class</h1>
<hr>
<button id="ctrateBtn">Create</button>
<hr>
<table id="surface" onmousedown="event.preventDefault()" oncontextmenu="event.preventDefault()">
	<tbody>
	<c:forEach var="i" begin="0" end="${surface.size()-1}">
		<tr>
		<c:forEach var="alpha" items="${surface[i]}">
			<td style="color: black; background: black;">${alpha.ch}</td>
		
		</c:forEach>
		</tr>
	</c:forEach>
	</tbody>
</table>
</body>
</html>