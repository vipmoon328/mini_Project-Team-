package service.Woosuk;

import java.io.IOException;
import java.util.List;

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
		// num은 board list에서 board.brd_bid 를 의미 한다
		int num = Integer.parseInt(request.getParameter("num"));
		System.out.println( "ContentAction num ->"+ request.getParameter("num"));
		//pagenum은 boardlist에서 currentpage
		String pageNum = request.getParameter("pageNum");
		System.out.println( "ContentAction pageNum ->"+ request.getParameter("pageNum"));
		
		try {
			// 2. BoardDao bd Instance
			BoardDao bd = BoardDao.getInstance();

			// 3. num의 readCount 증가
			bd.readCount(num);
			
			
			// 4. Board board = bd.select(num);
			// select문을 통해 게시글 고유 번호를 불러온다
			Board board = bd.select(num);   
			
			// 댓글 리스트 생성
			List<Board>mentList = bd.commentList(num);
			
			//view에 넘길 데이터
			request.setAttribute("mentList", mentList);
			request.setAttribute("brd_writer", board.getBrd_writer());
			request.setAttribute("brd_content", board.getBrd_content());
			
			//댓글 갯수 메소드
			int refcnt = bd.refTotalCnt(num);

			// 5. request 객체에 num , pageNum , board
			request.setAttribute("num", num);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("board", board);	
			request.setAttribute("refcnt", refcnt);
			System.out.println("num->"+num);
			System.out.println("pageNum->"+pageNum);
			System.out.println("board->"+board);
		} catch (Exception e) {
			System.out.println(e.getMessage()); 
		}

		//       View
		return "Woosuk/boardContent.jsp";
	}

}
