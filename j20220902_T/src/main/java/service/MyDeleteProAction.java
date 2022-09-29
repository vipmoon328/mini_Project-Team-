package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;


import dao.UserDao;

public class MyDeleteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, JSONException {
		
		System.out.println("MyDeleteProAction Start...");	
		
		try {				
			String id = request.getParameter("user_id");
			String passwd = request.getParameter("user_password");
					
			UserDao ud = UserDao.getInstance();			
			
			int result = ud.delete(id, passwd);			
					
	        request.setAttribute("user_id", id);
			request.setAttribute("user_password", passwd);
			request.setAttribute("result", result); 
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "myDeletePro.jsp";
	}

}