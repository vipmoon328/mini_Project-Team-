package service.Woosuk;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.Board;
import dao.BoardDao;
import service.CommandProcess;
import javax.servlet.http.HttpSession;

public class UpdateProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, JSONException {
			request.setCharacterEncoding("utf-8");
			System.out.println("UpdateProAction start...");
			String pageNum = "";
			int result = 0;
			Board board = new Board();
			
			try 
			{
				
				
				HttpSession session = request.getSession();
				int usernum = Integer.parseInt((String.valueOf(session.getAttribute("usernum"))));
				int board_usernum = Integer.parseInt((String.valueOf(session.getAttribute("board_usernum"))));

				int maxSize = 5 * 1024 * 1024;
		    	String fileSave = "/fileSave";
		    	List<String> dbSavePath = new ArrayList<String>();
		    	List<String> dbDeletePath = new ArrayList<String>();
		    	String realPath = request.getServletContext().getRealPath(fileSave);
		    	System.out.println("realPath->" + realPath);
		    	MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, "utf-8", new DefaultFileRenamePolicy());
		    	Enumeration en = multi.getFileNames();
		    	while(en.hasMoreElements()){
		    		//input 태그의 속성이 file인 태그의 name 속성값 : 파라미터이름
		    		String parameterName = (String) en.nextElement();
		    		//서버에 저장된 파일 이름
		    		String serverSaveFilename = multi.getFilesystemName(parameterName);
		    		//전송전 원래의 파일 이름
		    		String original = multi.getOriginalFileName(parameterName);
		    		// 전송된 파일의 내용 타입
		    		String type = multi.getContentType(parameterName);
		    		// 전송된 파일속성이 file 태그의 name 속성값을 이용해 파일객체생성
		    		File file = multi.getFile(parameterName);
		    		System.out.println("real Path : " + realPath);
		    		System.out.println("파라메터 이름 : " + parameterName);
		    		System.out.println("실제 파일 이름 : " + original);
		    		System.out.println("저장된 파일 이름 : " + serverSaveFilename);
		    		System.out.println("파일 타입 : " + type);
		    		if(file != null){
		    			System.out.println("크기 : " + file.length() + "<br>");
		    			dbSavePath.add(serverSaveFilename);
		    		}
		    	}
		    	board.setBrd_img_src(dbSavePath);
		    	String[] exist_img = multi.getParameterValues("exist_img");
		    	String[] update_img = multi.getParameterValues("update_img");
		    	System.out.println("기존파일 : " + exist_img);
	    		System.out.println("수정파일 : " + update_img);
	    		File file;
	    		if(exist_img!=null) {
			    	for(String i : exist_img) {
			    		String test = realPath + "/" +i;
			    		System.out.println("이미지 경로" + test);
			    		if(update_img!=null) {
			    			if(!(Arrays.asList(update_img).contains(i))) {
				    			file = new File(test);
				    			if(file.exists()) {
				    				file.delete();
				    			}
				    			dbDeletePath.add(i);
				    		}
			    		}else {
			    			file = new File(test);
			    			if(file.exists()) {
			    				file.delete();
			    			}
			    			dbDeletePath.add(i);
			    		}
			    	}
	    		}
		    	System.out.println(dbSavePath);
		    	pageNum = multi.getParameter("pageNum");
				// 2. Board board 생성하고 value setting
				System.out.println("로그인된 계정의 고유 id:" + usernum);
				System.out.println("게시글의 계정의 고유 id:" + board_usernum);
				System.out.println("UpdateProAction brd_secret-->"+multi.getParameter("brd_secret"));
				
				//게시글에 사용 되는 값들 게시글번호, 제목, 내용, 비밀글 여부
				board.setBrd_bid(Integer.parseInt(multi.getParameter("brd_bid")));
				board.setBrd_title(multi.getParameter("brd_title"));
				board.setBrd_content(multi.getParameter("brd_content"));
				board.setUsernum(board_usernum);
				
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
				System.out.println("brd_bid->" + board.brd_bid);
				System.out.println("brd_title->" +board.brd_title);
				System.out.println("brd_content->" +board.brd_content);
				System.out.println("brd_secret->" +board.brd_secret);
				
				// 3. BoardDao bd Instance
				BoardDao bd = BoardDao.getInstance();
				
				// 앞에 지정 했던 값을 db에 업데이트 한다.
				result = bd.update(dbDeletePath,board,usernum);
				
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
