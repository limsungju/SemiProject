package file;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/FileDown")
public class FileDown extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fileName = request.getParameter("fileName");
		String saveDir = super.getServletContext().getRealPath("fileUpDown");
		File file = new File(saveDir+"/"+fileName);
		String mimeType = getServletContext().getMimeType(file.toString());
		if(mimeType == null) {
			//http에서 파일 형식을 모를때 지정하는 방식이 된다.8비트 형식의 /응용프로그램 .egg, .bin 등
			response.setContentType("application/octet-stream");
		}
		// 4. 다운로드용 파일명을 설정
		String downName = null;
		if(request.getHeader("user-agent").indexOf("Trident") == -1){//Trident : 익스플로러 값
			downName = new String(fileName.getBytes("UTF-8"), "8859_1");
		}
		else{downName = new String(fileName.getBytes("euc-kr"), "8859_1");	}
		response.setHeader("Content-Disposition","attachment;filename=\"" + downName + "\";");
		FileInputStream fileInputStream = new FileInputStream(file);
		ServletOutputStream servletOutputStream = response.getOutputStream();
		
		byte b [] = new byte[1024];
		int data = 0;
		while((data=(fileInputStream.read(b, 0, b.length))) != -1)
			servletOutputStream.write(b, 0, data);
		
		servletOutputStream.close();
		fileInputStream.close();
	}
}
