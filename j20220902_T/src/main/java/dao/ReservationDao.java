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
			System.out.println("sucess");
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
		String sql = "select count(*) from reserve where \"userNum\" = ?";
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
	
	public List<Reservation> resInfo(String branch, String res_date) throws SQLException {
		List<Reservation> list = new ArrayList<Reservation>();
		Connection conn = null;	
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		 String sql = "select * from reserve where TO_DATE(?,'YY/MM/DD') = \"res_date\" and \"res_brnNum\" = " + branch;
		 System.out.println(sql);
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, res_date);
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
		String sql1="select nvl(max(\"res_rid\"),0) from reserve";
		String sql = "insert into reserve values (?,TO_DATE(?,'YY/MM/DD'),?,?,?,?,?,?,?,sysdate,?,?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			rs.next();
			int number = rs.getInt(1) + 1;
			rs.close();
			pstmt.close();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.setString(2, res_date);
			pstmt.setInt(3, reservation.getRes_lane());
			pstmt.setInt(4, reservation.getRes_startTime());
			pstmt.setInt(5, reservation.getRes_endTime());
			pstmt.setInt(6, reservation.getRes_customer());
			pstmt.setInt(7, reservation.getRes_sal());
			pstmt.setInt(8, 0);
			pstmt.setInt(9, reservation.getRes_userNum());
			pstmt.setInt(10, 0);
			pstmt.setInt(11, reservation.getRes_brnNum());
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
		 String sql = "SELECT *  FROM (Select a.*, rownum rn   From (select * from reserve where \"userNum\"=? ORDER BY \"res_date\" DESC) a ) WHERE rn BETWEEN ? AND ? ";
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
		String sql = "update reserve set values (?,TO_DATE(?,'YY/MM/DD'),?,?,?,?,?,?,?,sysdate,?,?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reservation.getRes_rid());
			pstmt.setString(2, res_date);
			pstmt.setInt(3, reservation.getRes_lane());
			pstmt.setInt(4, reservation.getRes_startTime());
			pstmt.setInt(5, reservation.getRes_endTime());
			pstmt.setInt(6, reservation.getRes_customer());
			pstmt.setInt(7, reservation.getRes_sal());
			pstmt.setInt(8, 0);
			pstmt.setInt(9, reservation.getRes_userNum());
			pstmt.setInt(10, 0);
			pstmt.setInt(11, reservation.getRes_brnNum());
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
}
