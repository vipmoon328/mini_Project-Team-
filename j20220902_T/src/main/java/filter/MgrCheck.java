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

@WebFilter(urlPatterns = { "/mgrList.do" ,"/managerSales.do","/mgrBrdMgt.do"})
public class MgrCheck implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		System.out.println("MgrCheck doFilter ...");
		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		HttpServletResponse httpServletResponse = (HttpServletResponse) response;
		// Session 도출 방법
		HttpSession session = httpServletRequest.getSession();
		
		// String path = httpServletRequest.getServletPath();
		String context = httpServletRequest.getContextPath();
		System.out.println(context);
		if (session == null || session.equals("")) {
			httpServletResponse.sendRedirect("/j20220902_T/GunHee/loginForm.jsp");
			return;
		}
		System.out.println("1=>");
		System.out.println("auth=>" +String.valueOf(session.getAttribute("auth")));
		
		String id = (String)session.getAttribute("id");
		if(id == null || id.equals("")) {
			httpServletResponse.sendRedirect("/j20220902_T/GunHee/loginForm.jsp");
			return;
		}
		
		int auth = Integer.parseInt(String.valueOf(session.getAttribute("auth")));
		System.out.println("auth=>" +auth);
		System.out.println("2");
		if ( auth != 0 ) {
			httpServletResponse.sendRedirect("/j20220902_T/hyojung/mainHomeView.jsp");
			return;
		} 
		System.out.println("3");
		chain.doFilter(request, response);
	}
}
