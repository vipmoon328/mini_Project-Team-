package service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;

import dao.UserDao;
import dao.Users;

public class MyPageFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, JSONException {
		System.out.println("MyPageFormAction start...");
		HttpSession session = request.getSession();
		
		String id = (String) session.getAttribute("id");
		
		try {
			
			UserDao ud = UserDao.getInstance();
			Users users = ud.select(id);
			
			String[] test = users.getEmail().split("@");
			String email_id = test[0];
			String email_domain = test[1];
			
			//test 
			System.out.println(users.getId());
			System.out.println(users.getName());
			
			request.setAttribute("users", users);
			request.setAttribute("email_id", email_id);
			request.setAttribute("email_domain", email_domain);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "/minji/mypageForm.jsp";
	}

}
