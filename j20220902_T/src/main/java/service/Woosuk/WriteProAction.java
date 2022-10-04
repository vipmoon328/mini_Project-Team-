package service.Woosuk;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;

import dao.Board;
import dao.BoardDao;
import service.CommandProcess;

public class WriteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, JSONException {
		try {
			System.out.println("writeProAction start....");
			// 1. num , pageNum, writer ,  email , subject , passwd , content   Get
			// 2. Board board 생성하고 Value Setting
	        request.setCharacterEncoding("utf-8"); 
	        System.out.println("전 writeProAction 나와라pageNum->"+request.getParameter("pageNum"));
	        System.out.println("전 writeProAction 나와라brd_bid->"+request.getParameter("brd_bid"));
	        System.out.println("전 writeProAction 나와라brd_title->"+request.getParameter("brd_title"));
	        System.out.println("전 writeProAction 나와라brd_secret->"+request.getParameter("brd_secret"));
	        System.out.println("전 writeProAction 나와라brd_content->"+request.getParameter("brd_content"));
	        System.out.println("전 writeProAction 나와라brd_ref->"+request.getParameter("brd_ref"));
	        System.out.println("전 writeProAction 나와라brd_re_step->"+request.getParameter("brd_re_step"));
	        System.out.println("전 writeProAction 나와라brd_re_level->"+request.getParameter("brd_re_level"));
	        
	        
	        String pageNum = request.getParameter("pageNum");
	        Board board = new Board();
	        
	        board.setBrd_bid(Integer.parseInt(request.getParameter("brd_bid")));
			board.setBrd_title(request.getParameter("brd_title"));
			board.setBrd_secret(Integer.parseInt(request.getParameter("brd_secret")));
			board.setBrd_content(request.getParameter("brd_content"));
			/*
			 * board.setBrd_ref(Integer.parseInt(request.getParameter("brd_ref")));
			 * board.setBrd_re_step(Integer.parseInt(request.getParameter("brd_re_step")));
			 * board.setBrd_re_level(Integer.parseInt(request.getParameter("brd_re_level")))
			 * ;
			 */
			
			System.out.println("후 writeProAction 나와라pageNum->"+request.getParameter("pageNum"));
	        System.out.println("후 writeProAction 나와라brd_bid->"+request.getParameter("brd_bid"));
	        System.out.println("후 writeProAction 나와라brd_title->"+request.getParameter("brd_title"));
	        System.out.println("후 writeProAction 나와라brd_secret->"+request.getParameter("brd_secret"));
	        System.out.println("후 writeProAction 나와라brd_content->"+request.getParameter("brd_content"));
	        System.out.println("후 writeProAction 나와라brd_ref->"+request.getParameter("brd_ref"));
	        System.out.println("후 writeProAction 나와라brd_re_step->"+request.getParameter("brd_re_step"));
	        System.out.println("후 writeProAction 나와라brd_re_level->"+request.getParameter("brd_re_level"));
	        
			// 3. BoardDao bd Instance
	        BoardDao bd = BoardDao.getInstance();//DB 
	        int result = bd.insert(board);
	        System.out.println("writeProAction brd_bid ->"+board.getBrd_bid());
	        System.out.println("writeProAction result ->"+result);
	        System.out.println("writeProAction pageNum ->"+pageNum);
	        // 4. request 객체에 result, num , pageNum 	        
	        request.setAttribute("brd_bid", board.brd_bid);
	        request.setAttribute("result", result);
	        request.setAttribute("pageNum", pageNum);
		
		} catch (Exception e) {
			System.out.println("값이 null 이라는거?"+e.getMessage()); 
		}

        return "boardWritePro.jsp";
	}

}
