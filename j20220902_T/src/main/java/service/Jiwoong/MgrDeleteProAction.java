package service.Jiwoong;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;

import dao.UserDao;
import service.CommandProcess;

public class MgrDeleteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, JSONException {
		System.out.println("MgrDeleteProAction  Start...");	
		
		request.setCharacterEncoding("utf-8");
		
		try {
			String id = request.getParameter("user_id");
			String passwd = request.getParameter("user_password");
			
			System.out.println("MgrDeleteProAction id=>"+id);
			System.out.println("MgrDeleteProAction passwd=>"+passwd); // 파라미터 확인용
			
			UserDao ud = UserDao.getInstance();
			int result = ud.delete(id, passwd);			
			
			request.setAttribute("user_id", id);
			request.setAttribute("user_password", passwd);
			request.setAttribute("result", result);
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "/Jiwoong/mgrDeletePro.jsp";
	}

}
