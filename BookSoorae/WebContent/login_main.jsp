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

<!-- 외부 스타일시트 적용 -->
    <link rel="stylesheet" href="./index.css">
    <link rel="stylesheet" href="login.css"><!--로그인 css 연결-->

</head>

<body>

<header>
        <h1>
            <img src="./images/logo.png" alt="shop" width="50" height="50">
            <a href="index.html">BookSooRae</a>
			
        </h1>
       
             <ul>
            <a class="button" href="#">MY PAGE</a>
            <a class="button" href="sign-up.html">SIGN-UP</a>
            <a class="button" href="login_main.jsp">LOGIN</a>
            </ul>
        
    </header>

    <nav>
        <ul>
            <li><a href="index.html">Home</a></li>
            <li><a href="aboutus.html">About Us</a></li>
            <li><a href="bookList.jsp">market</a></li>
            <li><a href="review_list.jsp">Review</a></li>
            <li><a href="search.html">search</a></li>
    
        </ul>
    </nav>
<section id="main">
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
 </section>
 <footer>
        <div class="container">
            <a class="footerButton" href="https://www.nl.go.kr/" >
                <img class="btn-img" src="./images/national4.jpg" width="141" height="40">
            </a>

            <a class="footerButton" href="https://childlib.sen.go.kr/" >
                <img class="btn-img" src="./images/child.png">
            </a>
            
            <a class="footerButton" href="https://www.sblib.seoul.kr" >
                <img class="btn-img" src="./images/sungbuk.png">
            </a>
            
            <a class="footerButton" href="https://nslib.sen.go.kr" >
                <img class="btn-img" src="./images/namsan.png">
            </a>
          
            <a class="footerButton" href="https://www.nanet.go.kr/main.do" >
                <img class="btn-img" src="./images/nationalAssembly.png">
            </a>

        </div>
        <div class="container">
            Copyright© 성신여자대학교 웹정보프로그래밍_북수레
        </div>
      
    </footer>
​

</body>

</html>