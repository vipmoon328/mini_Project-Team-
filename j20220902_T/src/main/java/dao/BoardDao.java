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

public class BoardDao {
	private static BoardDao instance;
	private BoardDao() {} //싱글톤
	public static BoardDao getInstance() {
		if(instance == null) {
			instance = new BoardDao();
		}// 세션에 대한 메모리 최적화
		return instance;
	}
	private Connection getConnection() {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}
	
	public int getTotalCnt() throws SQLException
	{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		int tot = 0;
		String sql = "select count(*) from board where brd_deleted = 0";
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next())
			{
				tot = rs.getInt(1);
			}
			System.out.println("rsnext->"+ rs.getInt(1));
		} catch (Exception e) {
			System.out.println("dao totcnt error ->"+e.getMessage());
		}
		finally {
			if(rs != null) {
				rs.close();
			}
			if(stmt != null) {
				stmt.close();
			}
			if(conn != null) {
				conn.close();
			}
		}
		return tot;
		
	}
	
	public List<Board> boardList(int startRow, int endRow) throws SQLException {
		List<Board> list = new ArrayList<Board>();
		Connection conn = null;	
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		// String sql = "select * from board order by num desc";
		// mysql select * from board order by num desc limit startPage-1,10;
		 String sql =    "SELECT *  "
		 	    	+ "FROM (Select rownum rn ,a.*  "
		 		    + "From (select * from board where brd_deleted = 0 order by brd_name desc, brd_ref desc ) a )  "
		 		    + "WHERE rn BETWEEN ? AND ?";
			/* + "order by (case when brd_name = '공지사항' then 1  end ),brd_ref"; */
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Board board = new Board();
				board.setBrd_bid(rs.getInt("brd_bid"));
				board.setBrd_name(rs.getString("brd_name"));
				board.setBrd_title(rs.getString("brd_title"));
				board.setBrd_writer(rs.getString("brd_writer"));
				board.setBrd_date(rs.getDate("brd_date"));
				board.setBrd_view(rs.getInt("brd_view"));
				board.setBrd_content(rs.getString("brd_content"));
				board.setBrd_secret(rs.getInt("brd_secret"));
				board.setBrd_deleted(rs.getInt("brd_deleted"));
				board.setBrd_ref(rs.getInt("brd_ref"));
				board.setBrd_re_step(rs.getInt("brd_re_step"));
				board.setBrd_re_level(rs.getInt("brd_re_level"));
				list.add(board);
			}
		} catch(Exception e) {	
			System.out.println("dao list error ->"+e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		} 
		return list;
	}
	public void readCount(int num) throws SQLException {
		Connection conn = null;	
		PreparedStatement pstmt= null; 
		String sql="update board set brd_view=brd_view+1 where brd_bid=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} 
		catch (Exception e) 
		{
			System.out.println("dao readCount error ->"+e.getMessage());
		}
		finally {
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
	}
	public Board select(int num) throws SQLException {
		Connection conn = null;	
		Statement stmt= null; 
		ResultSet rs = null;
		
		String sql = "select * from board where brd_bid="+num;
		Board board = new Board();
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {				
				board.setBrd_bid(rs.getInt("brd_bid"));
				board.setBrd_name(rs.getString("brd_name"));
				board.setBrd_title(rs.getString("brd_title"));
				board.setBrd_writer(rs.getString("brd_writer"));
				board.setBrd_date(rs.getDate("brd_date"));
				board.setBrd_view(rs.getInt("brd_view"));
				board.setBrd_content(rs.getString("brd_content"));
				board.setBrd_secret(rs.getInt("brd_secret"));
				board.setBrd_deleted(rs.getInt("brd_deleted"));
				board.setUsernum(rs.getInt("usernum"));
				board.setBrd_ref(rs.getInt("brd_ref"));
				board.setBrd_re_step(rs.getInt("brd_re_step"));
				board.setBrd_re_level(rs.getInt("brd_re_level"));
			}

		} catch(Exception e) {	
			System.out.println("dao select error ->"+e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (stmt != null) stmt.close();
			if (conn !=null) conn.close();
		}
		return board;
	}
	public int insert(Board board) throws SQLException {
		int result =0;
		System.out.println("dao insert start...");
		System.out.println("dao board.getBrd_bid ->"+board.getBrd_bid());
		int num = board.getBrd_bid();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql1 = "select nvl(max(brd_bid),0) from board";
		String sql2 =  "insert into board(BRD_BID, BRD_NAME,BRD_TITLE ,BRD_WRITER ,BRD_DATE ,BRD_VIEW ,BRD_CONTENT ,BRD_SECRET ,BRD_DELETED ,USERNUM ,BRD_REF ,BRD_RE_STEP ,BRD_RE_LEVEL)VALUES(?, '게시글', ?, '회원', TO_DATE(sysdate), ?, ?, ?, 0, 1, ?, ?, ?)";
		System.out.println("BoardDao insert start...");
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			rs.next();
			int number = rs.getInt(1)+1;
			/* System.out.println("dao insert pstmt"+pstmt); */
			System.out.println("dao insert number"+number);
			System.out.println("dao insert num"+num);
			rs.close();
			pstmt.close();
			if (num==0) {
				board.setBrd_ref(number);
				pstmt = conn.prepareStatement(sql2);
				
				pstmt.setInt(1, number);
				pstmt.setString(2, board.getBrd_title());
				pstmt.setInt(3, board.getBrd_view());
				pstmt.setString(4, board.getBrd_content());
				pstmt.setInt(5, board.getBrd_secret());
				pstmt.setInt(6, board.getBrd_ref());
				pstmt.setInt(7, board.getBrd_re_step()); 
				pstmt.setInt(8,board.getBrd_re_level());
				result = pstmt.executeUpdate();
				
				System.out.println("dao insert number->"+ number);
				System.out.println("dao insert board.getBrd_title->"+ board.getBrd_title());
				System.out.println("dao insert board.getBrd_view->"+ board.getBrd_view());
				System.out.println("dao insert board.getBrd_content->"+ board.getBrd_content());
				System.out.println("dao insert board.getBrd_secret->"+ board.getBrd_secret());
				System.out.println("dao insert board.getBrd_ref->"+ board.getBrd_ref());
				System.out.println("dao insert board.getBrd_re_step->"+ board.getBrd_re_step());
				System.out.println("dao insert board.getBrd_re_level->"+ board.getBrd_re_level());
			}
	
		} catch (Exception e) {
			System.out.println("dao insert error ->"+e.getMessage());
		}
		finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		
		return result;
	}
	
	public int update(Board board) throws SQLException {
		Connection conn = null;	
		PreparedStatement pstmt= null; 
		int result = 0;			
		String sql="update board set brd_title = ?, brd_content = ? where brd_bid =?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getBrd_title());
			pstmt.setString(2, board.getBrd_content());
			pstmt.setInt(3, board.getBrd_bid());
			
			result = pstmt.executeUpdate();
		} catch(Exception e) {	
			System.out.println(e.getMessage()); 
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn !=null)   conn.close();
		}
		return result;
	}
	
	public int delete(int num, String passwd) throws SQLException {
		Connection conn = null;	
		PreparedStatement pstmt= null; 
		int result = 0;		    
		ResultSet rs = null;
		String sql1 = "select passwd from board where brd_bid=?";
		String sql="update board set brd_deleted = '1' where brd_bid = ? ";
		try {
			String dbPasswd = "";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dbPasswd = rs.getString(1); 
				if (dbPasswd.equals(passwd)) {
					rs.close();  
					pstmt.close();
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, num);
					result = pstmt.executeUpdate();
				} else result = 0;
			} else result = -1;
		} catch(Exception e) {	
			System.out.println(e.getMessage()); 
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return result;
	}
	
	public int getSearchCnt() throws SQLException
	{
		Connection conn = null;
		Statement stmt = null;
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		int tot = 0;
		Board board = new Board();
		String sql = "select count(*) from board where brd_deleted = 0 and where brd_title = '%?%'";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			pstmt.setString(1, board.getBrd_title());
			if(rs.next())
			{
				tot = rs.getInt(1);
			}
			System.out.println("rsnext->"+ rs.getInt(1));
		} catch (Exception e) {
			System.out.println("dao totcnt error ->"+e.getMessage());
		}
		finally {
			if(rs != null) {
				rs.close();
			}
			if(pstmt != null) {
				pstmt.close();
			}
			if(conn != null) {
				conn.close();
			}
		}
		return tot;
		
	}
	
	
	
	public List<Board> boardSearchList(int startRow, int endRow) throws SQLException {
		List<Board> list = new ArrayList<Board>();
		Connection conn = null;	
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		Board board = new Board();
		// String sql = "select * from board order by num desc";
		// mysql select * from board order by num desc limit startPage-1,10;
		 String sql =    "SELECT *  "
		 	    	+ "FROM (Select rownum rn ,a.*  "
		 		    + "From (select * from board where brd_deleted = 0 order by brd_name desc, brd_ref desc ) a )  "
		 		    + "WHERE rn BETWEEN ? AND ? and brd_title = '%?%'";
			/* + "order by (case when brd_name = '공지사항' then 1  end ),brd_ref"; */
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setString(3, board.getBrd_title());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				
				board.setBrd_bid(rs.getInt("brd_bid"));
				board.setBrd_name(rs.getString("brd_name"));
				board.setBrd_title(rs.getString("brd_title"));
				board.setBrd_writer(rs.getString("brd_writer"));
				board.setBrd_date(rs.getDate("brd_date"));
				board.setBrd_view(rs.getInt("brd_view"));
				board.setBrd_content(rs.getString("brd_content"));
				board.setBrd_secret(rs.getInt("brd_secret"));
				board.setBrd_deleted(rs.getInt("brd_deleted"));
				board.setBrd_ref(rs.getInt("brd_ref"));
				board.setBrd_re_step(rs.getInt("brd_re_step"));
				board.setBrd_re_level(rs.getInt("brd_re_level"));
				list.add(board);
			}
		} catch(Exception e) {	
			System.out.println("dao list error ->"+e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		} 
		return list;
	}
}
