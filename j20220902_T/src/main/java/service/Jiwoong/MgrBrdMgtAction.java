package service.Jiwoong;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;

import dao.Board;
import dao.BoardDao;
import service.CommandProcess;

public class MgrBrdMgtAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, JSONException {
			// 한글 Encoding
			response.setContentType("text/html; charset=utf-8");
			request.setCharacterEncoding("utf-8");
			
			System.out.println("MgrBrdMgtAction Service start...."); // 디버깅
			String srh_input = request.getParameter("srh-input");
			if(srh_input == null) srh_input= "%";
			else				  srh_input='%'+srh_input+'%';
			System.out.println("MgrBrdMgtAction srh-input =>"+srh_input); // 디버깅
			String srh_select = request.getParameter("srh_select");
			if(srh_select == null) srh_select="brd_title";
			System.out.println("MgrBrdMgtAction srh_select =>" + srh_select); // 디버깅
			System.out.println("전totCnt=>");
			
			BoardDao bd = BoardDao.getInstance();
			
			try {
				int totCnt = bd.getSearchCnt(srh_select, srh_input);
				System.out.println("MgrBrdMgtAction totCnt=>"+ totCnt );  // 디버깅
				
				String pageNum = request.getParameter("pageNum");
				if(pageNum ==null || pageNum.equals("")) pageNum="1";
				
				int currentPage = Integer.parseInt(pageNum);
				int pageSize = 10,blockSize = 10; 	 		
										
								
				int startRow = (currentPage - 1)*pageSize +1;
				int endRow = startRow + pageSize -1;		
				int startNum = totCnt - startRow + 1;
				
				// Board 조회
				List<Board> list = bd.boardListSearch(startRow, endRow, srh_select, srh_input);
				
				int pageCnt = (int)Math.ceil((double)totCnt/pageSize);
				//(첫페이지시 1-1 0으로 +1로 1페이지)
				int startPage = (int)(currentPage-1)/blockSize*blockSize +1;
				int endPage = startPage + blockSize -1;// 1+9 로 10 페이지 결과

				if(endPage>pageCnt) endPage = pageCnt;
				
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
				System.out.println("MgrBrdMgtAction e.getMessage()=>"+e.getMessage());
			}
			return "/Jiwoong/mgrBrdMgt.jsp";
	} 
	
}	
			
			
		
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
	
	
	
	
	

