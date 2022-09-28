package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import dao.Users;

public class signUpAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{

		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("user_id");
		String pw = request.getParameter("user_password");
		String name = request.getParameter("user_name");
		String phone = request.getParameter("user_phone_number");
		String gender = request.getParameter("gender");
		String email = request.getParameter("user_email1");
		email +="@";
		email += request.getParameter("user_email2");
		int loc = Integer.parseInt(request.getParameter("loc"));
		
		int result = 0;
		Users user = new Users();
		user.setId(id);
		user.setPw(pw);
		user.setName(name);
		user.setPhone(phone);
		user.setGender(gender);
		user.setEmail(email);
		user.setLoc(loc);
		
		try {
			UserDao userDao = UserDao.getInstance();
			result = userDao.insert(user);
		} catch (Exception e) {
			System.out.println(e.getMessage()); 
		}
		
		System.out.println("result: "+result);
		System.out.println("name: "+name);
		request.setAttribute("result", result);
		request.setAttribute("name", name);
		
		return "signUpPro.jsp";
	}

}
