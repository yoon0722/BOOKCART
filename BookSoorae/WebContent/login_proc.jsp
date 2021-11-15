
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*, bookcart.*"%>
<jsp:useBean id="regMgr" class="bookcart.MemberRegisterMgr"/>
<%
	request.setCharacterEncoding("utf-8");

	String user_id="";
	String pw="";
	if(request.getParameter("user_id")!=null)
		user_id=request.getParameter("user_id");
	if(request.getParameter("pw")!=null)
		pw=request.getParameter("pw");
			

	String str=regMgr.login(user_id,pw);
	if(str.equals("error")){
%>
		<script>
		  alert("로그인 되지 않았습니다.\n아이디나 비밀번호를 확인해주세요");
	      location.href="login_main.jsp";
		</script>
<% }
	else{
		session.setAttribute("idKey",user_id);

%>		
		<script> 
	  		alert("로그인 되었습니다.");
      		location.href="login_ok.jsp";
		</script>
		
<%}%>
