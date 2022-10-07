package service.Woosuk;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;

import dao.Board;
import dao.BoardDao;
import service.CommandProcess;
import javax.servlet.http.HttpSession;

public class UpdateProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, JSONException {
			request.setCharacterEncoding("utf-8");
			
			String pageNum = request.getParameter("pageNum");
			System.out.println("UpdateProAction start...");
			int result = 0;
			Board board = new Board();
			
			try 
			{
				HttpSession session = request.getSession();
				int usernum = Integer.parseInt((String.valueOf(session.getAttribute("usernum"))));
				int board_usernum = Integer.parseInt((String.valueOf(session.getAttribute("board_usernum"))));

				// 2. Board board 생성하고 value setting
				System.out.println("로그인된 계정의 고유 id:" + usernum);
				System.out.println("게시글의 계정의 고유 id:" + board_usernum);
				System.out.println("UpdateProAction brd_secret-->"+request.getParameter("brd_secret"));
				
				//게시글에 사용 되는 값들 게시글번호, 제목, 내용, 비밀글 여부
				board.setBrd_bid(Integer.parseInt(request.getParameter("brd_bid")));
				board.setBrd_title(request.getParameter("brd_title"));
				board.setBrd_content(request.getParameter("brd_content"));
				board.setUsernum(board_usernum);
				
				// 체크박스는 체크가 되어야 값이 넘어간다. 체크가 안되어 있으면 null값으로 넘어온다
				// 이를 위해 null값은 0으로 넘어 가게 지정
				if (request.getParameter("brd_secret") == null) {
					int brd_secret = 0;
					board.setBrd_secret(brd_secret);
				}
				else {
					int brd_secret = 1;
					board.setBrd_secret(brd_secret);
				}
				System.out.println("brd_bid->" + board.brd_bid);
				System.out.println("brd_title->" +board.brd_title);
				System.out.println("brd_content->" +board.brd_content);
				System.out.println("brd_secret->" +board.brd_secret);
				
				// 3. BoardDao bd Instance
				BoardDao bd = BoardDao.getInstance();
				
				// 앞에 지정 했던 값을 db에 업데이트 한다.
				result = bd.update(board,usernum);
				
				// 4. request 객체에 result, num, pageNum
				System.out.println(result);
				System.out.println("brd_bid->" +board.getBrd_bid());
				System.out.println("pageNum->" +pageNum);
			} 
			catch (Exception e) 
			{
				System.out.println("updateProAction error->"+e.getMessage());
			}
			// view 에 넘어갈 값들 지정
			request.setAttribute("num", board.getBrd_bid());
			request.setAttribute("result", result);
			request.setAttribute("pageNum", pageNum);
			System.out.println("num->" +board.getBrd_bid());
			System.out.println("result->" +result);
			System.out.println("pageNum->" +pageNum);
		
			// 5. updatePro.jsp Return
			return "Woosuk/boardUpdatePro.jsp";
	}

}
