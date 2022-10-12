package service.Jiwoong;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;

import dao.UserDao;
import dao.Users;
import service.CommandProcess;

public class MgrListAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, JSONException {
			// 한글 Encoding
			response.setContentType("text/html; charset=utf-8");
			request.setCharacterEncoding("utf-8");
			
	
			System.out.println("MgrListAction Service start...");
			
			
			
			// 검색필드 및 검색어 파라미터 가져오기
			String searchField = request.getParameter("searchField");  //  검색 항목
			if(searchField==null || searchField.equals("")) {searchField="";}
			String query   = request.getParameter("query");            //  검색어
			if(query==null || query.equals(""))	{query ="";}
			
			System.out.println("MgrListAction Service searchField : "+searchField);
			System.out.println("MgrListAction Service query : "+ query);
			UserDao ud =UserDao.getInstance();
		try {
			int totCnt =ud.getTotalCnt(searchField, query); 
			// 현 페이지 정보 설정
			String pageNum = request.getParameter("pageNum");
			if(pageNum==null || pageNum.equals("")) {pageNum ="1";}
			
			// 한 페이지에 출력될 회원 수, 블록 크기
			int pageSize = 2, blockSize =5;
			
			int currentPage = Integer.parseInt(pageNum);   			  //  현재 페이지
			System.out.println("MgrListAction Service currentPage: "+currentPage); 						 
			int startRow = (currentPage - 1) * pageSize + 1;         //   페이지의 시작글 번호  -->  delete,insert 등을 대비한 늘 일정한 단위로 구분되는 가상 번호
			int endRow   = startRow + pageSize - 1;                 //    페이지의 마지막글 번호 --> delete,insert 등을 대비한 늘 일정한 단위로 구분되는 가상 번호
			int startNum = startRow; 
			System.out.println("MgrListAction Service startRow, endRow, searchField, query=>"+startRow+ endRow +searchField+ query);
			
			// Users 전체 조회 및 검색 조회
			List<Users> list = ud.getUsersList(startRow, endRow, searchField, query);
			
			System.out.println("MgrListAction Service totCnt->"+totCnt);
			System.out.println("MgrListAction Service list.size()->"+list.size());

			
			// 목록을 조회하기 위해 필요한 총 페이지 수
			int pageCnt = (int)Math.ceil((double)totCnt/pageSize); 
			                     
			int startPage = (int)(currentPage-1)/blockSize*blockSize + 1;      
			int endPage = startPage + blockSize -1;	                        
			if (endPage > pageCnt) endPage = pageCnt;
			
			request.setAttribute("searchField", searchField);  
			request.setAttribute("query", query);
			request.setAttribute("list", list);  
			request.setAttribute("totCnt", totCnt);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("startNum", startNum);
			request.setAttribute("blockSize", blockSize);
			request.setAttribute("pageCnt", pageCnt);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("searchField",searchField);
		} catch (Exception e) {
			System.out.println("mgrListAction e.getMessage()->"+e.getMessage());
		}
		
		return "/Jiwoong/mgrList.jsp";   // view
	
	}	
			
			 
			 
			
			
		
			
		
		
			
}			
			
			
			
			
			
			
			
			
			

		
		 
	


		
		
		
		
		
