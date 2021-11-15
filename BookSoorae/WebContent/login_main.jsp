<%@ page contentType="text/html; charset=utf-8" %>
<%
 		String id = (String)session.getAttribute("idKey");  
 		if(id!=null){
%>
  <script>
   alert("로그인 되었습니다");
   location.href = "login_ok.jsp";
  </script>
<% } %>
<!DOCTYPE html>

<html lang="ko">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta charset="UTF-8" />

<title>Login-Page</title>

<link rel="stylesheet" href="style.css"><!--외부 css 연결-->

</head>

<body>

<div class="loginbox">
    

<h1>로그인</h1>

<form method=post action="login_proc.jsp">

<label for="loginid" class="labelid">아이디</label>

<input type="text" name="user_id"><br />

<label for="loginpw" class="labelpw">패스워드</label>

<input type="password" name="pw">

<div class="chk">

<input type="checkbox" id="idchk">

<label for="idchk">아이디 저장</label>

<input type="checkbox" id="pwchk">

<label for="pwchk">비밀번호 저장</label>

</div>

<div class="search">

<span class="text">·아이디 또는 비밀번호를 잊으셨나요?</span>

<a href="#">ID/PW찾기</a>

</div>

<div class="btnwrap">

<button type="button" class="sign-up-btn" onclick="document.location.href='sign-up.html'">회원가입</button>
<button type="submit" class="login-btn">로그인</button>


</div>

</form>

​

</div>

​

</body>

</html>