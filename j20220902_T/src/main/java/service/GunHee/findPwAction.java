package service.GunHee;

import java.io.IOException;
import service.CommandProcess;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;

import dao.UserDao;

public class findPwAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, JSONException {
		
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");	
		HttpSession session = request.getSession();

		String id = request.getParameter("user_id");
		String name = request.getParameter("user_name");
		String phone = request.getParameter("user_phone_number");
		
		int usernum = 0;
		
		System.out.println(name + " " + phone + " " + id);
		
		try {
			UserDao userdao = UserDao.getInstance();
			usernum = userdao.findPw(id, name, phone);
			request.setAttribute("id", id);
			session.setAttribute("usernum", usernum);
			System.out.println("세션 확인용: "+session.getAttribute("usernum"));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "/GunHee/findPwPro.jsp";
	}

}
