package service.Woosuk;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.Servlet;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.Board;
import dao.BoardDao;
import service.CommandProcess;

public class WriteFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException , JSONException{
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
			
			/*
			 * request.setCharacterEncoding("utf-8"); int maxSize = 5 * 1024 * 1024;
			 * 
			 * ServletContext context = request.getSession().getServletContext();
			 * 
			 * String fileSave = context.getContextPath(); String fileSave2 =
			 * context.getRealPath("../fileSave");
			 * 
			 * System.out.println("파일 저장 위치 1: "+fileSave);
			 * System.out.println("파일 저장 위치 2: "+fileSave2);
			 */
			
			//MultipartRequest multi = new MultipartRequest(request,realPath,maxSize,"utf-8", new DefaultFileRenamePolicy());
			
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
			
		return "Woosuk/boardWriteForm.jsp";
	}

}
