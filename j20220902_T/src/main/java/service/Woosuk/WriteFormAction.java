package service.Woosuk;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;

import dao.Board;
import dao.BoardDao;
import service.CommandProcess;

public class WriteFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, JSONException {
		System.out.println("WriteFormAction Start....");
		try 
		{
			//신규 글일때
			int num = 0, brd_ref = 0, brd_re_level = 0, brd_re_step = 0;
			String pageNum = request.getParameter("pageNum");
			if (pageNum == null) 
			{
				pageNum = "1";
			}

			request.setAttribute("num", num);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("brd_ref", brd_ref);
			request.setAttribute("brd_re_level", brd_re_level);
			request.setAttribute("brd_re_step", brd_re_step);
			System.out.println("writeFormAction num ->"+num);
			System.out.println("writeFormAction brd_ref ->"+brd_ref);
			System.out.println("writeFormAction brd_re_level ->"+brd_re_level);
			System.out.println("writeFormAction brd_re_step ->"+brd_re_step);
			
		} 
		catch (Exception e) 
		{
			System.out.println(e.getMessage());
		}
			
		return "boardWriteForm.jsp";
	}

}
