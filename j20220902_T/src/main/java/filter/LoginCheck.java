package filter;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

	

public class LoginCheck implements Filter {
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		System.out.println("LoginCheck doFilter ...");
		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		HttpServletResponse httpServletResponse = (HttpServletResponse) response;
		// Session 도출 방법
		HttpSession session = httpServletRequest.getSession();
		//String path = httpServletRequest.getServletPath();
	    String context = httpServletRequest.getContextPath();
	    System.out.println(context);
		if(session == null || session.equals("")) {
			httpServletResponse.sendRedirect("/j20220902_T/GunHee/loginForm.jsp");
			return;
		}
		String id = (String)session.getAttribute("id");
		if(id == null || id.equals("")) {
			httpServletResponse.sendRedirect("/j20220902_T/GunHee/loginForm.jsp");
			return;
		}

		chain.doFilter(request, response);
	}

}
