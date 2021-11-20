<%@ page contentType="text/html; charset=utf-8" %>
<% 
		String id = (String)session.getAttribute("idKey");
		if(id == null){
%> 
<script>
	   alert("로그인 되지 않았습니다.");
	   location.href="login_main.jsp";
</script>
<%	}	%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta charset="UTF-8" />

<title>Insert title here</title>
	<!-- 외부 스타일시트 적용 -->
    <link rel="stylesheet" href="./index.css">
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

		<h1><%=id %>님, 북수레에 로그인 되었습니다!</h1>
    	<button type="button" onclick="document.location.href='index.html'">메인페이지 이동</button> 
        <button type="button" onclick="document.location.href='bookList.jsp'">내 책 목록</button>
        <button type="button" onclick="document.location.href='logout.jsp'">로그아웃</button> 
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