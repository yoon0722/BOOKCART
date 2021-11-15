<%@ page contentType="text/html; charset=EUC-KR" %>
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
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
		<h1><%=id %>님, 북수레에 로그인 되었습니다!</h1>
    	<button type="button" onclick="document.location.href='home.html'">메인페이지 이동</button> 
        <button type="button" onclick="document.location.href='bookList.jsp'">내 책 목록</button>
        <button type="button" onclick="document.location.href='logout.jsp'">로그아웃</button> 
</body>
</html>