<%@page language="java" contentType="text/html;charset=EUC-KR"
pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>책 목록</title>
</head>
<body>
책 목록
<table cellspacing=1 width=600 border=1>
	<tr>
		<th width=50><p align=center>번호</p></th>
		<th width=200><p align=center>책 제목</p></th>
		<th width=100><p align=center>저자</p></th>
		<th width=150><p align=center>출판사</p></th>
	</tr>
</table>

<form action="<%=request.getContextPath()%>/bookInsert.jsp" method="post">
<input type="text" name="bookName" placeholder="책제목 입력">
<input type="text" name="author" placeholder="저자 입력">
<input type="text" name="publisher" placeholder="출판사 입력">
<input type="submit" value="추가">
</form>
</body>
</html>
