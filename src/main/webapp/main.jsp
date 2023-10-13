<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cube.jsp</title>
<style type="text/css">
@font-face{
font-family:'DNFBitBitv2';
font-style:normal;font-weight:400;src:url('//cdn.df.nexon.com/img/common/font/DNFBitBitv2.otf')format('opentype')}
div { 
	color: #ffffff;
}
body {
	margin: 100px;
	background-color: #FAD1D1;
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
	width: 250px; /* 현재 크기의 5배 */
	height: 250px; /* 현재 크기의 5배 */
	font-size: 2.5em; /* 텍스트 크기를 큐브 크기에 맞게 조절 (50px * 5) */
	line-height: 250px; /* 큐브 크기에 맞게 조절 */
 	display: inline-block;
	
   	transform-style: preserve-3d;

/* 	transform: rotateX(45deg); */
	animation: rotate 10s infinite linear;
}

.base {
/* 	border:10px solid red; */
	width: 250px;
	height: 250px;
	font-size: 0.5em;
	text-align: center;
	line-height: 250px;
}

.front, .back, .left, .right, .top, .bottom {
	position: absolute;
	top: 0px;
	left: 0px;
	
	opacity: 0.9;
	box-shadow: 0px 0px 50px 5px #f19292;
}


.front {
  transform: translateZ(125px); /* 기존 25px 대신 125px */
  background: #f19292;
}

.back {
  transform: rotateY(450deg) translateZ(125px); /* 기존 125px 대신 625px */
  background: #ffffff;
}

.left {
  transform: rotateY(-90deg) translateZ(125px); /* 기존 25px 대신 125px */
  background: #FFEA7B;
}

.right {
  transform: rotateY(90deg) translateZ(125px); /* 기존 25px 대신 125px */
  background: #B7FF96;
 
}

.top {
  transform: rotateX(90deg) translateZ(125px); /* 기존 25px 대신 125px */
  background: #41E9FF;
}

.bottom {
  transform: rotateX(-90deg) translateZ(125px); /* 기존 25px 대신 125px */
  background: #B17AFF;
}
#heading{
	font-family:'DNFBitBitv2';
	margin: 150px;
	color: white;
    font-size: 80px;
    text-shadow: 2px 2px #f19292;
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
<hr>
<section class="perspective">
	<article class="cube">
		<div class="base">이소리</div>
		<div class="base front">Alpha</div>
		<div class="base back">Animation</div>
		<div class="base left">React</div>
		<div class="base right">Employee</div>
		<div class="base top">City</div>
		<div class="base bottom">Login</div>
	</article>
</section>
<h1 id="heading">이소리</h1>
</body>
</html>