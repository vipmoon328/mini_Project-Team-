package service.Woosuk;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;

import dao.Board;
import dao.BoardDao;
import service.CommandProcess;

public class CommentWriteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, JSONException  {
		System.out.println("CommentWriteProAction start....");
        request.setCharacterEncoding("utf-8"); 
        HttpSession session = request.getSession();
        try {
        	System.out.println("전 CommenwriteProAction 나와라pageNum->"+request.getParameter("pageNum"));
            System.out.println("전 CommenwriteProAction 나와라brd_bid->"+request.getParameter("brd_bid"));
            System.out.println("전 CommenwriteProAction 나와라brd_title->"+request.getParameter("brd_title"));
            System.out.println("전 CommenwriteProAction 나와라brd_secret->"+request.getParameter("brd_secret"));
            System.out.println("전 CommenwriteProAction 나와라brd_content->"+request.getParameter("brd_content"));
            System.out.println("전 CommenwriteProAction 나와라brd_ref->"+request.getParameter("brd_ref"));
            System.out.println("전 CommenwriteProAction 나와라brd_re_step->"+request.getParameter("brd_re_step"));
            System.out.println("전 CommenwriteProAction 나와라brd_re_level->"+request.getParameter("brd_re_level"));
            List<String> dbSavePath = new ArrayList<String>();
            String pageNum = request.getParameter("pageNum");
            int brd_bid = Integer.parseInt(request.getParameter("brd_bid"));
            String brd_content = request.getParameter("brd_content");
            int brd_ref = Integer.parseInt(request.getParameter("brd_ref"));
            int brd_re_step = Integer.parseInt(request.getParameter("brd_re_step"));
            int brd_re_level = Integer.parseInt(request.getParameter("brd_re_level"));
            
            
            Board board = new Board();

            // 작성자 세션 여부 2022.10.10
            board.setBrd_writer(String.valueOf(session.getAttribute("id")));
            System.out.println("후 CommenwriteProAction 나와라id->"+session.getAttribute("id"));
            
            //writer 세션
			
			
            board.setBrd_bid(Integer.parseInt(request.getParameter("brd_bid")));
            board.setBrd_content(request.getParameter("brd_content"));
            board.setBrd_ref(Integer.parseInt(request.getParameter("brd_ref")));
            board.setBrd_re_step(Integer.parseInt(request.getParameter("brd_re_step")));
            board.setBrd_re_level(Integer.parseInt(request.getParameter("brd_re_level")));
            board.setBrd_img_src(dbSavePath);
            
       
            
            System.out.println("후 CommenwriteProAction 나와라pageNum->"+request.getParameter("pageNum"));
            System.out.println("후 CommenwriteProAction 나와라brd_bid->"+request.getParameter("brd_bid"));
            System.out.println("후 CommenwriteProAction 나와라brd_title->"+request.getParameter("brd_title"));
            System.out.println("후 CommenwriteProAction 나와라brd_secret->"+request.getParameter("brd_secret"));
            System.out.println("후 CommenwriteProAction 나와라brd_content->"+request.getParameter("brd_content"));
            System.out.println("후 CommenwriteProAction 나와라brd_ref->"+request.getParameter("brd_ref"));
            System.out.println("후 CommenwriteProAction 나와라brd_re_step->"+request.getParameter("brd_re_step"));
            System.out.println("후 CommenwriteProAction 나와라brd_re_level->"+request.getParameter("brd_re_level"));
           

         // 3. BoardDao bd Instance
	        BoardDao bd = BoardDao.getInstance();//DB 
	        
	        int result = bd.insert(board);
	        
	        List<Board>mentList = bd.commentList(brd_ref);
	        
	        request.setAttribute("mentList", mentList);
	        request.setAttribute("num", board.getBrd_ref());
	        request.setAttribute("brd_writer", board.getBrd_writer());
	        request.setAttribute("brd_re_step", board.getBrd_re_step());
	        request.setAttribute("brd_content", board.getBrd_content());
	        request.setAttribute("result", result);
	        request.setAttribute("pageNum", pageNum);
	        
	        System.out.println("CommenwriteProAction mentList->"+mentList);
	        System.out.println("CommenwriteProAction num->"+board.getBrd_ref());
	        System.out.println("CommenwriteProAction brd_writer->"+board.getBrd_writer());
	        System.out.println("CommenwriteProAction brd_re_step->"+board.getBrd_re_step());
	        System.out.println("CommenwriteProAction brd_content->"+board.getBrd_content());
	        System.out.println("CommenwriteProAction result->"+result);
	        System.out.println("CommenwriteProAction pageNum->"+pageNum);
	        
		} catch (Exception e) {
			System.out.println("commentWriteProAction 에러 로그->"+e.getMessage()); 
		}
        
        
        
//		return "boardContent.do";
		return "Woosuk/boardContent.jsp";
	}

}
