package service.Woosuk;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;

import dao.Board;
import dao.BoardDao;
import service.CommandProcess;

public class UpdateFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, JSONException {
				// 1. num, pageNum GET
				// 형식 자체는 ContentAction과 같다 
				System.out.println("service UpdateFormAction start...");
				// num은 boardcontent에서 board.brd_bid 를 의미 한다
				int num = Integer.parseInt(request.getParameter("num"));
				//pagenum은 boardcontent에서 currentpage
				String pageNum = request.getParameter("pageNum");
				HttpSession session = request.getSession();
				
				try 
				{
					// 2. BoardDao bd Instance
					BoardDao bd =BoardDao.getInstance();
					
					// 4. Board board = bd.select(num)
					Board board = bd.select(num);
					
					// 5. request 객체에 pageNum, board
					
					//22.10.06 [김건희] 세션을 구현해서 pageNum과 board를 페이지가 이동해도 생존할수 있도록 구현
					request.setAttribute("pageNum", pageNum);
					request.setAttribute("board", board);
					session.setAttribute("board_usernum", board.getUsernum());
					System.out.println("pageNum->" +pageNum);
					System.out.println("board->" +board);
					
				} 
				catch (SQLException e) 
				{
					System.out.println("updateFormAction error->"+e.getMessage());
				}

				return "Woosuk/boardUpdateForm.jsp";
	}

}
