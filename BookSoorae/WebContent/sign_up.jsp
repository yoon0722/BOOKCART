<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.util.*, bookcart.*"%>
<%
		request.setCharacterEncoding("EUC-KR");

		String user_id=request.getParameter("user_id");
		String pw=request.getParameter("pw"); 
		String name = request.getParameter("name");
		String email=request.getParameter("email");
		String area1=request.getParameter("area1");
		String area2=request.getParameter("area2");
		String phone=request.getParameter("phone");
%>
<jsp:useBean id="regMgr" class="bookcart.MemberRegisterMgr"/>

<html>
<head>
<title></title>
</head>
<body bgcolor="#FFFFCC">
<h2><%=name %>님 회원가입을 축하합니다!</h2><br/>
<h3>회원정보</h3>
<table bordercolor="#0000ff" border="1">
<tr>
   <td><strong><%=user_id %></strong></td>
   <td><strong><%=pw %></strong></td>
   <td><strong><%=name %></strong></td>
   <td><strong><%=area1 %></strong></td>
   <td><strong><%=area2 %></strong></td>
   <td><strong><%=email %></strong></td>
   <td><strong><%=phone %></strong></td>
</tr>

<%
	regMgr.setRegister(user_id,pw,name,email,area1,area2,phone);
	MemberRegisterBean regBean = regMgr.getRegister(user_id);
%>
<tr>
	<td><%=regBean.getUser_id()%></td>
	<td><%=regBean.getPw()%></td>
	<td><%=regBean.getName()%></td>
	<td><%=regBean.getArea1()%></td>
	<td><%=regBean.getArea2()%></td>
	<td><%=regBean.getEmail()%></td>
	<td><%=regBean.getPhone()%></td>
</tr>
</table>
<br/>
<br/>
</body>
</html>