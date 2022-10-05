package service.Woosuk;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;

public class WriteFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("WriteFormAction Start....");
		try 
		{
			//신규 글일때 값들 0으로 지정
			int num = 0, brd_ref = 0, brd_re_level = 0, brd_re_step = 0;
			String pageNum = request.getParameter("pageNum");
			if (pageNum == null) 
			{
				pageNum = "1";
			}
			
			//지정된 값을 전부 세팅
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
