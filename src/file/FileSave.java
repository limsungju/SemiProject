package file;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Board.reDAO;
import Board.reDTO;
@WebServlet("/FileSave")
public class FileSave extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		System.out.println("session : "+ session.getAttribute("userId"));
		String path = super.getServletContext().getRealPath("fileUpDown");
		int size = 1024*1024*10;
		
		MultipartRequest multi = new MultipartRequest(
					request,path,size,"utf-8",new DefaultFileRenamePolicy());
		String oriFile = multi.getOriginalFileName("file");
		
		reDTO dto = new reDTO();
		dto.setTitle(multi.getParameter("title"));
		dto.setContent(multi.getParameter("content"));
		dto.setFilename(oriFile);
		dto.setId((String)session.getAttribute("userId"));
		
		reDAO dao = new reDAO();
		int result = dao.register(dto);
		request.setAttribute("result", result);
		
		ServletContext context = getServletContext();
		
		RequestDispatcher dispatcher = 
				context.getRequestDispatcher("/member/quiz03/boardSave.jsp");
		dispatcher.forward(request, response);
	}
}



