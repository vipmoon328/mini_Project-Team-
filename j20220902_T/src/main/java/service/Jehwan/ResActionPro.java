package service.Jehwan;

import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;

import dao.Reservation;
import dao.ReservationDao;
import service.CommandProcess;

public class ResActionPro implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, JSONException {
		System.out.println("resAction Service start");
		HttpSession session = request.getSession();
		System.out.println(request.getParameter("lane"));
		System.out.println(request.getParameter("start"));
		System.out.println(request.getParameter("end"));
		System.out.println(request.getParameter("many"));
		System.out.println(request.getParameter("cost"));
		System.out.println(request.getParameter("jijum"));
		DateFormat df = new SimpleDateFormat("yyMMdd");
		Calendar cal = Calendar.getInstance();
		String action_result = "";
		String inputYear = request.getParameter("inputYear"); 
		String inputMon = request.getParameter("inputMonth"); 
		String inputDate = request.getParameter("inputDate"); 
		String res_rid = request.getParameter("res_rid");
		int USERNUM = Integer.parseInt(String.valueOf(session.getAttribute("usernum")));
		cal.set(Integer.parseInt(inputYear), Integer.parseInt(inputMon),Integer.parseInt(inputDate));
		String res_date = df.format(cal.getTime());
		// TODO Auto-generated method stub
		Reservation reservation = new Reservation();
		reservation.setRes_lane(Integer.parseInt(request.getParameter("lane")));
		reservation.setRes_startTime(Integer.parseInt(request.getParameter("start")));
		reservation.setRes_endTime(Integer.parseInt(request.getParameter("end")));
		reservation.setRes_customer(Integer.parseInt(request.getParameter("many")));
		reservation.setRes_sal(Integer.parseInt(request.getParameter("cost")));
		reservation.setusernum(USERNUM);
		reservation.setRes_brnNum(Integer.parseInt(request.getParameter("jijum")));
		ReservationDao rd = ReservationDao.getInstance();
		int result = 0;
		try {
			if (res_rid==null || res_rid.equals("")) {
				System.out.println("입력실행");
				result = rd.makeRes(res_date, reservation);
				if(result>0) {
					action_result = "예약 완료";
				}else {
					action_result = "예약 실패";
				}
			}else {
				System.out.println("수정실행");
				reservation.setRes_rid(Integer.parseInt(res_rid));
				result = rd.changeRes(res_date, reservation);
				if(result>0) {
					action_result = "예약 변경 완료";
				}else {
					action_result = "예약 변경 실패";
				}
				request.setAttribute("select_option", request.getParameter("select_option"));
				request.setAttribute("currentPage", request.getParameter("currentPage"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//request.setAttribute("USERNUM", USERNUM);
		request.setAttribute("result", action_result);
		return "/Jehwan/myReservationPro.jsp";
	}

}
