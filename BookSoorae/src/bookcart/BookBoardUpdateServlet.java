package bookcart;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/bookBoardUpdate")
public class BookBoardUpdateServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("EUC-KR");
		response.setContentType("text/html; charset=EUC-KR");

		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter(); 

		BookBoardMgr bMgr = new BookBoardMgr();
		BookBoardBean bean = (BookBoardBean) session.getAttribute("bean");
		String nowPage = request.getParameter("nowPage");
		
		BookBoardBean upBean = new BookBoardBean();
		upBean.setBook_id(Integer.parseInt(request.getParameter("book_id")));
		upBean.setTitle(request.getParameter("title"));
		upBean.setWriter(request.getParameter("writer"));
		upBean.setPublisher(request.getParameter("publisher"));
		upBean.setMoney(Integer.parseInt(request.getParameter("money")));
		upBean.setContent(request.getParameter("content"));

		bMgr.updateBoard(upBean);
		String url = "bookRead.jsp?nowPage=" + nowPage + "&num=" + upBean.getBook_id();
		response.sendRedirect(url);
	}
}