package service.Woosuk;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;
import service.CommandProcess;

public class SecretCheckForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("SecretCheckForm start...");
		
		try {
			// 1. num, pageNum get
			int num = Integer.parseInt(request.getParameter("num"));
			String pageNum = request.getParameter("pageNum");
			
			// 2. BoardDao bd Instance
			BoardDao bd = BoardDao.getInstance();
			// 3. Board board = bd.select(num);
			Board board  = bd.select(num);
			
			// 4. request 객체에 num, pageNum, board
			request.setAttribute("num", num);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("board", board);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "/Woosuk/boardSecretForm.jsp";
	}

}
