package service.GunHee;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONException;

import com.mysql.cj.Session;

import service.CommandProcess;

public class logOutAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, JSONException {
		{	
			HttpSession session = request.getSession();
			session.invalidate();
			System.out.println("로그아웃 완료");
		}
		
		return "/GunHee/logout.jsp";
	}

}
