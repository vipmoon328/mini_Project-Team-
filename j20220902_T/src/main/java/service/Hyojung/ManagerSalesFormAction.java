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


public class ManagerSalesFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, JSONException {
		System.out.println("ManagerSalesFormAction >>  나 탔어!");
		int year = Calendar.getInstance().get(Calendar.YEAR);
		
		ReservationDao rd = ReservationDao.getInstance();
		System.out.println("ManagerSalesFormAction year kkk->"+year);

		try {
			int mgrTotCnt = rd.getMgrTotalCnt();

			String pageNum    = request.getParameter("pageNum");
			String startDate  = request.getParameter("startDate");
			String endDate    = request.getParameter("endDate");			
					
			if(startDate == null  || startDate.length() < 4) {
				startDate = year +".01.01";
			} else {
				System.out.println("ManagerSalesFormAction NN startDate->"+startDate);
			}
			if(endDate == null   || endDate.length() < 4)  {
				endDate = year +".12.31";
			} else {
				System.out.println("ManagerSalesFormAction NN endDate->"+endDate);
				
			}
			System.out.println("ManagerSalesFormAction startDate->"+startDate);			
			System.out.println("ManagerSalesFormAction endDate->"+endDate);
			
			if(pageNum==null || pageNum.equals("")) { pageNum = "1"; }
			int currentPage = Integer.parseInt(pageNum);
			int pageSize = 10, blockSize = 10;
			int startRow = (currentPage -1) * pageSize +1;
			int endRow   = startRow + pageSize -1;
			int startNum = mgrTotCnt - startRow +1;
									
			List<Reservation> reserveList = rd.reserveList(startRow,endRow,startDate,endDate);    		 	
			System.out.println("ManagerSalesFormAction reserveList.size()->"+reserveList.size());
		
			int pageCnt = (int) Math.ceil((double)mgrTotCnt/pageSize);
			int startPage = (int)(currentPage -1)/blockSize*blockSize +1;
			int endPage = startPage + blockSize -1;
			if(endPage > pageCnt) endPage = pageCnt;
			
			request.setAttribute("reserveList", reserveList);
			request.setAttribute("mgrTotCnt", mgrTotCnt);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("startNum", startNum);
			request.setAttribute("blockSize", blockSize);
			request.setAttribute("pageCnt", pageCnt);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);

		} catch (Exception e) {
			System.out.println("ManagerSalesFormAction" + e.getMessage());
		}		
		return "/hyojung/managerSales.jsp";
	}

}
