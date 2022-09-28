package service;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;

import dao.UserDao;

public class loginAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException 
	{
		String id = request.getParameter("user_id");
		String passwd = request.getParameter("user_password");
		
		HttpSession session = request.getSession();
		
		UserDao userdao = UserDao.getInstance();
		int result = 0;
		try {
			result = userdao.login(id,passwd);
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		
		if(result == 1)
		{
			session.setAttribute("id",id);
			session.setAttribute("login_result", 1);
			System.out.println("로그인이 완료되었습니다.");
		}
		
		if(result == 0)
		{
			session.setAttribute("login_result", 0);
			System.out.println("로그인에 실패하셨습니다.");
		}
		
		return "loginPro.jsp";
	}

}
