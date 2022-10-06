package service.Woosuk;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;

import dao.BoardDao;
import service.CommandProcess;

public class DeleteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, JSONException 
	{
		try {
			// 1. num , passwd , pageNum Get
			System.out.println("삭제 시퀸스 시작 2");
			HttpSession session = request.getSession();
			
			int num = Integer.parseInt((String.valueOf(session.getAttribute("num"))));
			String pageNum = (String) session.getAttribute ("pageNum");
			int usernum = Integer.parseInt((String.valueOf(session.getAttribute("usernum"))));
			
			System.out.println("글 번호: " + num);
			System.out.println("페이지 번호: " + pageNum);
			System.out.println("유저 번호: " + usernum);
			// 2. BoardDao bd Instance
			BoardDao bd = BoardDao.getInstance();
			
			// 3. 본인의 게시판만 삭제
			// 게시글 삭제 기능 삭제 하는것이 아닌 update를 통해 삭제 여부 값을 1로 변경
			int result = bd.delete(num,usernum);
			
			// 4. request 객체에  num , pageNum ,result
			request.setAttribute("num", num);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("result", result);
			System.out.println(result);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return "Woosuk/boardDeletePro.jsp";
	}

}
