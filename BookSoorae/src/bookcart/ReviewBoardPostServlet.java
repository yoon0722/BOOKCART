package bookcart;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/boardPost")
public class ReviewBoardPostServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		ReviewBoardMgr bMgr = new ReviewBoardMgr();
		bMgr.insertBoard(request);
		response.sendRedirect("review_list.jsp");
	}
}