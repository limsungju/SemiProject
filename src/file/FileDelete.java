package file;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import Board.reDAO;

@WebServlet("/FileDelete")
public class FileDelete extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("파일 삭제");
		String num = request.getParameter("num");
		String fileName = request.getParameter("filename");
		reDAO dao = new reDAO();
		String fileBool = dao.delete(num);
		if(fileBool != null) {
			String path = super.getServletContext().getRealPath("fileUpDown");
			File file = new File(path+"\\"+fileName);
			if(file.exists()) {
				file.delete();
			}
		}
		response.sendRedirect("/beans/member/quiz03/contentView.jsp");
	}
}