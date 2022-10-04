package service.Woosuk;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;

import dao.Board;
import dao.BoardDao;
import service.CommandProcess;

public class UpdateProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, JSONException {
			request.setCharacterEncoding("utf-8");
		
			String pageNum = request.getParameter("pageNum");
			try 
			{
				// 2. Board board 생성하고 value setting
				Board board = new Board();
				
				board.setBrd_bid(Integer.parseInt(request.getParameter("brd_bid")));
				board.setBrd_content(request.getParameter("brd_content"));; 
				
				// 3. BoardDao bd Instance
				BoardDao bd = BoardDao.getInstance();
				
				int result = bd.update(board);
				
				// 4. request 객체에 result, num, pageNum
				request.setAttribute("result", result);
				request.setAttribute("num", board.getBrd_bid());
				request.setAttribute("pageNum", pageNum);

			} 
			catch (Exception e) 
			{
				System.out.println(e.getMessage());
			}
			
		
			// 5. updatePro.jsp Return
			return "boardUpdatePro.jsp";
	}

}
