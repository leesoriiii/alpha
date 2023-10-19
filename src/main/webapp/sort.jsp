<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sort.jsp</title>
<script type="text/javascript" src="/webjars/jquery/jquery.js"></script>
<script type="module" src="/js/react/sort.js"></script>
<style type="text/css">
body {
	background-color: #FAD1D1;
}
hr {
  border: none; /* 기본 테두리 제거 */
  border-top: 3px dotted #ffffff; 
  width: 500px; /* 가로 너비 */
  margin: 10px 0; /* 위아래 여백 추가 (선택적) */
}
button {
    margin: 0 10px; /* 버튼 사이의 간격 조절 */
    background-color: #f19292;
    color: white;
    border: none;
    border-radius: 50px;
    box-shadow: 2px 2px 4px rgba(250, 133, 133, 0.5);
  }
#heading{
    color: white;
    font-size: 50px;
    text-shadow: 2px 2px #f19292;
}
</style>
</head>
<body>
<h1 id="heading">Sort </h1>
<hr>
<section id="root"></section>
</body>
</html>