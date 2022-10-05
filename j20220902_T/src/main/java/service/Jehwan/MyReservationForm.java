package service.Jehwan;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;

import dao.ReservationDao;
import service.CommandProcess;

public class MyReservationForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, JSONException {
		// TODO Auto-generated method stub
		//request.setAttribute("USERNUM", request.getParameter("USERNUM"));
		
		return "/Jehwan/myReservationPro.jsp";
	}

}
