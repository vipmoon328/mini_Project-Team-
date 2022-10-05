package service.Woosuk;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;
import service.CommandProcess;

public class ListAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); 
		System.out.println("ListAction Service start...");
		String srh_input = request.getParameter("srh_input");
		if (srh_input == null)	srh_input = "%";
		else                    srh_input = '%'+srh_input+'%';
		System.out.println("srh_input try->"+srh_input);
		String srh_select = request.getParameter("srh_select");
		if (srh_select == null) srh_select = "brd_title";
		System.out.println("srh_select try->"+srh_select);
		System.out.println("전totCnt->->");
			
		BoardDao bd = BoardDao.getInstance();
		
		try {
			int totCnt = bd.getSearchCnt(srh_select, srh_input); //37개
     //		int totCnt = bd.getTotalCnt(); //37개
			System.out.println("ListAction Service totCnt->"+totCnt);
			
			String pageNum = request.getParameter("pageNum");
			if(pageNum == null||pageNum.equals(""))//데이터가 있든 없든 강제로 1페이지 지정
			{
				pageNum = "1";
			}
			int currentPage = Integer.parseInt(pageNum);//1		2
			int pageSize = 10, //한 페이지당 게시글 갯수
					blockSize = 10; // 총 페이지 갯수
							//1-1 로 0 이여서 처음은 1페이지만 지정
			int startRow = (currentPage - 1)*pageSize +1;//1	11
			int endRow = startRow + pageSize -1;		//10	20
			int startNum = totCnt - startRow + 1;
			
			//board 조회						1번부터		(10번)11번까지
			List<Board> list = bd.boardListSearch(startRow, endRow, srh_select, srh_input);
												// 37/10 으로 3.7을 반올림 해서 4페이지 나오게 했다
			int pageCnt = (int)Math.ceil((double)totCnt/pageSize);
									//(첫페이지시 1-1 0으로 +1로 1페이지)
			int startPage = (int)(currentPage-1)/blockSize*blockSize +1;
			int endPage = startPage + blockSize -1;// 1+9 로 10 페이지 결과
			
			if(endPage>pageCnt) endPage = pageCnt;
			
			
			request.setAttribute("list", list); // 
			//페이지 정보들을 전부 보낸다
			request.setAttribute("totCnt", totCnt);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("startNum", startNum);
			
			request.setAttribute("blockSize", blockSize);
			request.setAttribute("pageCnt", pageCnt);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
		} catch (Exception e) {
			System.out.println("ListAction e.getMessage()->"+e.getMessage());
		}
		return "Woosuk/boardList.jsp";
	}

}
