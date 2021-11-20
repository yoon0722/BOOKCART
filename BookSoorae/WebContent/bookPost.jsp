<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<title>책 등록</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<div align="center">
<br/><br/>
<table width="600" cellpadding="3">
	<tr>
		<td bgcolor="#D0D0D0" height="25" align="center">책 등록</td>
	</tr>
</table>
<br/>
<form name="postFrm" method="post" action="boardPost" enctype="multipart/form-data">
<table width="600" cellpadding="3" align="center">
	<tr>
		<td align=center>
		<table align="center">
			<tr>
				<td>책 제목</td>
				<td><input name="bookname" size="40" maxlength="30"></td>
			</tr>
			<tr>
				<td>저자</td>
				<td><input name="author" size="40" maxlength="30"></td>
			</tr>
			<tr>
				<td>출판사</td>
				<td><input name="publisher" size="40" maxlength="30" ></td>
			</tr>
			<tr>
				<td>보증금</td>
				<td><input name="deposit" size="40" maxlength="30" ></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="content" rows="10" cols="50" maxlength="1000" style="height:200px;"></textarea></td>
			</tr>
			<tr>
			 <tr>
     			<td>사진 첨부</td> 
     			<td><input type="file" name="filename" size="50" maxlength="50"></td>
    		</tr>
			<tr>
				<td colspan="2"><hr/></td>
			</tr>
			<tr>
				<td colspan="2">
					 <input type="submit" value="등록">
				</td>
				<td colspan="2">
					 <input type="button" value="책 목록" onClick="javascript:location.href='bookList.jsp'">
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>">
</form>
</div>
</body>
</html>
