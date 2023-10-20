<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>submenu6.jsp</title>
<link rel="stylesheet" href="/css/cube.css">
<link rel="icon" href="favicon.png">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-gothic-eco.css" rel="stylesheet">
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
@font-face {
    font-family: 'Dovemayo_gothic';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.1/Dovemayo_gothic.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}

@font-face {
    font-family: 'IAMAPLAYER';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2307-2@1.0/IAMAPLAYER.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'HakgyoansimWoojuR';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2307-2@1.0/HakgyoansimWoojuR.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
@font-face{
  font-family:'bitbit';
  src:url('//cdn.df.nexon.com/img/common/font/DNFBitBit-Regular.woff'),url('//cdn.df.nexon.com/img/common/font/DNFBitBit-Regular.woff2') ;
}
@font-face {
    font-family: 'Cafe24Ssurround';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24Ssurround.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
.menu {
	display: flex;
	list-style: none;
	align-items: flex-start;
	position: fixed;
	width: 100%;
	top: -16px;
	left: 0px;
}

.menu-item {
	width: 150px;
	flex-shrink: 0;
	background: #f19292;
}

.menu-item::before {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: -1;
  background-color:#f19292; /* 배경 색상을 원하는 색상으로 변경하세요 */
}


.menu-item:hover > .menu-title {
	text-shadow: 0px 0px 20px white;
	font-weight: bold;
}

.menu-item:hover > .sub-menu {
	display: block;
}

.menu-item:last-child {
	margin-left: auto;
	margin-right: 10px;
}

.menu-title {
	font-family: 'IAMAPLAYER';
	padding: 10px;
	font-size: 18pt;
	color: white;
	text-align: center;
}

.sub-menu {
	font-family: 'Dovemayo_gothic';
	display: none;
	list-style: none;
	padding-left: 0px;
	overflow: hidden;
	text-align: center;

}

.sub-menu-item {
	color: white;

}

.sub-menu-item > a {
	display: block;
	padding: 10px;
	font-size: 15pt;
	text-decoration: none;
	color: white;
}

.sub-menu-item:hover > a {
	text-decoration: underline;
	font-weight: bold;
}
body,html {
	margin: 0px;
}
iframe {
	width: 100%;
	height: 1000px;
	margin-top: 50px;
}

</style>

<script type="text/javascript" src="/webjars/jquery/jquery.min.js"></script>
<script type="text/javascript">
function resize() {
	//let iframe = document.querySelector('iframe');
	//iframe.style.height = getComputedStyle(iframe.contentDocument.documentElement).height;
}

/* window.onload = function() {
	setInterval(resize, 100);
} */
$(document).ready(function() {
	setInterval(resize, 100);
});

</script>
</head>
<body>
<nav style="backgroundcolor: white">
<ul class="menu">
	<li style="padding: 0px 20px;">
		<section class="perspective">
		<article class="cube">
			<div class="base">Alpha큐브</div>
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
			<li class="sub-menu-item"><a target="content" href="/ani/fill">fill</a></li>
			<li class="sub-menu-item"><a target="content" href="/placeholder.jsp">placeholder</a></li>
		</ol>
	</li>
	<li class="menu-item">
		<div class="menu-title">React</div>
		<ol class="sub-menu">
			<li class="sub-menu-item"><a target="content" href="/fill.jsp">fill</a></li>
			<li class="sub-menu-item"><a target="content" href="/sort.jsp">sort</a></li>
			<li class="sub-menu-item"><a target="content" href="/flow.jsp">flow</a></li>
			<li class="sub-menu-item"><a target="content" href="/ping.jsp">ping</a></li>
		</ol>
	</li>
	<li class="menu-item">
		<div class="menu-title">Employee</div>
		<ol class="sub-menu">
			<li class="sub-menu-item"><a target="content" href="/dept/list">dept</a></li>
			<li class="sub-menu-item"><a target="content" href="/emp/list">emp</a></li>
		</ol>
	</li>
	<li class="menu-item">
		<div class="menu-title">City</div>
		<ol class="sub-menu">
			<li class="sub-menu-item"><a target="content" href="/city/list">city</a></li>
			<li class="sub-menu-item"><a target="content" href="/country/list">country</a></li>
		</ol>
	</li>
	<li class="menu-item">
		<div class="menu-title">Login</div>
	</li>
</ul>
</nav>
<iframe src="../main.jsp"
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