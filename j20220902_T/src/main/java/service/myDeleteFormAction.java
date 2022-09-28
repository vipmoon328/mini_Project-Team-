package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;

import dao.UserDao;
import dao.Users;

public class myDeleteFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, JSONException {
		
		System.out.println("myDeleteFormAction start...");		
				
				String id = request.getParameter("user_id");
				try {				
					UserDao ud = UserDao.getInstance();	 			
					
					Users users = ud.select(id); 
					
					// 4. request 객체에 num , pageNum , board
					request.setAttribute("user_id", id);				
					request.setAttribute("users", users);
					
				} catch (Exception e) {
						System.out.println(e.getMessage());
			}
					
				return "myDeleteForm.jsp";
			}
		
	}