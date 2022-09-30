package service.Jiwoong;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;

import dao.UserDao;
import dao.Users;
import service.CommandProcess;

public class MgrListAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, JSONException {
		// TODO Auto-generated method stub
		System.out.println("MgrListAction Service start...");
		
		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		UserDao ud =UserDao.getInstance();
		
		try {
			int totCnt =ud.getTotalCnt();
			
			String pageNum = request.getParameter("pageNum");
			if(pageNum==null || pageNum.equals("")) {pageNum ="1" ; }  // 기본 페이지 1 Setting
			int currentPage = Integer.parseInt(pageNum);   			  // 현재 페이지
			int pageSize = 4, blockSize =10;  						 // 한 페이지의 게시글 개수  페이지바 크기..? 
			int startRow = (currentPage-1) * pageSize +1;			//  한 페이지의 시작글 번호
			int endRow   = startRow+ pageSize-1;                   //   한 페이지의 마지막글 번호
			int startNum = startRow;
			
			
			
			String selectOption = request.getParameter("searchField");  // 
			String inputValue   = request.getParameter("query");        //
			
			
			System.out.println(selectOption);
			System.out.println(inputValue);
			
			
			
			
			//Users 조회
			List<Users> list = ud.usersList(startRow, endRow);
			
			int pageCnt = (int)Math.ceil((double)totCnt/pageSize); 
			                     
			int startPage = (int)(currentPage-1)/blockSize*blockSize + 1;      
			int endPage = startPage + blockSize -1;	                        
			if (endPage > pageCnt) endPage = pageCnt;
			
			request.setAttribute("list", list);  
			request.setAttribute("totCnt", totCnt);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("startNum", startNum);
			request.setAttribute("blockSize", blockSize);
			request.setAttribute("pageCnt", pageCnt);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
		} catch (Exception e) {
			System.out.println("mgrListAction e.getMessage()->"+e.getMessage());
		}
		
		return "/Jiwoong/mgrList.jsp";   // view
	
	}

		
		 
	

}
		
		
		
		
		
