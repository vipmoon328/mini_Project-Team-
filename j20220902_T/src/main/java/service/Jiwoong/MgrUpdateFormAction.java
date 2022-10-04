package service.Jiwoong;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.User;
import org.json.JSONException;

import dao.UserDao;
import dao.Users;
import service.CommandProcess;

public class MgrUpdateFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, JSONException {
		System.out.println("MgrUpdateFormAction start...");
		
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String pageNum= request.getParameter("pageNum");
		System.out.println("id=>"+ id);
		System.out.println("pageNum=>" + pageNum);
		try {
			
			UserDao ud = UserDao.getInstance();
			
			Users users = ud.select(id);
			String[] test = users.getEmail().split("@");
			String email_id = test[0];
			String email_domain = test[1];
			
			System.out.println("--파리미터 값 테스트--");
			System.out.println(users.getId());
			System.out.println(users.getName());
			System.out.println(users.getGender());
			System.out.println(users.getBrn_uid());
			System.out.println("email_id:" +email_id);
			System.out.println("email_domain:" +email_domain);
			
			request.setAttribute("users", users);
			request.setAttribute("email_id", email_id);
			request.setAttribute("email_domain", email_domain);
			request.setAttribute("pageNum", pageNum);
			
		
			
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		
		return "/Jiwoong/mgrUpdateForm.jsp";
	}

}

		
		
		
		
		
		