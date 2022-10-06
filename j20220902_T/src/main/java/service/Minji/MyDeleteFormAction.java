package service.Minji;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;

import dao.UserDao;
import dao.Users;
import service.CommandProcess;



public class MyDeleteFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, JSONException {
		
		System.out.println("MyDeleteFormAction start...");		
				
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("user_id");
		
		try {				
				UserDao ud = UserDao.getInstance();	 			
					
				Users users = ud.select(id); 
										
				request.setAttribute("user_id", id);				
				request.setAttribute("users", users);
					
			} catch (Exception e) {
						System.out.println(e.getMessage());
			}
					
			return "/Minji/myDeleteForm.jsp";
	}
		
}