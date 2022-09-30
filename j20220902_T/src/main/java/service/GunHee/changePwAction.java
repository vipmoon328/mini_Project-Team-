package service.GunHee;

import service.CommandProcess;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;

import dao.UserDao;

public class changePwAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, JSONException{
		HttpSession session = request.getSession();
		System.out.println("세션값 가져오기: "+session.getAttribute("usernum"));
		
		String usernum = String.valueOf(session.getAttribute("usernum"));
		String pw = request.getParameter("user_password");
		int result = 0;
		
		try {
			UserDao userdao = UserDao.getInstance();
			result = userdao.updatePw(pw, usernum);
				
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		if(result == 0)
		{
			System.out.println("삽입 실패");
		} else {
			System.out.println("삽입 성공");
		}
		
		request.setAttribute("result", result);
		
		return "/GunHee/changePwPro.jsp";
	}

}
