package service;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import dao.Reservation;
import dao.ReservationDao;

public class ResAllCheck implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, JSONException {
		// TODO Auto-generated method stub
		System.out.println("resallaction Service start");
		JSONArray result = new JSONArray();
		ReservationDao rd = ReservationDao.getInstance();
		 DateFormat df = new SimpleDateFormat("yyMMdd");
		 Calendar cal = Calendar.getInstance();
		try {
			 String branch = request.getParameter("branch") ;
			 String inputYear = request.getParameter("inputYear"); 
			 String inputMon = request.getParameter("inputMonth"); 
			 String inputDate = request.getParameter("inputDate"); 
			 System.out.println(inputYear);
			 System.out.println(inputMon);
			 System.out.println(inputDate);
			 if (inputYear==null || inputYear.equals("")) {	
				 cal.setTime(new Date());
				 branch = "1";
			 }else {
				 cal.set(Integer.parseInt(inputYear), Integer.parseInt(inputMon),Integer.parseInt(inputDate));
			 }
			 
			 String res_date = df.format(cal.getTime());
			 //res_date = res_date.replaceAll("-", "");
			 System.out.println(res_date);
			 System.out.println(branch);
			List<Reservation> list = rd.resInfo(branch, res_date);
			
			for(Reservation reservation : list) {
				JSONObject obj = new JSONObject();
				obj.put("start", reservation.getRes_startTime());
				obj.put("end", reservation.getRes_endTime());
				obj.put("lane", reservation.getRes_lane());
				result.put(obj);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return result.toString();
	}

}
