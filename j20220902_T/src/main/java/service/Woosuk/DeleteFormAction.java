package service.Woosuk;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;

import dao.Board;
import dao.BoardDao;
import service.CommandProcess;

public class DeleteFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, JSONException {
		System.out.println("DeleteFormAction start...");
		
		try {
			// 기능 자체는 ContentAction과 같다 
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
		return "Woosuk/boardDeleteForm.jsp";
	}

}
