package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;

import dao.UserDao;
import dao.Users;


public class MyPageProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, JSONException {
				
				System.out.println("MyPageActionPro Start...");	
		
		
				request.setCharacterEncoding("utf-8");  // post방식은 엔코딩 처리를 해주어야함
				String pageNum = request.getParameter("pageNum");
				
				try {
					
					Users users = new Users();
					users.setId(request.getParameter("id"));
					users.setPw(request.getParameter("pw"));
					users.setName(request.getParameter("name"));
					users.setGender(request.getParameter("gender"));
					users.setPhone(request.getParameter("phone"));
					users.setEmail(request.getParameter("email"));
					users.setBrn_uid(Integer.parseInt(request.getParameter("brn_uid")));
			
					UserDao ud = UserDao.getInstance();
					int result = ud.update(users);
					
					request.setAttribute("result", result);
					request.setAttribute("users", users);
					
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
				return "/minji/mypagePro.jsp";
			}

		}
