<%@page contentType="text/html;charset=EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String bookName = request.getParameter("bookName");
	String author = request.getParameter("author");
	String publisher = request.getParameter("publisher");
%>
<b><%=bookName%></b>
<b><%=author%></b>
<b><%=publisher%></b>
<%--주석처리하고 pull--%>
<%--test2--%>