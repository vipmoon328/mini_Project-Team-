package service.Woosuk;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;

import dao.Board;
import dao.BoardDao;
import service.CommandProcess;

public class ContentAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, JSONException {

		System.out.println("ContentAction Service start...");
		// 1. num , pageNum
		int num = Integer.parseInt(request.getParameter("num"));
		
		
		String pageNum = request.getParameter("pageNum");
		
		try {
			// 2. BoardDao bd Instance
			BoardDao bd = BoardDao.getInstance();

			// 3. num의 readCount 증가
			bd.readCount(num);
			
			
			// 4. Board board = bd.select(num);
			Board board = bd.select(num);   

			// 5. request 객체에 num , pageNum , board
			request.setAttribute("num", num);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("board", board);	
			System.out.println("num->"+num);
			System.out.println("pageNum->"+pageNum);
			System.out.println("board->"+board);
		} catch (Exception e) {
			System.out.println(e.getMessage()); 
		}

		//       View
		return "boardContent.jsp";
	}

}
