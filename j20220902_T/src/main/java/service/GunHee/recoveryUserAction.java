package service.GunHee;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;

import dao.UserDao;
import service.CommandProcess;

public class recoveryUserAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, JSONException 
	{
		System.out.println("회원 복구 절차 시작");
		request.setCharacterEncoding("utf-8");
		int resultRecovery = 0;
		try 
		{
			int usernum = Integer.parseInt(request.getParameter("userNum"));
			String pageNum= request.getParameter("pageNum");
			System.out.println("UserNum: "+ usernum);
			System.out.println("PageNum: "+ pageNum);
			UserDao userdao = UserDao.getInstance();
			resultRecovery = userdao.recoveryUser(usernum);
			request.setAttribute("result", resultRecovery);
			request.setAttribute("pageNum", pageNum);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} 
		
		return "/GunHee/userRecoveraryPro.jsp";
	}

}
