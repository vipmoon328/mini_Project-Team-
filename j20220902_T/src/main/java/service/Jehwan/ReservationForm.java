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

import dao.ReservationDao;
import service.CommandProcess;

public class ReservationForm implements CommandProcess {

		@Override
		public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, JSONException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession();
		System.out.println("ResSelect start");
		String res_date = request.getParameter("res_date");
		String brnNum_text = request.getParameter("brnNum");
		String startString = request.getParameter("start");
		String endString = request.getParameter("end");
		int PossibleLane = 0;
		int brnNum;
		if(brnNum_text == "강남점") {
			brnNum=1;
		}else {
			brnNum=0;
		}
		if (res_date==null || res_date.equals("")) {
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Calendar cal = Calendar.getInstance();
			res_date = df.format(cal.getTime());
		}else {
			int start =Integer.parseInt(request.getParameter("start"));
			int end = Integer.parseInt(request.getParameter("end"));
			if(start<5) {
				start+=24;
			}
			
			if(end<5) {
				end+=24;
			}
			request.setAttribute("res_rid", request.getParameter("res_rid"));
			request.setAttribute("select_option", request.getParameter("select_option"));
			request.setAttribute("currentPage", request.getParameter("currentPage"));
			request.setAttribute("lane", request.getParameter("lane"));
			request.setAttribute("customer", request.getParameter("customer"));
			request.setAttribute("cost", request.getParameter("cost"));
			startString = String.valueOf(start);
			endString = String.valueOf(end);
			request.setAttribute("start", startString);
			request.setAttribute("end", endString);
		}

		ReservationDao rd = ReservationDao.getInstance();
		try {
			PossibleLane= rd.getPossibleLane(brnNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.setAttribute("brnNum", brnNum);
		request.setAttribute("res_date", res_date);
		request.setAttribute("possibleLane", PossibleLane);
		
		return "/Jehwan/reservationPro.jsp";
	}

}
