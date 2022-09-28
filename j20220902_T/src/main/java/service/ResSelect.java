package service;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;

public class ResSelect implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, JSONException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		System.out.println("ResSelect start");
		String res_date = request.getParameter("res_date");
		System.out.println(res_date);
		if (res_date==null || res_date.equals("")) {
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Calendar cal = Calendar.getInstance();
			res_date = df.format(cal.getTime());
		}
		System.out.println(res_date);
		
		request.setAttribute("res_date", res_date);
		request.setAttribute("brnNum", request.getParameter("brnNum"));
		request.setAttribute("lane", request.getParameter("lane"));
		request.setAttribute("start", request.getParameter("start"));
		request.setAttribute("end", request.getParameter("end"));
		request.setAttribute("customer", request.getParameter("customer"));
		request.setAttribute("cost", request.getParameter("cost"));
		
		return "resAllView.jsp";
	}

}
