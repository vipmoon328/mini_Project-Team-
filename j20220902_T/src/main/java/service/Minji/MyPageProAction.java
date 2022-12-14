package service.Minji;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;

import dao.UserDao;
import dao.Users;
import service.CommandProcess;


public class MyPageProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, JSONException {
				
				System.out.println("MyPageActionPro Start...");	
				
				response.setContentType("text/html;charset=utf-8");
				request.setCharacterEncoding("utf-8");  
				
				String email = request.getParameter("user_email1");
				email += "@";
				email += request.getParameter("user_email2");
				System.out.println(email);
				
				try {
					UserDao ud = UserDao.getInstance();
					Users users = new Users();
					users.setId(request.getParameter("user_id"));
					users.setPw(request.getParameter("user_password"));
					users.setName(request.getParameter("user_name"));
					users.setGender(request.getParameter("gender"));
					users.setPhone(request.getParameter("user_phone_number"));
					users.setEmail(email);
					users.setBrn_uid(Integer.parseInt(request.getParameter("brn_uid")));
					int result = ud.update(users);
					if(result == 0)
					{
						System.out.println("수정 실패");
					}
					else {
						System.out.println("수정 성공");
					}
					request.setAttribute("result", result);
					request.setAttribute("users", users);
					
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
				return "/Minji/mypagePro.jsp";
			}

		}
