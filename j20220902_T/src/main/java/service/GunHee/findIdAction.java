package service.GunHee;

import java.io.IOException;
import service.CommandProcess;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;

import dao.UserDao;
import dao.Users;

public class findIdAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, JSONException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");	
		HttpSession session = request.getSession();
		
		String name = request.getParameter("user_name");
		String phone = request.getParameter("user_phone_number");
		String id ="";
		System.out.println(name + " " + phone);
		
		
		
		try {
			UserDao userdao = UserDao.getInstance();
			Users users = new Users();
			users = userdao.findId(name, phone);
			System.out.println("조회한 아이디: "+ users.getId());
			session.setAttribute("id", users.getId());
			request.setAttribute("name", name);
			request.setAttribute("phone", phone);
			session.setAttribute("usernum", users.getUsernum());
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "/GunHee/findIdPro.jsp";
	}

}
