package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.json.JSONArray;
import org.json.JSONObject;

public class ReservationDao {
	
	private static ReservationDao instance;
	
	private ReservationDao() {
		
	}
	
	public static ReservationDao getInstance() {
		if(instance == null) {
			instance = new ReservationDao();
		}
		return instance;
	}
	
	

	
	private Connection getConnection() {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)
				ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
			System.out.println("success");
		}catch(Exception e) { 
			System.out.println(e.getMessage());	
		}
		return conn;
	}
	
	public int getTotalCnt(String usrNum) throws SQLException {
		Connection conn = null;	
		PreparedStatement pstmt= null; 
		ResultSet rs = null;    
		int tot = 0;
		System.out.println(usrNum);
		String sql = "select count(*) from reserve where \"USERNUM\" = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, usrNum);
			rs = pstmt.executeQuery();
			if (rs.next()) tot = rs.getInt(1);
		} catch(Exception e) {	
			System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return tot;
	}
	
	public int getPossibleLane(int BRN_UID) throws SQLException {
		Connection conn = null;	
		PreparedStatement pstmt= null; 
		ResultSet rs = null;    
		int tot = 0;
		String sql = "select \"BRN_LANE\" from branch where \"BRN_UID\" = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, BRN_UID);
			rs = pstmt.executeQuery();
			if (rs.next()) tot = rs.getInt(1);
		} catch(Exception e) {	
			System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return tot;
	}
	
	public List<Reservation> resInfo(String branch, String res_date) throws SQLException {
		List<Reservation> list = new ArrayList<Reservation>();
		Connection conn = null;	
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		 String sql = "select * from reserve where \"RES_CANCEL\"=0 and  TO_DATE(?,'YY/MM/DD') = \"RES_DATE\" and \"RES_BRNNUM\" = ?";
		 System.out.println(sql);
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, res_date);
			pstmt.setString(2, branch);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Reservation reservation = new Reservation();
				reservation.setRes_startTime(rs.getInt(4));
				reservation.setRes_endTime(rs.getInt(5));
				reservation.setRes_lane(rs.getInt(3));
				list.add(reservation);
			}
		} catch(Exception e) {	
			System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		} 
		return list;
	}
	
	public int makeRes(String res_date, Reservation reservation) throws SQLException {
		Connection conn = null;	
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		int result = 0;
		String sql = "insert into reserve values (RES_SEQ.NEXTVAL,TO_DATE(?,'YY/MM/DD'),?,?,?,?,?,?,?,sysdate,?,?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, res_date);
			pstmt.setInt(2, reservation.getRes_lane());
			pstmt.setInt(3, reservation.getRes_startTime());
			pstmt.setInt(4, reservation.getRes_endTime());
			pstmt.setInt(5, reservation.getRes_customer());
			pstmt.setInt(6, reservation.getRes_sal());
			pstmt.setInt(7, 0);
			pstmt.setInt(8, reservation.getRes_userNum());
			pstmt.setInt(9, 0);
			pstmt.setInt(10, reservation.getRes_brnNum());
			result = pstmt.executeUpdate();
			if(result >0 ) {
				System.out.println("성공");
			}else {
				System.out.println("실패");
			}
		} catch(Exception e) {	
			System.out.println(e.getMessage()); 
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return result;
	}
	
	public List<Reservation> myResInfo(String userNum, int startRow, int endRow) throws SQLException {
		List<Reservation> list = new ArrayList<Reservation>();
		Connection conn = null;	
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		 String sql = "SELECT *  FROM (Select a.*, rownum rn   From (select * from reserve where \"USERNUM\"=? ORDER BY \"RES_DATE\" DESC) a ) WHERE rn BETWEEN ? AND ? ";
		 System.out.println(sql);
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userNum);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Reservation reservation = new Reservation();
				reservation.setRes_rid(rs.getInt(1));
				reservation.setRes_date(rs.getDate(2));
				reservation.setRes_lane(rs.getInt(3));
				reservation.setRes_startTime(rs.getInt(4));
				reservation.setRes_endTime(rs.getInt(5));
				reservation.setRes_customer(rs.getInt(6));
				reservation.setRes_sal(rs.getInt(7));
				reservation.setRes_come(rs.getInt(8));
				reservation.setRes_userNum(rs.getInt(9));
				reservation.setPay_date(rs.getDate(10));
				reservation.setRes_cancel(rs.getInt(11));
				reservation.setRes_brnNum(rs.getInt(12));
				list.add(reservation);
			}
		} catch(Exception e) {	
			System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		} 
		return list;
	}
	
	public int changeRes(String res_date, Reservation reservation) throws SQLException {
		Connection conn = null;	
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		int result = 0;
		String sql = "update reserve set \"RES_DATE\" =?, \"RES_LANE\"=?, \"RES_STARTTIME\"=?, \"RES_ENDTIME\"=?, \"RES_CUSTOMER\"=?, \"RES_SAL\"=?,\"PAY_DATE\"=sysdate,\"RES_BRNNUM\"=? where \"RES_RID\"= ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, res_date);
			pstmt.setInt(2, reservation.getRes_lane());
			pstmt.setInt(3, reservation.getRes_startTime());
			pstmt.setInt(4, reservation.getRes_endTime());
			pstmt.setInt(5, reservation.getRes_customer());
			pstmt.setInt(6, reservation.getRes_sal());
			pstmt.setInt(7, reservation.getRes_brnNum());
			pstmt.setInt(8, reservation.getRes_rid());
			result = pstmt.executeUpdate();
			if(result >0 ) {
				System.out.println("성공");
			}else {
				System.out.println("실패");
			}
		} catch(Exception e) {	
			System.out.println(e.getMessage()); 
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return result;
	}
	
	public int cancelRes(String[] cancel_rid) throws SQLException {
		Connection conn = null;	
		PreparedStatement pstmt= null;
		int result = 0;
		String sql = "update reserve set \"RES_CANCEL\"=1 where \"RES_RID\" IN (";
		for(int i = 0 ; i < cancel_rid.length-1 ; i++) {
			sql += "?,";
		}
		sql +="?)";
		System.out.println(sql);
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			for(int i = 0 ; i < cancel_rid.length ; i ++) {
				pstmt.setString(i+1, cancel_rid[i]);
			}
			result = pstmt.executeUpdate();
		} catch(Exception e) {	
			System.out.println(e.getMessage()); 
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return result;
	}
	
	/* 1.ManagerSalesFormAction.java - 모든 데이터 카운팅 [이효정] */
	public int getMgrTotalCnt() throws SQLException {
		Connection conn = null;
		Statement  stmt = null;
		ResultSet  rs   = null;
		int tot = 0;
		String sql = "Select count(*) From reserve";
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs   = stmt.executeQuery(sql);
			if(rs.next()) tot = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("getTotalCnt>>"+e.getMessage());
		} finally {
			if(rs   != null) rs.close();
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		}
		return tot;
	}
	
	/* 2.ManagerSalesFormAction.java - 예약되어 있는 모든 매출현황 출력 [이효정] */
	public List<Reservation> reserveList(int startRow, int endRow, String startDate, String endDate) throws SQLException{
		List<Reservation> reservelist = new ArrayList<Reservation>();
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "";
		
		String sql1 = "SELECT * "
				   + "FROM (SELECT rownum rn , a.* "
				   + "		FROM ( SELECT reserve.usernum , users.name , res_lane , res_customer , res_date ,  res_starttime , res_endtime , res_cancel , res_sal "
				   + "			   FROM users,reserve "
				   + "			   WHERE reserve.usernum = users.usernum "
				   + "			   ORDER BY res_date ) a ) "
				   + "WHERE rn BETWEEN ? AND ? ";
		
		
		String sql2 = "SELECT * "
				   + "FROM (Select rownum rn , a.* "
				   + "		FROM ( SELECT reserve.usernum , users.name , res_lane , res_customer , res_date ,  res_starttime , res_endtime , res_cancel , res_sal "
				   + "			   FROM users,reserve "
				   + "             WHERE reserve.usernum = users.usernum AND res_date BETWEEN ?  AND ? "
				   + "			   ORDER BY res_date ) a ) "
				   + "WHERE rn BETWEEN ? AND ? ";	
		
		if(startDate == null) {
			sql = sql1;
		} else {
			sql = sql2;
		};
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
			if(startDate == null) {
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);	
			} else {
				pstmt.setString(1, startDate);
				pstmt.setString(2, endDate);
				pstmt.setInt(3, startRow);
				pstmt.setInt(4, endRow);
			};
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Reservation reserve = new Reservation();
				System.out.println("ReserveDao userslist name->"+rs.getString("name"));
				reserve.setRes_userNum  (rs.getInt("res_userNum"));
				reserve.setName         (rs.getString("name"));
				reserve.setRes_lane     (rs.getInt("res_lane"));
				reserve.setRes_customer (rs.getInt("res_customer"));
				reserve.setRes_date     (rs.getDate("res_date"));
				reserve.setRes_startTime(rs.getInt("res_startTime"));
				reserve.setRes_endTime  (rs.getInt("res_endTime"));
				reserve.setRes_cancel   (rs.getInt("res_cancel"));
				reserve.setRes_sal      (rs.getInt("res_sal"));
				reservelist.add(reserve);
			}
		} catch (Exception e) {
			System.out.println("reserveList>>"+e.getMessage());
		} finally {
			if(rs    != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn  != null) conn.close();
		}
		return reservelist;
	}
	
	/* 3.ManagerSelectDateFormAction.java - 조회한 데이터 카운팅 [이효정] */
	public int getFromToTotalCnt(String startDate, String endDate ) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet  rs   = null;
		int fromToTotalCnt = 0;
		String sql = "SELECT   count(*) "
				   + "FROM     reserve "
				   + "WHERE    res_date BETWEEN ?  AND ? ";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, startDate);
			pstmt.setString(2, endDate);
			rs = pstmt.executeQuery();
			if(rs.next()) fromToTotalCnt = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("getTotalCnt>>"+e.getMessage());
		} finally {
			if(rs    != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn  != null) conn.close();
		}
		return fromToTotalCnt;
	}
	
	/* 4.ManagerSelectDateFormAction.java - 예약되어 있는 기간 매출현황 출력 [이효정] */
	public List<Reservation> reserveSelectList(int startRow, int endRow, String startDate, String endDate) throws SQLException {
		List<Reservation> reserveSelectList = new ArrayList<Reservation>();
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;	
		String sql = "SELECT * "
				   + "FROM (SELECT rownum rn , a.* "
				   + "      FROM ( SELECT reserve.usernum , users.name , res_lane , res_customer , res_date ,  res_starttime , res_endtime , res_cancel , res_sal "
				   + "             FROM users,reserve "
				   + "             WHERE reserve.usernum = users.usernum AND res_date BETWEEN ?  AND ? "
				   + "             ORDER BY res_date ) a ) "
				   + "WHERE rn BETWEEN ? AND ? ";		
		
		try {
			conn  = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, startDate);
			pstmt.setString(2, endDate);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);	
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Reservation reserve = new Reservation();
				reserve.setRes_userNum  (rs.getInt("res_userNum"));
				reserve.setName         (rs.getString("name"));				
				reserve.setRes_lane     (rs.getInt("res_lane"));
				reserve.setRes_customer (rs.getInt("res_customer"));
				reserve.setRes_date     (rs.getDate("res_date"));
				reserve.setRes_startTime(rs.getInt("res_startTime"));
				reserve.setRes_endTime  (rs.getInt("res_endTime"));
				reserve.setRes_cancel   (rs.getInt("res_cancel"));
				reserve.setRes_sal      (rs.getInt("res_sal"));
				reserveSelectList.add(reserve);
								
			}
		} catch (Exception e) {
			System.out.println("reserveSelectList Exception> " + e.getMessage());
		} finally {
			if(rs    != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn  != null) conn.close();
		}
		return reserveSelectList;
	}
	
	/* 5.ManagerSalesInfoFormAction.java - 예약되어 있는 회원들 카운팅 [이효정] */
	public int getUsertotCnt() throws SQLException {
		Connection conn = null;
		Statement  stmt = null;
		ResultSet  rs   = null;
		int usertotCnt  = 0;
		String sql = "SELECT count(DISTINCT usernum) "
				   + "FROM   reserve ";
		
		try {
			 conn = getConnection();
			 stmt = conn.createStatement();
			 rs   = stmt.executeQuery(sql);
			 if(rs.next()) {
				 usertotCnt = rs.getInt(1);
			 }
		} catch (Exception e) {
			System.out.println("getUsertotCnt >>" + e.getMessage());
		} finally {
			if(rs   != null) rs.close();
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		}
		return usertotCnt;
	}
	
	/* 6.ManagerSalesInfoFormAction.java - 예약되어 있는 회원들 금액합계 [이효정] */
	public List<Reservation> reserveSalesList(int startRow , int endRow) throws SQLException {
		List<Reservation> reserveSalesList = new ArrayList<Reservation>();
		Connection 		  conn  = null;
		PreparedStatement pstmt = null;
		ResultSet 		  rs    = null;
		String sql = "SELECT * "
				   + "FROM (SELECT rownum rn , a.* "
				   + "      FROM ( SELECT  reserve.usernum , users.name , sum(res_sal) "
				   + "             FROM    users, reserve "
				   + "             WHERE   reserve.usernum = users.usernum "
				   + "			   GROUP BY reserve.usernum , users.name "
				   + "             ORDER BY  sum(res_sal) DESC ) a ) "
				   + "WHERE rn BETWEEN     ?     AND    ?     ";
		System.out.println("reserveSalesList sql>" + sql);
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Reservation reserve = new Reservation();
				reserve.setRes_userNum(rs.getInt("res_userNum"));				
				reserve.setName       (rs.getString("name"));
				reserve.setSum_sal    (rs.getInt("sum(res_sal)"));
				reserveSalesList.add(reserve);
				
			}
		} catch (Exception e) {
			System.out.println("reserveSalesList >>"+e.getMessage());
		} finally {
			if(rs    != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn  != null) conn.close();
		}
		return reserveSalesList;
	}
	
	/* 7.ManagerSalesInfoFormAction.java - 누적 매출 [이효정] */
	public int getTotalSales() throws SQLException {
		Connection conn = null;
		Statement  stmt = null;
		ResultSet  rs   = null;
		int totalSales = 0;
		String sql = "SELECT sum(res_sal) "
				   + "FROM   reserve "
				   + "WHERE  res_cancel = '0' AND res_come = '0' ";
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs   = stmt.executeQuery(sql);
			if(rs.next()) {
				totalSales = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("getTotalSales >>" + e.getMessage());
		} finally {
			if(rs   != null) rs.close();
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		}
		return totalSales;
	}
	
	/* 8.ManagerSalesInfoFormAction.java - 누적 방문인원 [이효정] */
	public int getTotalVisit() throws SQLException {
		Connection conn = null;
		Statement  stmt = null;
		ResultSet  rs   = null;
		int totalVisit = 0;
		String sql = "SELECT sum(res_customer) "
				   + "FROM   reserve "
				   + "WHERE  res_cancel = '0' AND res_come = '0' ";
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs   = stmt.executeQuery(sql);
			if(rs.next()) {
				totalVisit = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("getTotalVisit >>" + e.getMessage());
		} finally {
			if(rs   != null) rs.close();
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		}
		return totalVisit;
	}
	
	/* 9.ManagerSalesInfoFormAction.java - 월 총금액 [이효정] */
	public int getMonthSales() throws SQLException {
		Connection conn = null;
		Statement  stmt = null;
		ResultSet  rs   = null;
		int monthSales = 0;
		String sql = "SELECT  sum(res_sal) "
				   + "FROM    reserve "
				   + "WHERE   res_cancel  =  '0'   AND   res_come = '0' "
				   + "AND     RES_DATE  BETWEEN   TRUNC(sysdate , 'MM') AND  LAST_DAY(sysdate) "
				   + "GROUP BY TRUNC(sysdate , 'MM') ,  LAST_DAY(sysdate) ";
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs   = stmt.executeQuery(sql);
			if(rs.next()) {
				monthSales = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("getMonthSales >>" + e.getMessage());
		} finally {
			if(rs   != null) rs.close();
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		}
		return monthSales;
	}
	
	/* 10.ManagerSalesInfoFormAction.java - 월 총 방문인원수 [이효정] */
	public int getMonthVisit() throws SQLException {
		Connection conn = null;
		Statement  stmt = null;
		ResultSet  rs   = null;
		int monthVisit = 0;
		String sql = "SELECT   sum(res_customer) "
				   + "FROM     reserve "
				   + "WHERE    res_cancel  =  '0'   AND   res_come = '0' "
				   + "AND      RES_DATE  BETWEEN   TRUNC(sysdate , 'MM') AND  LAST_DAY(sysdate) "
				   + "GROUP BY TRUNC(sysdate , 'MM') ,  LAST_DAY(sysdate) ";
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs   = stmt.executeQuery(sql);
			if(rs.next()) {
				monthVisit = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("getMonthVisit >>" + e.getMessage());
		} finally {
			if(rs   != null) rs.close();
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		}
		return monthVisit;
	}
	
	/* 11.ManagerSalesInfoFormAction.java - 월 평균 금액 [이효정] */
	public int getMonAvgSales() throws SQLException {
		Connection conn = null;
		Statement  stmt = null;
		ResultSet  rs   = null;
		int monAvgSales = 0;
		String sql = "SELECT    ROUND(AVG(res_sal)) "
				   + "FROM      reserve "
				   + "WHERE     res_cancel  =  '0'   AND   res_come = '0' "
				   + "AND       RES_DATE  BETWEEN   TRUNC(sysdate , 'MM') AND  LAST_DAY(sysdate) "
				   + "GROUP BY TRUNC(sysdate , 'MM') ,  LAST_DAY(sysdate) ";
		
		try {
			 conn = getConnection();
			 stmt = conn.createStatement();
			 rs   = stmt.executeQuery(sql);
			 if(rs.next()) {
				 monAvgSales = rs.getInt(1);
			 }
		} catch (Exception e) {
			System.out.println("getMonAvgSales >>" + e.getMessage());
		} finally {
			if(rs   != null) rs.close();
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		}
		return monAvgSales;
	}
	
	/* 12.ManagerSalesInfoFormAction.java - 월 평균 방문인원수 [이효정] */
	public int getMonAvgVisit() throws SQLException {
		Connection conn = null;
		Statement  stmt = null;
		ResultSet  rs   = null;
		int monAvgVisit = 0;
		String sql = "SELECT    ROUND(AVG(res_customer)) "
				   + "FROM      reserve "
				   + "WHERE     res_cancel  =  '0'   AND   res_come = '0' "
				   + "AND       RES_DATE  BETWEEN   TRUNC(sysdate , 'MM') AND  LAST_DAY(sysdate) "
				   + "GROUP BY TRUNC(sysdate , 'MM') ,  LAST_DAY(sysdate) ";
		
		try {
			 conn = getConnection();
			 stmt = conn.createStatement();
			 rs   = stmt.executeQuery(sql);
			 if(rs.next()) {
				 monAvgVisit = rs.getInt(1);
			 }
		} catch (Exception e) {
			System.out.println("getMonAvgVisit >>" + e.getMessage());
		} finally {
			if(rs   != null) rs.close();
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		}
		return monAvgVisit;
	}
	
}
