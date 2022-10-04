package service.Jehwan;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;

import dao.ReservationDao;
import service.CommandProcess;

public class ResDeletePro implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, JSONException {
		String[] cancel_rid= request.getParameterValues("cancel");
		ReservationDao rd = ReservationDao.getInstance();
		int result=0;
		try {
			result = rd.cancelRes(cancel_rid);
		} catch (Exception e) {
			// TODO: handle exception
		}
		System.out.println(result);
		request.setAttribute("currentPage", request.getParameter("currentPage"));
		return "/Jehwan/myReservationPro.jsp";
	}

}
