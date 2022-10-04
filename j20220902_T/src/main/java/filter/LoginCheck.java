package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter("/Jehwan/*")
public class LoginCheck implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		
		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		HttpServletResponse httpServletResponse = (HttpServletResponse) response;
		// Session 도출 방법
		HttpSession session = httpServletRequest.getSession();
		System.out.println("LoginCheck doFilter ...");
		if(session == null || session.equals("")) {
			httpServletResponse.sendRedirect("../GunHee/loginForm.jsp");
		}
		String id = (String)session.getAttribute("id");
		if(id == null || id.equals("")) {
			httpServletResponse.sendRedirect("../GunHee/loginForm.jsp");
		}
		chain.doFilter(request, response);
	}

}
