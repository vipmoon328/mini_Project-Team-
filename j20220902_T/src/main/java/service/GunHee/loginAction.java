package service.GunHee;

import java.io.IOException;
import java.sql.SQLException;
import service.CommandProcess;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;

import dao.UserDao;
import dao.Users;

public class loginAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException, JSONException 
	{
		String id = request.getParameter("user_id");
		String passwd = request.getParameter("user_password");
		
		System.out.println(id);
		System.out.println(passwd);
		
		HttpSession session = request.getSession();
		Users users = new Users();
		UserDao userdao = UserDao.getInstance();
		try {
			users = userdao.login(id,passwd);
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		
		if(users.getName().equals("Not Exist"))
		{
			session.setAttribute("login_result", 0);
			System.out.println("로그인에 실패하셨습니다.");
		} else {
			String locName = "";
			
			if(users.getBrn_uid() == 0)
			{
				locName = "이대";
			}
			else
			{
				locName = "강남";
			}
			
			session.setAttribute("name", users.getName());
			session.setAttribute("id",id);
			session.setAttribute("auth", users.getAuth());
			session.setAttribute("usernum", users.getUsernum());
			session.setAttribute("loc", users.getBrn_uid());
			session.setAttribute("locName",locName);
			session.setAttribute("login_result", 1);
			
			System.out.println("auth=>" +users.getAuth());
		}
		
		return "/GunHee/loginPro.jsp";
	}

}
