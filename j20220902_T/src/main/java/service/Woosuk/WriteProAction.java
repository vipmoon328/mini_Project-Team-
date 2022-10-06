package service.Woosuk;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.Board;
import dao.BoardDao;
import service.CommandProcess;

public class WriteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException , JSONException{
			HttpSession session = request.getSession();
			try {
			System.out.println("writeProAction start....");
			// 1. num , pageNum, writer ,  email , subject , passwd , content   Get
			// 2. Board board 생성하고 Value Setting
	        request.setCharacterEncoding("utf-8"); 
	        // 인코딩을 통해 한글이 깨지지 않는다.
	        
	        int maxSize = 5 * 1024 * 1024;
	    	String fileSave = "/fileSave";
	    	
	    	String realPath = request.getServletContext().getRealPath(fileSave);
	    	System.out.println("realPath->" + realPath);
	    	MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, "utf-8", new DefaultFileRenamePolicy());
	    	
	    	Enumeration en = multi.getFileNames();
	    	while(en.hasMoreElements()){
	    		//input 태그의 속성이 file인 태그의 name 속성값 : 파라미터이름
	    		String parameterName = (String) en.nextElement();
	    		File file = multi.getFile(parameterName);
	    	}
	        
	        System.out.println("전 writeProAction 나와라pageNum->"+multi.getParameter("pageNum"));
	        System.out.println("전 writeProAction 나와라brd_bid->"+multi.getParameter("brd_bid"));
	        System.out.println("전 writeProAction 나와라brd_title->"+multi.getParameter("brd_title"));
	        System.out.println("전 writeProAction 나와라brd_secret->"+multi.getParameter("brd_secret"));
	        System.out.println("전 writeProAction 나와라brd_content->"+multi.getParameter("brd_content"));
	        System.out.println("전 writeProAction 나와라usernumber->"+multi.getParameter("usernum"));
	        System.out.println("전 writeProAction 나와라brd_ref->"+multi.getParameter("brd_ref"));
	        System.out.println("전 writeProAction 나와라brd_re_step->"+multi.getParameter("brd_re_step"));
	        System.out.println("전 writeProAction 나와라brd_re_level->"+multi.getParameter("brd_re_level"));
	        
	        //write 폼에서 있는pagenum을 가져온다.
	        String pageNum = multi.getParameter("pageNum");
	        Board board = new Board();
	        
	      
	        //게시글에 사용 되는 값들 게시글번호, 제목, 내용, 비밀글 여부
	        board.setBrd_bid(Integer.parseInt(multi.getParameter("brd_bid")));
	        board.setBrd_writer(String.valueOf(session.getAttribute("id")));
			board.setBrd_title(multi.getParameter("brd_title"));
			// 체크박스는 체크가 되어야 값이 넘어간다. 체크가 안되어 있으면 null값으로 넘어온다
			// 이를 위해 null값은 0으로 넘어 가게 지정
			if (multi.getParameter("brd_secret") == null) {
				int brd_secret = 0;
				board.setBrd_secret(brd_secret);
			}
			else {
				int brd_secret = 1;
				board.setBrd_secret(brd_secret);
			}
			board.setBrd_content(multi.getParameter("brd_content"));
			
			//22-10-06[김건희] 유저번호를 세션으로 가져온다.
	        int usernum = Integer.parseInt((String.valueOf(session.getAttribute("usernum"))));
	        System.out.println("==========유저번호 받아오기: "+usernum);
			board.setUsernum(usernum);
			System.out.println(board.getUsernum());
			
			System.out.println("후 writeProAction 나와라pageNum->"+multi.getParameter("pageNum"));
	        System.out.println("후 writeProAction 나와라brd_bid->"+multi.getParameter("brd_bid"));
	        System.out.println("후 writeProAction 나와라brd_title->"+multi.getParameter("brd_title"));
	        System.out.println("후 writeProAction 나와라brd_secret->"+multi.getParameter("brd_secret"));
	        System.out.println("후 writeProAction 나와라brd_content->"+multi.getParameter("brd_content"));
	        System.out.println("후 writeProAction 나와라brd_ref->"+multi.getParameter("brd_ref"));
	        System.out.println("후 writeProAction 나와라brd_re_step->"+multi.getParameter("brd_re_step"));
	        System.out.println("후 writeProAction 나와라brd_re_level->"+multi.getParameter("brd_re_level"));
	        
			// 3. BoardDao bd Instance
	        BoardDao bd = BoardDao.getInstance();//DB 
	        
	        // 값을 insert를 통해 게시글 작성
	        int result = bd.insert(board);
	        System.out.println("writeProAction brd_bid ->"+board.getBrd_bid());
	        System.out.println("writeProAction result ->"+result);
	        System.out.println("writeProAction pageNum ->"+pageNum);
	        
	        // 4. request 객체에 result, num , pageNum 	
	        // view 에 넘어갈 값들 지정
	        request.setAttribute("num", board.getBrd_ref());
	        request.setAttribute("result", result);
	        request.setAttribute("pageNum", pageNum);
		
		} catch (Exception e) {
			System.out.println("writeProAction 에러 로그"+e.getMessage()); 
		}

        return "Woosuk/boardWritePro.jsp";
	}

}
