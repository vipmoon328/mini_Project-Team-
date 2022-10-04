package service.GunHee;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;

import dao.UserDao;
import service.CommandProcess;

public class IdCheckAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, JSONException 
	{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String id = request.getParameter("id");

		int result = 0;
		String res = "";
		try {
			UserDao userDao = UserDao.getInstance();
			result = userDao.checkId(id);
			if(result==0)
			{
				res = "Not Exist";
			}
			else
			{
				res = "Exist";
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return res;
	}

}
