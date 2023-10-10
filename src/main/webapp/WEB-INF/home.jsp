<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>submenu6.jsp</title>
<link rel="stylesheet" href="/css/cube.css">
<link rel="icon" href="favicon.png">

<style type="text/css">

/*
nav {
	border: 1px solid black;
}
ul {
	border: 1px solid red;
}

ol {
	border: 1px solid blue;
}

li {
	border: 1px solid green;
}


li > div, li > a {
	border: 5px solid purple;
}
*/

.menu {
	display: flex;
	list-style: none;
	
	align-items: flex-start;
	
	position: fixed;
	width: 95%;
	top: 10px;
	left: 10px;
}

.menu-item {
/* 	min-width: 150px; */
	width: 150px;
	flex-shrink: 0;
	background: orange;
}

.menu-item:hover > .menu-title {
	text-shadow: 10px 10px 5px red;
}

.menu-item:hover > .sub-menu {
	display: block;
}

.menu-item:last-child {
	margin-left: auto;
	margin-right: 10px;
}

.menu-title {
	padding: 10px;
	font-size: 15pt;
}

.sub-menu {
	display: none;
	list-style: none;
	padding-left: 0px;
	overflow: hidden;
}

.sub-menu-item {

}

.sub-menu-item > a {
	display: block;
	padding: 10px;
	font-size: 12pt;
	text-decoration: none;
	color: black;
}

.sub-menu-item:hover > a {
	background: red;
}

iframe {
	width: 100%;
	height: 1000px;
	margin-top: 70px;
}

</style>
<script type="text/javascript" src="/webjars/jquery/jquery.min.js"></script>
<script type="text/javascript">
function resize() {
	let iframe = document.querySelector('iframe');
	iframe.style.height = getComputedStyle(iframe.contentDocument.documentElement).height;
}

/* window.onload = function() {
	setInterval(resize, 100);
} */
${document}.ready(function() {
	setInterval(resize, 100);
})

</script>
</head>
<body>
<nav style="backgroundcolor: white">
<ul class="menu">
	<li style="padding: 0px 20px;">
		<section class="perspective">
		<article class="cube">
			<div class="base">Alpha</div>
			<div class="base front">A</div>
			<div class="base back">B</div>
			<div class="base left">C</div>
			<div class="base right">D</div>
			<div class="base top">E</div>
			<div class="base bottom">F</div>
		</article>
		</section>
	</li>
	<li class="menu-item">
		<div class="menu-title">Alpha</div>
		<ol class="sub-menu">
			<li class="sub-menu-item"><a target="content" href="/alpha/fill">fill</a></li>
			<li class="sub-menu-item"><a target="content" href="/alpha/cross">cross</a></li>
			<li class="sub-menu-item"><a target="content" href="/alpha/race">race</a></li>
			<li class="sub-menu-item"><a target="content" href="/alpha/zigzag">zigzag</a></li>
			<li class="sub-menu-item"><a target="content" href="/cube5.jsp">cube</a></li>
		</ol>
	</li>
	<li class="menu-item">
		<div class="menu-title">Animation</div>
		<ol class="sub-menu">
			<li class="sub-menu-item"><a target="content" href="/alpha/fill">fill</a></li>
			<li class="sub-menu-item"><a target="content" href="/alpha/cross">cross</a></li>
			<li class="sub-menu-item"><a target="content" href="/alpha/race">race</a></li>
			<li class="sub-menu-item"><a target="content" href="/alpha/zigzag">zigzag</a></li>
			<li class="sub-menu-item"><a target="content" href="/cube5.jsp">cube</a></li>
			<li class="sub-menu-item"><a target="content" href="/placeholder.jsp">placeholder</a></li>
		</ol>
	</li>
	<li class="menu-item">
		<div class="menu-title">React</div>
		<ol class="sub-menu">
			<li class="sub-menu-item"><a target="content" href="/react/fill">fill</a></li>
			<li class="sub-menu-item"><a target="content" href="/react/cross">cross</a></li>
			<li class="sub-menu-item"><a target="content" href="/react/race">race</a></li>
		</ol>
	</li>
	<li class="menu-item">
		<div class="menu-title">Employee</div>
		<ol class="sub-menu">
			<li class="sub-menu-item"><a target="content" href="/dept/list">dept</a></li>
			<li class="sub-menu-item"><a target="content" href="/emp/list">emp</a></li>
			<li class="sub-menu-item"><a target="content" href="/salgrade/list">salgrade</a></li>
		</ol>
	</li>
	<li class="menu-item">
		<div class="menu-title">City</div>
		<ol class="sub-menu">
			<li class="sub-menu-item"><a target="content" href="/city/list">city</a></li>
			<li class="sub-menu-item"><a target="content" href="/country/list">country</a></li>
			<li class="sub-menu-item"><a target="content" href="/language/list">language</a></li>
			<li class="sub-menu-item"><a target="content" href="/search">search</a></li>
		</ol>
	</li>
	<li class="menu-item">
		<div class="menu-title">Login</div>
	</li>
</ul>
</nav>
<iframe src="/alpha/fill" 
		name="content"
		width="100%"
		scrolling="no"
		frameborder='0'
		sendbox="allow-same-origin"
		onload="resize()">
i frame 태그를 지원하지 않는 브라우저는 이 글이 보입니다.
</iframe>



</body>
</html>