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
		//sql문을 통해 보드에 지워진글 값이 0 만 전부 카운트
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next())
			{
				tot = rs.getInt(1); //sql문 전체 값을 tot에 삽입
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
		List<Board> list = new ArrayList<Board>(); //리스트 생성
		Connection conn = null;	
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		// 삭제 값이 0이며, 공지 사항 상단 sql문
		 String sql =    "SELECT *  "
		 	    	+ "FROM (Select rownum rn ,a.*  "
		 		    + "From (select * from board where brd_deleted = 0 order by brd_name desc, brd_ref desc ) a )  "
		 		    + "WHERE rn BETWEEN ? AND ?";
			/* + "order by (case when brd_name = '공지사항' then 1  end ),brd_ref"; */
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow); // 게시판 리스트를 생성 시키기 위한 시작점
			pstmt.setInt(2, endRow); // 게시판 리스트를 생성 시키기 위한 종점
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Board board = new Board();//db 값들 전부 불러 와서 리스트에 지정
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
	
	public List<Board> boardListSearch(int startRow, int endRow,String srh_select, String srh_input) throws SQLException {
		List<Board> list = new ArrayList<Board>(); //리스트 생성
		Connection conn = null;	
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		// 삭제 값이 0이며, 공지 사항 상단 sql문
		 String sql =    " SELECT *  "
		 	    	+ " FROM (Select rownum rn ,a.*  "
		 		    + "       From ( select * from board   "
		 		    + "              where brd_deleted = 0 "
		 		    + "              and "   + srh_select +  " Like ?   " 
		 		    + "              order by brd_name desc, brd_ref desc "
		 		    + "             ) "
		 		    + "       a )  "
		 		    + " WHERE rn BETWEEN ? AND ?";
			/* + "order by (case when brd_name = '공지사항' then 1  end ),brd_ref"; */
		 System.out.println("DAO boardListSearch sql->"+sql);
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
		//	pstmt.setString(1, srh_select); // 게시판 리스트를 생성 시키기 위한 시작점
			pstmt.setString(1, srh_input); // 게시판 리스트를 생성 시키기 위한 종점
			System.out.println("DAO boardListSearch srh_select->"+srh_select);
			pstmt.setInt(2, startRow); // 게시판 리스트를 생성 시키기 위한 시작점
			System.out.println("DAO boardListSearch srh_input->"+srh_input);
			pstmt.setInt(3, endRow); // 게시판 리스트를 생성 시키기 위한 종점
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Board board = new Board();//db 값들 전부 불러 와서 리스트에 지정
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
			System.out.println("dao boardListSearch e.getMessage->"+e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		} 
		return list;
	}
	
	
	
	public void readCount(int num) throws SQLException {
		Connection conn = null;	
		PreparedStatement pstmt= null;  // 조회수 지정, 게시글 볼떄 마다 조회수가 올라간다.
		String sql="update board set brd_view=brd_view+1 where brd_bid=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num); // 게시글 고유 번호
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
								// 지정한 게시글 고유 번호 불러 오기
		String sql = "select * from board where brd_bid="+num;
		Board board = new Board();
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {				
				//db 값을 전부 불러온다
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
		int num = board.getBrd_bid(); //게시글 고유 번호 지정
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//게시글의 가장 마지막 고유 번호를 찾는다
		String sql1 = "select nvl(max(brd_bid),0) from board";
		//게시글 값 insert
		String sql2 =  "insert into board(BRD_BID, BRD_NAME,BRD_TITLE ,BRD_WRITER ,BRD_DATE ,BRD_VIEW ,BRD_CONTENT ,BRD_SECRET ,BRD_DELETED ,USERNUM ,BRD_REF ,BRD_RE_STEP ,BRD_RE_LEVEL)VALUES(?, '게시글', ?, ?, TO_DATE(sysdate), ?, ?, ?, 0, 1, ?, ?, ?)";
		System.out.println("BoardDao insert start...");
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			rs.next();
			// 가장 마지막 게시글 고유 번호에 +1 을 하여 새로 만들 게시글의 새 고유번호 지정
			int number = rs.getInt(1)+1;
			System.out.println("dao insert number"+number);
			System.out.println("dao insert num"+num);
			rs.close();
			pstmt.close();
			if (num==0) {
				//num==0 첫 게시글 일때 조건
				board.setBrd_ref(number);
			}
				pstmt = conn.prepareStatement(sql2);
				//sql2 에 들어갈 값을 지정
				
				pstmt.setInt(1, number);
				pstmt.setString(2, board.getBrd_title());
				pstmt.setString(3, board.getBrd_writer());
				pstmt.setInt(4, board.getBrd_view());
				pstmt.setString(5, board.getBrd_content());
				pstmt.setInt(6, board.getBrd_secret());
				pstmt.setInt(7, board.getBrd_ref());
				pstmt.setInt(8, board.getBrd_re_step()); 
				pstmt.setInt(9,board.getBrd_re_level());
				result = pstmt.executeUpdate();
				
				System.out.println("dao insert number->"+ number);
				System.out.println("dao insert board.getBrd_title->"+ board.getBrd_title());
				System.out.println("dao insert board.getBrd_view->"+ board.getBrd_view());
				System.out.println("dao insert board.getBrd_content->"+ board.getBrd_content());
				System.out.println("dao insert board.getBrd_secret->"+ board.getBrd_secret());
				System.out.println("dao insert board.getBrd_ref->"+ board.getBrd_ref());
				System.out.println("dao insert board.getBrd_re_step->"+ board.getBrd_re_step());
				System.out.println("dao insert board.getBrd_re_level->"+ board.getBrd_re_level());
			
	
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
		// update할 값들 넣는다.
		String sql="update board set brd_title = ?, brd_content = ?, brd_secret=? where brd_bid =?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
			 pstmt.setString(1,board.getBrd_title()); 
			 pstmt.setString(2,board.getBrd_content()); 
			 pstmt.setInt(3, board.getBrd_secret());
			 pstmt.setInt(4, board.getBrd_bid());
			 
			 
			result = pstmt.executeUpdate();
		} catch(Exception e) {	
			System.out.println("dao update"+e.getMessage()); 
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn !=null)   conn.close();
		}
		return result;
	}
	
	public int delete(int num) throws SQLException {
		Connection conn = null;	
		PreparedStatement pstmt= null; 
		int result = 0;		    
		//게시글을 삭제 하는것이 아닌 삭제여부 값을 1넣는 것으로 게시글 리스트에서 보이지 않게 하고 db에는 값을 남긴다.
		String sql="update board set brd_deleted = '1' where brd_bid = ? ";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();
		} catch(Exception e) {	
			System.out.println(e.getMessage()); 
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return result;
	}
	
	
	//검색기능 건드리지 마시오
	public int getSearchCnt(String srh_select, String srh_input) throws SQLException
	{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		int tot = 0;
		System.out.println("srh_select dao->"+srh_select);
		System.out.println("srh_input dao->"+srh_input);
		String sql = "select count(*) from board where brd_deleted = 0 and " + srh_select + " like '%" + srh_input + "%'";			
		try {
			
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			System.out.println("sql dao->>>"+sql);
			if(rs.next())
			{
				tot = rs.getInt(1);
			}
			System.out.println("rsnext dao->"+ rs.getInt(1));
		} catch (Exception e) {
			System.out.println("dao searchcnt error ->"+e.getMessage());
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
	
	public int check(String user_id, String passwd) throws SQLException {
		Connection conn = null;	
		PreparedStatement pstmt= null; 
		int result = 0;		    
		ResultSet rs = null;
		String sql = "select PW from USERS where ID=?";

		try {
			String dbPasswd = "";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dbPasswd = rs.getString(1); 
				if (dbPasswd.equals(passwd)) {
					result = 1;
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
	

}