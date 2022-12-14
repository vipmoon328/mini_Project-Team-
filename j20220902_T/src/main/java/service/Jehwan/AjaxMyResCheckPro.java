package service.Jehwan;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import dao.Reservation;
import dao.ReservationDao;
import service.CommandProcess;

public class AjaxMyResCheckPro implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, JSONException {
		// TODO Auto-generated method stub
		
				request.setCharacterEncoding("utf-8");
				response.setContentType("text/html;charset=utf-8");
				HttpSession session = request.getSession();
				
				System.out.println("ResMyCheck service start");
				JSONArray result = new JSONArray();
				try {
					String USERNUM = String.valueOf(session.getAttribute("usernum"));
					ReservationDao rd = ReservationDao.getInstance();
					System.out.println(USERNUM);
					int totCnt = rd.getTotalCnt(USERNUM);   // 37
					System.out.println(totCnt);
					String pageNum = request.getParameter("pageNum");
					if (pageNum==null || pageNum.equals("")) {	pageNum = "1";	}
					int currentPage = Integer.parseInt(pageNum);	//   1        
					int pageSize  = Integer.parseInt(request.getParameter("pageAmount"));
					int blockSize = 3;
					int startRow = (currentPage - 1) * pageSize + 1;  // 1     10   
					int endRow   = startRow + pageSize - 1;           // 11    20 
					
					List<Reservation> list = rd.myResInfo(USERNUM,startRow,endRow);
					
					int pageCnt = (int)Math.ceil((double)totCnt/pageSize);  // 4
					//                       1
					int startPage = (int)(currentPage-1)/blockSize*blockSize + 1;  // 1    
					int endPage = startPage + blockSize -1;	                       // 10   
					// 공갈 Page 방지   10  >  4
					if (endPage > pageCnt) endPage = pageCnt;	                   // 4
					String branch="";
					
					JSONObject pageInfo = new JSONObject();
					pageInfo.put("totCnt", totCnt);
					pageInfo.put("startPage", startPage);
					pageInfo.put("endPage", endPage);
					pageInfo.put("blockSize", blockSize);
					pageInfo.put("pageCnt", pageCnt);
					pageInfo.put("currentPage", currentPage);
					result.put(pageInfo);
					for(Reservation reservation : list) {
						JSONObject obj = new JSONObject();
						System.out.println(reservation.getRes_rid());
						obj.put("res_rid", reservation.getRes_rid());
						obj.put("res_date", reservation.getRes_date());
						if(reservation.getRes_brnNum() == 0) {
							branch = "이대점";
						}else if(reservation.getRes_brnNum() == 1) {
							branch = "강남점";
						}
						obj.put("brnNum", branch);
						obj.put("lane", reservation.getRes_lane());
						obj.put("start", reservation.getRes_startTime());
						obj.put("end", reservation.getRes_endTime());
						obj.put("customer", reservation.getRes_customer());
						obj.put("cost", reservation.getRes_sal());
						obj.put("cancel", reservation.getRes_cancel());
						obj.put("visit", reservation.getRes_come());
						result.put(obj);
					}
					
				} catch (Exception e) {
					// TODO: handle exception
				}
				return result.toString();
	}

}
