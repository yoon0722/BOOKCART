<%@ page contentType="text/html; charset=EUC-KR" %>
 <%@ page import="bookcart.ReviewBoardBean"%>
<% 
	  int num = Integer.parseInt(request.getParameter("num"));
	  String nowPage = request.getParameter("nowPage");
	  ReviewBoardBean bean = (ReviewBoardBean)session.getAttribute("bean");
	  String subject = bean.getSubject();
	  String name = bean.getUser_id(); 
	  String content = bean.getContent(); 
	  String writer=bean.getWriter();
	  String publisher=bean.getPublisher();
%>
<html>
<head>
<title>JSP Board</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script>
	function check() {
	   if (document.updateFrm.pass.value == "") {
		 alert("수정을 위해 패스워드를 입력하세요.");
		 document.updateFrm.pass.focus();
		 return false;
		 }
	   document.updateFrm.submit();
	}
</script>
</head>
<body bgcolor="#FFFFCC">
<div align="center"><br/><br/>
<table width="600" cellpadding="3">
  <tr>
   <td bgcolor="#FF9018"  height="21" align="center">수정하기</td>
  </tr>
</table>
<form name="updateFrm" method="post" action="boardUpdate">
<table width="600" cellpadding="7">
 <tr>
  <td>
   <table>
	<tr>
     <td width="20%">제 목</td>
     <td width="80%">
	  <input name="subject" size="50" value="<%=subject%>" maxlength="50">
	 </td>
	</tr>
	<tr>
		<td>아이디</td>
		<td><input name="user_id" size="50" value="<%=name%>" maxlength="30"></td>
	</tr>
	<tr>
     <td>작 가</td>
     <td>
	  <input name="writer" size="50" value="<%=writer%>" maxlength="50">
	 </td>
	</tr>
	<tr>
     <td>출판사</td>
     <td>
	  <input name="publisher" size="50" value="<%=publisher%>" maxlength="50">
	 </td>
	</tr>
    <tr>
     <td>내 용</td>
     <td>
	  <textarea name="content" rows="10" cols="50"><%=content%></textarea>
	 </td>
    </tr>
	<tr>
     <td>비밀 번호</td> 
     <td><input type="password" name="pass" size="15" maxlength="15">
      수정 시에는 비밀번호가 필요합니다.</td>
    </tr>
	<tr>
     <td colspan="2" height="5"><hr/></td>
    </tr>
	<tr>
     <td colspan="2">
	  <input type="button" value="수정완료" onClick="check()">
      <input type="reset" value="다시수정"> 
      <input type="button" value="뒤로" onClick="history.go(-1)">
	 </td>
    </tr> 
   </table>
  </td>
 </tr>
</table>
 <input type="hidden" name="nowPage" value="<%=nowPage %>">
 <input type='hidden' name="num" value="<%=num%>">
</form> 
</div>
</body>
</html>