package service.Jiwoong;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;

import dao.BoardDao;
import service.CommandProcess;

public class MgrBrdDeleteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, JSONException, SQLException {
		
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		System.out.println("mgrBrdDeleteProAction Start..."); // 디버깅
		
		
		String pageNum=request.getParameter("pageNum");
		String[] brd_bid1 =request.getParameterValues("brd_bid");
		
		// 체크박스 배열값 파라미터 가져오기
		
		int[]brd_bid = Arrays.stream(brd_bid1).mapToInt(Integer::parseInt).toArray(); // brd_bid 배열 int로 변환
		
		System.out.println("mgrBrdDeleteProAction Service brd_bid[] => "+ Arrays.toString(brd_bid)); // 디버깅
		
		BoardDao bd=BoardDao.getInstance();
		
		int result=bd.mgrDelete(brd_bid);
		
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("result", result);
		System.out.println("mgrBrdDeleteProAction Service result=>"+result);
		return "Jiwoong/mgrBrdDeletePro.jsp";
	}

}
