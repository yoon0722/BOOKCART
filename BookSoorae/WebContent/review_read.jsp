<%@ page contentType="text/html; charset=EUC-KR" %>
<%@page import="bookcart.ReviewBoardBean"%>
<jsp:useBean id="bMgr" class="bookcart.ReviewBoardMgr" />
<%
	  request.setCharacterEncoding("EUC-KR");
	  int num = Integer.parseInt(request.getParameter("num"));
	  String nowPage = request.getParameter("nowPage");//list.jsp에서 넘어온 num과 nowPage값을 받습니다.
	  String keyField = request.getParameter("keyField");
	  String keyWord = request.getParameter("keyWord");
	  bMgr.upCount(num);//조회수 증가
	  ReviewBoardBean bean = bMgr.getBoard(num);//게시물 가져오기
	  String name = bean.getUser_id();
	  String subject = bean.getSubject();
      String regdate = bean.getWr_date();
	  String content = bean.getContent();
	  String writer = bean.getWriter();
	  String publisher = bean.getPublisher();
	  int count = bean.getHit();
	  session.setAttribute("bean", bean);//게시물을 세션에 저장
%>
<html>
<head>
<title>REVIEW BOARD</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function list(){
	    document.listFrm.submit();
	 } 
	
	//file필요없음
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
  <td align="center" bgcolor="#DDDDDD" width="10%"> 이 름 </td>
  <td bgcolor="#FFFFE8"><%=name%></td>
  <td align="center" bgcolor="#DDDDDD" width="10%"> 등록날짜 </td>
  <td bgcolor="#FFFFE8"><%=regdate%></td>
 </tr>
 <tr> 
    <td align="center" bgcolor="#DDDDDD"> 제 목</td>
    <td bgcolor="#FFFFE8" colspan="3"><%=subject%></td>
   </tr>
    <tr> 
    <td align="center" bgcolor="#DDDDDD"> 작 가</td>
    <td bgcolor="#FFFFE8" colspan="3"><%=writer%></td>
   </tr>
    <tr> 
    <td align="center" bgcolor="#DDDDDD"> 출판사</td>
    <td bgcolor="#FFFFE8" colspan="3"><%=publisher%></td>
   </tr>
  <!-- 파일첨부 필요없음 -->
   <tr> 
    <td colspan="4"><br/><pre><%=content%></pre><br/></td>
   </tr>
   <tr>
    <td colspan="4" align="right">
     조회수  <%=count%>
    </td>
   </tr>
   </table>
  </td>
 </tr>
 <tr>
  <td align="center" colspan="2"> 
 <hr/>
 [ <a href="javascript:list()" >리스트</a> | 
 <a href="review_update.jsp?nowPage=<%=nowPage%>&num=<%=num%>" >수 정</a> |
 <a href="review_reply.jsp?nowPage=<%=nowPage%>" >답 변</a> |
 <a href="review_delete.jsp?nowPage=<%=nowPage%>&num=<%=num%>">삭 제</a> ]<br/>
  </td>
 </tr>
</table>

<form name="listFrm" method="post" action="review_list.jsp">
	<input type="hidden" name="nowPage" value="<%=nowPage%>">
	<%if(!(keyWord==null || keyWord.equals(""))){ %>
	<input type="hidden" name="keyField" value="<%=keyField%>">
	<input type="hidden" name="keyWord" value="<%=keyWord%>">
	<%}%>
</form>
</body>
</html>