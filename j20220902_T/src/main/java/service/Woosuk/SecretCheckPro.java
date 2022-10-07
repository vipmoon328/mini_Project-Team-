package service.Woosuk;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardDao;
import service.CommandProcess;

public class SecretCheckPro implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		try {
			// 1. num , passwd , pageNum Get
			int num = Integer.parseInt(request.getParameter("num"));
			String pageNum = request.getParameter("pageNum");
			
			// 2. BoardDao bd Instance
			BoardDao bd = BoardDao.getInstance();
			
			// 3. 본인의 게시판만 삭제
			int result = bd.check(String.valueOf(session.getAttribute("id")), num);
			
			// 4. request 객체에  num , pageNum ,result
			request.setAttribute("num", num);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("result", result);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return "/Woosuk/boardSecretPro.jsp";
	}

}
