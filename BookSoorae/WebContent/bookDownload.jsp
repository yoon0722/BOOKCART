<%@page contentType="application; charset=EUC-KR"%>
<jsp:useBean id="bMgr" class="bookcart.BookBoardMgr" />
<%
	  bMgr.downLoad(request, response, out, pageContext);
%>