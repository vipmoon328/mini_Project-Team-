package service.Jehwan;

import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;

import dao.Reservation;
import dao.ReservationDao;
import service.CommandProcess;

public class ResActionPro implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, JSONException {
		System.out.println("resAction Service start");
		DateFormat df = new SimpleDateFormat("yyMMdd");
		Calendar cal = Calendar.getInstance();
		String inputYear = request.getParameter("inputYear"); 
		String inputMon = request.getParameter("inputMonth"); 
		String inputDate = request.getParameter("inputDate"); 
		String res_rid = request.getParameter("res_rid");
		int USERNUM = Integer.parseInt(request.getParameter("USERNUM"));
		cal.set(Integer.parseInt(inputYear), Integer.parseInt(inputMon),Integer.parseInt(inputDate));
		String res_date = df.format(cal.getTime());
		// TODO Auto-generated method stub
		Reservation reservation = new Reservation();
		reservation.setRes_lane(Integer.parseInt(request.getParameter("lane")));
		reservation.setRes_startTime(Integer.parseInt(request.getParameter("start")));
		reservation.setRes_endTime(Integer.parseInt(request.getParameter("end")));
		reservation.setRes_customer(Integer.parseInt(request.getParameter("many")));
		reservation.setRes_sal(Integer.parseInt(request.getParameter("cost")));
		reservation.setRes_userNum(USERNUM);
		reservation.setRes_brnNum(Integer.parseInt(request.getParameter("jijum")));
		System.out.println("res_rid=" + res_rid);
		ReservationDao rd = ReservationDao.getInstance();
		int result = 0;
		try {
			if (res_rid==null || res_rid.equals("")) {
				System.out.println("입력실행");
				result = rd.makeRes(res_date, reservation);
			}else {
				System.out.println("수정실행");
				reservation.setRes_rid(Integer.parseInt(res_rid));
				result = rd.changeRes(res_date, reservation);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("USERNUM", USERNUM);
		request.setAttribute("result", result);
		return "/Jehwan/myReservationPro.jsp";
	}

}
