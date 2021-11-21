<%@ page contentType="text/html; charset=EUC-KR" %>
<%@page import="bookcart.BookBoardBean"%>
<jsp:useBean id="bMgr" class="bookcart.BookBoardMgr" />
<%
	  request.setCharacterEncoding("EUC-KR");
	  int num = Integer.parseInt(request.getParameter("num"));
	  String nowPage = request.getParameter("nowPage");
	  String keyField = request.getParameter("keyField");
	  String keyWord = request.getParameter("keyWord");
	  bMgr.upCount(num);//조회수 증가
	  BookBoardBean bean = bMgr.getBoard(num);//게시물 가져오기
	  String title = bean.getTitle();
	  String writer = bean.getWriter();
      String publisher = bean.getPublisher();
      int money = bean.getMoney();
	  String content = bean.getContent();
	  String filename = bean.getFilename();
	  int filesize = bean.getFilesize();
	  int hit = bean.getHit();
	  session.setAttribute("bean", bean);//게시물을 세션에 저장
%>
<html>
<head>
<title>JSP Board</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function list(){
	    document.listFrm.submit();
	 } 
	
	function down(filename){
		 document.downFrm.filename.value=filename;
		 document.downFrm.submit();
	}
</script>
</head>
<body bgcolor="#FFFFCC">
<br/><br/>
<table align="center" width="600" cellspacing="3">
 <tr>
  <td bgcolor="#9CA2EE" height="25" align="center">글읽기</td>
 </tr>
 <tr>
  <td colspan="2">
   <table cellpadding="3" cellspacing="0" width="100%"> 
    <tr> 
  <td align="center" bgcolor="#DDDDDD" width="10%"> 책 제목 </td>
  <td bgcolor="#FFFFE8"><%=title%></td>
  <td align="center" bgcolor="#DDDDDD" width="10%"> 저자 </td>
  <td bgcolor="#FFFFE8"><%=writer%></td>
 </tr>
 <tr> 
    <td align="center" bgcolor="#DDDDDD"> 출판사 </td>
    <td bgcolor="#FFFFE8" colspan="3"><%=publisher%></td>
   </tr>
   <tr> 
     <td align="center" bgcolor="#DDDDDD">첨부파일</td>
     <td bgcolor="#FFFFE8" colspan="3">
     <% if( filename !=null && !filename.equals("")) {%>
  		<a href="javascript:down('<%=filename%>')"><%=filename%></a>
  		 &nbsp;&nbsp;<font color="blue">(<%=filesize%>KBytes)</font>  
  		 <%} else{%> 등록된 파일이 없습니다.<%}%>
     </td>
   </tr>
   <tr> 
    <td colspan="4"><br/><pre><%=content%></pre><br/></td>
   </tr>
   <tr>
    <td colspan="4" align="right">
     	조회수  <%=hit%>
    </td>
   </tr>
   </table>
  </td>
 </tr>
 <tr>
  <td align="center" colspan="2"> 
 <hr/>
 [ <a href="javascript:list()" >책 목록</a> | 
 <a href="bookUpdate.jsp?nowPage=<%=nowPage%>&num=<%=num%>" >수 정</a> |
 <a href="bookDelete.jsp?nowPage=<%=nowPage%>&num=<%=num%>">삭 제</a> ]<br/>
  </td>
 </tr>
</table>

<form name="downFrm" action="download.jsp" method="post">
	<input type="hidden" name="filename">
</form>

<form name="listFrm" method="post" action="bookList.jsp">
	<input type="hidden" name="nowPage" value="<%=nowPage%>">
	<%if(!(keyWord==null || keyWord.equals(""))){ %>
	<input type="hidden" name="keyField" value="<%=keyField%>">
	<input type="hidden" name="keyWord" value="<%=keyWord%>">
	<%}%>
</form>
</body>
</html>