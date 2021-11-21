<%@ page contentType="text/html; charset=EUC-KR"%>
<%@page import="bookcart.BookBoardBean"%>
<jsp:useBean id="bMgr" class="bookcart.BookBoardMgr" />
<title>책 목록</title>
<link href="style.css" rel="stylesheet" type="text/css">
<% 
	request.setCharacterEncoding("EUC-KR");
	String nowPage = request.getParameter("nowPage");
	int num = Integer.parseInt(request.getParameter("num"));
		
	bMgr.deleteBoard(num);
	String url = "bookList.jsp?nowPage=" + nowPage;
	response.sendRedirect(url);
%>
