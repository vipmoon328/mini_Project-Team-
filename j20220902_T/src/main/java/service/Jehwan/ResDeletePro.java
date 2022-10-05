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
		String action_result = "";
		ReservationDao rd = ReservationDao.getInstance();
		int result=0;
		try {
			result = rd.cancelRes(cancel_rid);
			if(result >0) {
				action_result = "예약 취소 완료";
			}else {
				action_result = "예약 취소 실패";
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		System.out.println(result);
		request.setAttribute("currentPage", request.getParameter("currentPage"));
		request.setAttribute("select_option", request.getParameter("select_option"));
		request.setAttribute("result", action_result);
		return "/Jehwan/myReservationPro.jsp";
	}

}
