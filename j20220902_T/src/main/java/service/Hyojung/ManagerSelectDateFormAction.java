package service.Hyojung;

import java.io.IOException;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;

import dao.Reservation;
import dao.ReservationDao;
import service.CommandProcess;

public class ManagerSelectDateFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, JSONException {
		System.out.println("ManagerSelectDateFormAction >> 나 탓어!");
		
		int year = Calendar.getInstance().get(Calendar.YEAR);
		System.out.println("ManagerSelectDateFormAction year kkk->"+year);
		
		ReservationDao rd = ReservationDao.getInstance();
		
		try {
			
			String pageNum    = request.getParameter("pageNum");
			String startDate  = request.getParameter("startDate");
			String endDate    = request.getParameter("endDate");
			
			int totCnt = rd.getFromToTotalCnt(startDate,endDate); 
			
			System.out.println("ManagerSelectDateFormAction startDate->"+startDate);			
			System.out.println("ManagerSelectDateFormAction endDate->"+endDate);
			
			if(startDate == null  || startDate.length() < 4) {
				startDate = year +".01.01";
			} else {
				System.out.println("ManagerSelectDateFormAction NN startDate->"+startDate);
			}
			if(endDate == null   || endDate.length() < 4)  {
				endDate = year +".12.31";
			} else {
				System.out.println("ManagerSelectDateFormAction NN endDate->"+endDate);				
			}
			
			if(pageNum==null || pageNum.equals(""))
			{ pageNum = "1"; }
			int currentPage = Integer.parseInt(pageNum);
			int pageSize = 10, blockSize = 10;
			int startRow = (currentPage -1) * pageSize +1;
			//               1          10
			int endRow   = startRow + pageSize -1;
			int startNum = totCnt - startRow +1;
			
			
			System.out.println("ManagerSelectDateFormAction totCnt->"+totCnt);
			System.out.println("ManagerSelectDateFormAction endRow->"+endRow);
			System.out.println("ManagerSelectDateFormAction pageNum->"+ pageNum);

			List<Reservation> reserveSelectList = rd.reserveSelectList(startRow,endRow,startDate,endDate);    		 	
			System.out.println("ManagerSelectDateFormAction reserveSelectList.size()->"+reserveSelectList.size());
			
			int pageCnt = (int) Math.ceil((double)totCnt/pageSize);
			int startPage = (int)(currentPage -1)/blockSize*blockSize +1;
			int endPage = startPage + blockSize -1;
			if(endPage > pageCnt) endPage = pageCnt;
	
			
			System.out.println("ManagerSelectDateFormAction currentPage->"+currentPage);
			System.out.println("ManagerSelectDateFormAction pageCnt->"+pageCnt);
			System.out.println("ManagerSelectDateFormAction startPage->"+startPage);
			System.out.println("ManagerSelectDateFormAction endPage->"+endPage);

			request.setAttribute("reserveList", reserveSelectList);
			request.setAttribute("totCnt", totCnt);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("startNum", startNum);
			request.setAttribute("blockSize", blockSize);
			request.setAttribute("startDate", startDate);
			request.setAttribute("endDate", endDate);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
		} catch (Exception e) {
			System.out.println("ManagerSelectDateFormAction >" +e.getMessage());
		}
		return "/hyojung/managerSales.jsp";
	}

}
