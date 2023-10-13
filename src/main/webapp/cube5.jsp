<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cube.jsp</title>
<style type="text/css">
body {
	display: flex;
 	flex-direction: column;
    justify-content: center;
	justify-content: center;
    align-items: center;
}
.perspective {
/* 	border: 10px solid green; */
 	display: inline-block;
	margin: 100px 0px 0px 100px;
	
	perspective: 500px;
}

.cube {
	border: 1px solid blue;
 	display: inline-block;
	
   	transform-style: preserve-3d;

/* 	transform: rotateX(45deg); */
	animation: rotate 10s infinite linear;
}

.base {
/* 	border:10px solid red; */
	width: 50px;
	height: 50px;
	font-size: 0.5em;
	text-align: center;
	line-height: 50px;
}

.front, .back, .left, .right, .top, .bottom {
	position: absolute;
	top: 0px;
	left: 0px;
	
	opacity: 0.3;
	box-shadow: 0px 0px 20px 5px hotpink;
}

.front {
	transform: translateZ(25px);
	background: red;
}

.back {
	transform: rotateY(90deg) translateZ(25px);
	background: blue;
}

.left {
	transform: rotateY(-90deg) translateZ(25px);
	background: green;
}

.right {
	transform: rotateY(90deg) translateZ(25px);
	background: purple;
}

.top {
	transform: rotateX(90deg) translateZ(25px);
	background: yellow;
}

.bottom {
	transform: rotateX(-90deg) translateZ(25px);
	background: orange;
}

@keyframes rotate {
	from {
		transform: rotateX(0deg) rotateY(360deg) rotateZ(0deg);
	}
	to {
		transform: rotateX(360deg) rotateY(0deg) rotateZ(360deg);
	}
}

</style>
</head>
<body>
<h1 style="color:#f19292">CSS 3D 응용 큐브 만들기</h1>
<hr>
<section class="perspective">
	<article class="cube">
		<div class="base">Base</div>
		<div class="base front">Front</div>
		<div class="base back">Back</div>
		<div class="base left">Left</div>
		<div class="base right">Right</div>
		<div class="base top">Top</div>
		<div class="base bottom">Bottom</div>
	</article>
</section>
</body>
</html>