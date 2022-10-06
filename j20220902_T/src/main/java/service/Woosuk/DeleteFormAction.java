package service.Woosuk;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
			System.out.println("삭제 시퀸스 시작 1");
			int num = Integer.parseInt(request.getParameter("num"));
			String pageNum = request.getParameter("pageNum");
			
			System.out.println("글 번호: " + num);
			System.out.println("페이지 번호: " + pageNum);
			
			// 2. BoardDao bd Instance
			BoardDao bd = BoardDao.getInstance();
			// 3. Board board = bd.select(num);
			
			Board board  = bd.select(num);
			
			HttpSession session = request.getSession();
			
			// 4. request 객체에 num, pageNum, board
			session.setAttribute("num", num);
			session.setAttribute("pageNum", pageNum);
			request.setAttribute("board", board);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "Woosuk/boardDeleteForm.jsp";
	}

}
