package service.Hyojung;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;

import dao.Reservation;
import dao.ReservationDao;
import service.CommandProcess;


public class ManagerSalesInfoFormAction implements CommandProcess {

   @Override
   public String requestPro(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException, JSONException {
      System.out.println("ManagerSalesInfoFormAction >> 나 탔어!");
      
      ReservationDao rd = ReservationDao.getInstance();
      
      try {
         int usertotCnt = rd.getUsertotCnt();
         int monSales = rd.getMonthSales();
         int monVisit = rd.getMonthVisit();
         int monAvgSales = rd.getMonAvgSales();
         int monAvgVisit = rd.getMonAvgVisit();
         int totSales = rd.getTotalSales();
         int totVisit = rd.getTotalVisit();
         System.out.println("ManagerSalesFormAction totCnt >>" + usertotCnt);
         System.out.println("ManagerSalesFormAction totSales >>" + monSales);
         System.out.println("ManagerSalesFormAction totVisit >>" + monVisit);
         System.out.println("ManagerSalesFormAction totSales >>" + totSales);
         System.out.println("ManagerSalesFormAction totVisit >>" + totVisit);
         
         String infopageNum = request.getParameter("infopageNum");
         if(infopageNum==null || infopageNum.equals("")) { infopageNum = "1"; }
         int currentPage = Integer.parseInt(infopageNum);
         int pageSize = 10, blockSize = 10;
         int startRow = (currentPage -1) * pageSize +1;
         int endRow   = startRow + pageSize -1;
         int startNum = usertotCnt - startRow +1;
         
         List<Reservation> reserveSalesList = rd.reserveSalesList(startRow,endRow);
         
         int pageCnt = (int) Math.ceil((double)usertotCnt/pageSize);
         int startPage = (int)(currentPage -1)/blockSize*blockSize +1;
         int endPage = startPage + blockSize -1;
         if(endPage > pageCnt) endPage = pageCnt;
         
         request.setAttribute("reserveSalesList", reserveSalesList);
         request.setAttribute("usertotCnt", usertotCnt);
         request.setAttribute("infopageNum", infopageNum);
         request.setAttribute("currentPage", currentPage);
         request.setAttribute("startNum", startNum);
         request.setAttribute("blockSize", blockSize);
         request.setAttribute("pageCnt", pageCnt);
         request.setAttribute("startPage", startPage);
         request.setAttribute("endPage", endPage);
         
         request.setAttribute("monSales", monSales);
         request.setAttribute("monVisit", monVisit);
         request.setAttribute("monAvgSales", monAvgSales);
         request.setAttribute("monAvgVisit", monAvgVisit);
         request.setAttribute("totSales", totSales);
         request.setAttribute("totVisit", totVisit);
      } catch (Exception e) {
         System.out.println("MgrDateSelectAction" + e.getMessage());
      }
      return "/hyojung/managerSalesInfo.jsp";
   }

}