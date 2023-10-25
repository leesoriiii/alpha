<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login.jsp</title>
<style type="text/css">
section {
	width: 50%;
	margin: auto;
}

fieldset {
	margin: 20px 0px;
}

input {
	padding: 0.5em;
}

body {
	display: grid;
	height: 90vh;
}

h1 {
	text-align: center;
}

hr {
	border: none; /* 기본 테두리 제거 */
	border-top: 2px solid #faa821;
	width: 250px; /* 가로 너비 */
	margin-top: 20px;
	margin-bottom: 20px;
}

img {
	display: block;
	margin: 0 auto;
	margin-bottom: 50px;
}

input {
	display: block;
	margin: 0 auto;
}

div {
	text-align: center; /* 가운데 정렬 */
	margin-bottom: 20px;
	font-size: 12px;
	font-weight: bold;
}

#button {
	width: 220px;
	background-color: #FCDEAB;
	border: 1px solid #FBA720;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s, border 0.3s;
	color: #FBA720;
	font-weight: bold;
}

#button:hover {
	background-color: #FBA720;
	border: 1px solid #FBA720;
	color: #ffffff;
}

span {
	display: block; /* 블록 수준 요소로 변경하여 다른 요소와 독립적으로 배치 */
	text-align: center; /* 가운데 정렬 */
	margin-top: 20px; /* 원하는 여백을 지정 */
	font-size: 12px;
}

#id {
	margin-bottom: 10px;
}

#id, #pw {
	width: 200px;
}
</style>
<script>
    function clearValue(inputElement) {
      inputElement.placeholder = '';
    }
    
    function restoreValue(inputElement) {
      if (inputElement.value === '') {
        if (inputElement.id === 'id') {
          inputElement.placeholder = '아이디를 입력해 주세요.';
        } else if (inputElement.id === 'pw') {
          inputElement.placeholder = '비밀번호를 입력해 주세요.';
        }
      }
    }
</script>
</head>
<body>
	<section>
		<c:if test="${param.error == ''}">
			<div>사용자 ID 또는 비밀번호를 확인 해 주세요</div>
		</c:if>
		<form action="/login" method="POST">
			<input id="id" name="username" placeholder="아이디를 입력 해 주세요."
				onfocus="clearValue(this)"
				onblur="restoreValue(this)">
				<input id="pw" name="password" type="password" placeholder="비밀번호를 입력 해 주세요."
					onfocus="clearValue(this)"
					onblur="restoreValue(this)"><br> 
				<input id="button" type="submit" value="로그인"/>
		</form>
		<hr>
	<span>회원가입 | 아이디 찾기 | 비밀번호 찾기</span>
	</section>

</body>
</html>