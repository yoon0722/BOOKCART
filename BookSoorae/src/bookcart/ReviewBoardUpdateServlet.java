package bookcart;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/boardUpdate")
public class ReviewBoardUpdateServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("EUC-KR");
		response.setContentType("text/html; charset=EUC-KR");

		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter(); 

		ReviewBoardMgr bMgr = new ReviewBoardMgr();
		ReviewBoardBean bean = (ReviewBoardBean) session.getAttribute("bean");
		String nowPage = request.getParameter("nowPage");
		
		ReviewBoardBean upBean = new ReviewBoardBean();
		upBean.setRv_id(Integer.parseInt(request.getParameter("num")));
		upBean.setUser_id(request.getParameter("user_id"));
		upBean.setSubject(request.getParameter("subject"));
		upBean.setContent(request.getParameter("content"));
		upBean.setPass(request.getParameter("pass"));
		upBean.setWriter(request.getParameter("writer"));
		upBean.setPublisher(request.getParameter("publisher"));

		String upPass = upBean.getPass();
		String inPass = bean.getPass();

		if (upPass.equals(inPass)) {
			bMgr.updateBoard(upBean);
			String url = "review_read.jsp?nowPage=" + nowPage + "&num=" + upBean.getRv_id();
			response.sendRedirect(url);
		} else {
			out.println("<script>");
			out.println("alert('입력하신 비밀번호가 아닙니다.');");
			out.println("history.back();");
			out.println("</script>");
		}
	}
}