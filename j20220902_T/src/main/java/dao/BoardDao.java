package dao;

import java.sql.CallableStatement;
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
	
	public int refTotalCnt(int num) throws SQLException
	{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		int tot = 0;
		String sql = "select count(*) from board where brd_deleted = 0 and brd_re_step >0 and brd_ref ="+ num;
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
		 String sql = "SELECT *  "
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
		 		    + "              where brd_name !='댓글' and brd_deleted = 0 "
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
		PreparedStatement pstmt= null; 
		ResultSet rs = null;
		List<String> brd_img_src = new ArrayList<String>();
								// 지정한 게시글 고유 번호 불러 오기
		String sql = "select * from board b, files f where b.brd_bid=? and b.brd_bid = f.brd_bid (+)";
		Board board = new Board();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
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
				if(rs.getString("file_name")!=null) {
					brd_img_src.add(rs.getString("file_name"));
					while(rs.next()) {
						brd_img_src.add(rs.getString("file_name"));
					}
					board.setBrd_img_src(brd_img_src);
				}
				System.out.println("select_usernum->"+board.getUsernum());
			}
				
		} catch(Exception e) {	
			System.out.println("dao select error ->"+e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return board;
	}
	
	
	public int insert(Board board) throws SQLException {
		int result =0;
		System.out.println("dao insert start...");
		System.out.println("dao board.getBrd_bid ->"+board.getBrd_bid());
		System.out.println("여기까지는 왔냐?1");
		int num = board.getBrd_bid(); //게시글 고유 번호 지정
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		System.out.println("여기까지는 왔냐?2");
		//게시글의 가장 마지막 고유 번호를 찾는다
		String sql1 = "select nvl(max(brd_bid),0) from board";
		//게시글 값 insert
		String sql2 =  "insert all into board values(?, '게시글', ?, ?, TO_DATE(sysdate), ?, ?, ?, 0, ?, ?, ?, ?)";
		String sql2_1 =  "insert into board values(?, '댓글', ?, ?, TO_DATE(sysdate), ?, ?, ?, 0, ?, ?, ?, ?)";
		System.out.println("여기까지는 왔냐?3");
		System.out.println("sql2->" + sql2);
		System.out.println("sql2_1->" + sql2_1);
		for(int i = 0 ; i < board.getBrd_img_src().size() ; i ++) {
			sql2 += "into FILES VALUES(?, ?, ?) ";
		}
		System.out.println("이후sql2->" + sql2);
		System.out.println("이후sql2_1->" + sql2_1);
		
		System.out.println("여기까지는 왔냐?4");
		sql2 += "SELECT * FROM dual";
		String sql3 ="update board set brd_re_step = brd_re_step+1 where  brd_ref=? and brd_re_step > ?";
		System.out.println("sql2->" + sql2);
		System.out.println("dbSavePath->" + board.getBrd_img_src());
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
			
			//댓글기능 2022.10.09
			if(num != 0)
			{
				System.out.println("BoardDAO insert 댓글 sql3->"+sql3);
				
				pstmt = conn.prepareStatement(sql3);
				pstmt.setInt(1, board.getBrd_ref());
				pstmt.setInt(2, board.getBrd_re_step());
				pstmt.executeUpdate();
				pstmt.close();
				
				//댓글 관련 정보
				board.setBrd_ref(num);//
				board.setBrd_re_step((board.getBrd_re_step()+1));
				board.setBrd_re_level((board.getBrd_re_level()+1));
				System.out.println("BoardDAO insert 댓글 num->"+num);
				System.out.println("BoardDAO insert 댓글 board.getRef()->"+board.getBrd_ref());
				System.out.println("BoardDAO insert 댓글 board.getRe_step()->"+board.getBrd_re_step());
				System.out.println("BoardDAO insert 댓글 board.getBrd_re_level()->"+board.getBrd_re_level());
				
				
			}
			if (num==0) {
				//num==0 첫 게시글 일때 조건
				board.setBrd_ref(number);
			}
			
			//null 일때 댓글 아닐때 게시글2022.10.09
			if (board.getBrd_title() != null) {
				pstmt = conn.prepareStatement(sql2);
			}
			else if (board.getBrd_title() == null) {
				pstmt = conn.prepareStatement(sql2_1);
			}
				//sql2 에 들어갈 값을 지정
				
				pstmt.setInt(1, number); //글 고유 번호 
				pstmt.setString(2, board.getBrd_title());  //글 제목
				pstmt.setString(3, board.getBrd_writer()); //글 작성자
				pstmt.setInt(4, board.getBrd_view()); //조회수 
				pstmt.setString(5, board.getBrd_content()); //글 내용
				pstmt.setInt(6, board.getBrd_secret()); //비밀 글 여부
				pstmt.setInt(7, board.getUsernum()); //글 쓴 유저 번호
				pstmt.setInt(8, board.getBrd_ref()); 
				pstmt.setInt(9, board.getBrd_re_step()); 
				pstmt.setInt(10,board.getBrd_re_level());
				
				for(int i = 0 ; i < 3*board.getBrd_img_src().size() ; i = i+3) {
		               pstmt.setInt(i + 11, number);
		               pstmt.setInt(i + 12, (i+3)/3);
		               pstmt.setString(i + 13, board.getBrd_img_src().get(i/3));
		            }
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
	
	//22.10.06 [김건희] 코드 수정 매개변수를 usernum 추가하여 사용자의 usernum과 게시글의 usernum이 일치할 경우에만 수정할 수 있도록 구현
	public int update(List<String>dbDeletePath, Board board, int usernum) throws SQLException {
	      Connection conn = null;   
	      PreparedStatement pstmt= null; 
	      CallableStatement cstmt = null;
	      int result = 0;         
	      ResultSet rs = null;
	      // update할 값들 넣는다.
	      //22.10.06 [김건희] sql 수정
	      String delete_img = null;
	      String insert_img = null;
	      String sql="update board set brd_title = ?, brd_content = ?, brd_secret=? where brd_bid =? AND usernum = ?";
	      String sql2 = "{ call img_src_update(?, ?, ?) }";
	      if(dbDeletePath.size()!=0) {
	    	  delete_img ="";
	    	  for(int i = 0 ; i < dbDeletePath.size() ; i ++) {
		    	  delete_img += dbDeletePath.get(i) + ",";
		      }
	    	  delete_img = delete_img.substring(0, delete_img.length()-1);
	      }
	      if(board.getBrd_img_src().size()!=0) {
	    	  insert_img = "";
	    	  for(int i = 0 ; i < board.getBrd_img_src().size() ; i ++) {
		    	  insert_img += board.getBrd_img_src().get(i)  + ",";
		      }
	    	  insert_img = insert_img.substring(0, insert_img.length()-1);
	      }
	      try {
	         conn = getConnection();
	         pstmt = conn.prepareStatement(sql);
	         
	         //22.10.06 [김건희] 게시글과 사용자의 usernum 일치 여부 확인 조건문
	         if(board.getUsernum() == usernum)
	         {
	            pstmt.setString(1,board.getBrd_title()); 
	            pstmt.setString(2,board.getBrd_content()); 
	            pstmt.setInt(3, board.getBrd_secret());
	            pstmt.setInt(4, board.getBrd_bid());
	            pstmt.setInt(5, usernum);
	            result = pstmt.executeUpdate();
	         } else {
	            result--;
	         }
	         pstmt.close();
	         cstmt = conn.prepareCall(sql2);
	         cstmt.setInt(1, board.getBrd_bid());
	         cstmt.setString(2, delete_img);
	         cstmt.setString(3, insert_img);
	         result = cstmt.executeUpdate();
	      } catch(Exception e) {   
	         System.out.println("dao update"+e.getMessage()); 
	      } finally {
	         if (pstmt != null) pstmt.close();
	         if (conn !=null) conn.close();
	      }
	      return result;
	   }
	
	//22.10.06 [김건희] 코드 수정 매개변수를 usernum 추가하여 사용자의 usernum과 게시글의 usernum이 일치할 경우에만 삭제할 수 있도록 구현
	public int delete(int num, int usernum) throws SQLException {
		Connection conn = null;	
		PreparedStatement pstmt= null; 
		ResultSet rs = null;
		int result = 0;		    
		//게시글을 삭제 하는것이 아닌 삭제여부 값을 1넣는 것으로 게시글 리스트에서 보이지 않게 하고 db에는 값을 남긴다.
		//22.10.06 [김건희] sql 수정
		String sql2 = "select usernum from board where brd_bid = ? AND brd_deleted = 0 ";
		String sql="update board set brd_deleted = '1' where brd_bid = ? AND usernum = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next())
			{
				int result_usernum = rs.getInt(1); //해당 글 작성자의 유저번호 받아오는 쿼리문 실행
				pstmt.close();
				if( result_usernum == usernum) //글쓴이와 글삭제하는 이가 같을때
				{
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, num);
					pstmt.setInt(2, usernum);
					result = pstmt.executeUpdate(); //삭제 성공시 1, 삭제 오류시 0
				}
				else {
					result--;
				}
			}
		} catch(Exception e) {	
			System.out.println(e.getMessage()); 
		} finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return result;
	}
	
	//22.10.10 [김우석] 댓글 삭제
		public int deleteComment(int num, int usernum) throws SQLException {
			Connection conn = null;	
			PreparedStatement pstmt= null; 
			ResultSet rs = null;
			int result = 0;		    
			//게시글을 삭제 하는것이 아닌 삭제여부 값을 1넣는 것으로 게시글 리스트에서 보이지 않게 하고 db에는 값을 남긴다.
			//22.10.06 [김건희] sql 수정
			String sql2 = "select usernum from board where brd_bid = ? AND brd_deleted = 0 ";
			String sql="update board set brd_deleted = '1' where brd_bid = ? AND usernum = ?";
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql2);
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery();
				if(rs.next())
				{
					int result_usernum = rs.getInt(1); //해당 글 작성자의 유저번호 받아오는 쿼리문 실행
					pstmt.close();
					if( result_usernum == usernum) //글쓴이와 글삭제하는 이가 같을때
					{
						pstmt = conn.prepareStatement(sql);
						pstmt.setInt(1, num);
						pstmt.setInt(2, usernum);
						result = pstmt.executeUpdate(); //삭제 성공시 1, 삭제 오류시 0
					}
					else {
						result--;
					}
				}
			} catch(Exception e) {	
				System.out.println(e.getMessage()); 
			} finally {
				if (rs != null) rs.close();
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
	
	public int check(String user_id, int brd_bid) throws SQLException {
		Connection conn = null;	
		PreparedStatement pstmt= null; 
		int result = 0;		    
		ResultSet rs = null;
		String sql = "select BRD_WRITER from BOARD where BRD_BID=?";

		try {
			String BRD_WRITER = "";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, brd_bid);
			rs = pstmt.executeQuery();
			rs.next();
			BRD_WRITER = rs.getString(1); 
			if(user_id.equals(BRD_WRITER)) {
				result = 1;
			}else result =0;
		} catch(Exception e) {	
			System.out.println(e.getMessage()); 
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return result;
}
	
	//댓글 리스트 생성
	public List<Board> commentList(int brd_bid) throws SQLException {
		List<Board> commentlist = new ArrayList<Board>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//게시글 ref는 같지만 step는 0이상의 댓글 표시
		String sql = "select * from board where brd_ref = ? and brd_re_step > 0 and brd_deleted = 0";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, brd_bid);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				//유저 세션 표시
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
				commentlist.add(board);
				
			}
		} catch (Exception e) {
			System.out.println("dao commentlist error ->"+e.getMessage()); 
		}finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		} 
		return commentlist;
	}
	
	//  10.10 관리자 권한 게시물[체크박스 선택] 삭제 메서드 [최지웅]
	public int mgrDelete(int[]brd_bid) throws SQLException {
		Connection conn = null;	
		PreparedStatement pstmt= null; 
		
		int result = 0;
		int[] cnt = null;
		String sql="update board set brd_deleted = '1' where brd_bid = ?";
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			System.out.println("BoardDao mgrDelete sql=>"+sql); // 디버깅
			for(int i=0; i<brd_bid.length; i++) {
				pstmt.setInt(1,brd_bid[i]);
				pstmt.addBatch();  // 쿼리 값 일괄셋팅
				}
			System.out.println("BoardDao mgrDelete brd_bid.length=>"+brd_bid.length); // 디버깅
			cnt = pstmt.executeBatch();
			System.out.println("BoardDao mgrDelete cnt.length=>"+cnt.length); // 디버깅
			
			
			for(int i=0; i<cnt.length; i++) { 
				if(cnt[i]==-2) {
					result++;
					
				}
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();

		}
		return result;

	}
	
	//  10/11일 관리자 공지사항 게시글 등록 메서드 [최지웅]
	public int mgrInsert(Board board) throws SQLException {
		int result =0;
		System.out.println("BoardDao mgrInsert start...");
		System.out.println("BoardDao board.getBrd_bid ->"+board.getBrd_bid());
		int num = board.getBrd_bid(); //게시글 고유 번호 지정
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//게시글의 가장 마지막 고유 번호를 찾는다
		String sql1 = "select nvl(max(brd_bid),0) from board";
		//게시글 값 insert
		String sql2   =  "insert all into board values(?, '공지사항', ?, ?, TO_DATE(sysdate), ?, ?, ?, 0, ?, ?, ?, ?)";
		String sql2_1 =  "insert into board values(?, '댓글', ?, ?, TO_DATE(sysdate), ?, ?, ?, 0, ?, ?, ?, ?)";
		System.out.println("BoardDao mgrInsert sql2=>"+sql2);
		System.out.println("BoardDao mgrInsert sql2_1=>" +sql2_1);
		for(int i = 0 ; i < board.getBrd_img_src().size() ; i ++) {
			sql2 += "into FILES VALUES(?, ?, ?) ";
		}
		System.out.println("File 추가후 sql2->" + sql2);
		System.out.println("File 추가후 sql2_1->" + sql2_1);
		
		sql2 += "SELECT * FROM dual";
		String sql3 ="update board set brd_re_step = brd_re_step+1 where  brd_ref=? and brd_re_step > ?";
		System.out.println("BoardDao mgrInsert sql2(+dual)->"+ sql2);
		System.out.println("BoardDao mgrInsert dbSavePath->"+ board.getBrd_img_src());
		System.out.println("BoardDao mgrInsert start...");
		try {	
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			rs.next();
			// 가장 마지막 게시글 고유 번호에 +1 을 하여 새로 만들 게시글의 새 고유번호 지정
			int number = rs.getInt(1)+1;
			System.out.println("BoardDao insert number"+number);
			System.out.println("BoardDao insert num"+num);
			rs.close();
			pstmt.close();
			
			//댓글기능 2022.10.09
			if(num != 0)
			{
				System.out.println("BoardDAO insert 댓글 sql3->"+sql3);
				
				pstmt = conn.prepareStatement(sql3);
				pstmt.setInt(1, board.getBrd_ref());
				pstmt.setInt(2, board.getBrd_re_step());
				pstmt.executeUpdate();
				pstmt.close();
				
				//댓글 관련 정보
				board.setBrd_ref(num);//
				board.setBrd_re_step((board.getBrd_re_step()+1));
				board.setBrd_re_level((board.getBrd_re_level()+1));
				System.out.println("BoardDAO insert 댓글 num->"+num);
				System.out.println("BoardDAO insert 댓글 board.getRef()->"+board.getBrd_ref());
				System.out.println("BoardDAO insert 댓글 board.getRe_step()->"+board.getBrd_re_step());
				System.out.println("BoardDAO insert 댓글 board.getBrd_re_level()->"+board.getBrd_re_level());
				
				
			}
			if (num==0) {
				//num==0 첫 게시글 일때 조건
				board.setBrd_ref(number);
			}
			
			//null 일때 댓글 아닐때 게시글2022.10.09
			if (board.getBrd_title() != null) {
				pstmt = conn.prepareStatement(sql2);
			}
			else if (board.getBrd_title() == null) {
				pstmt = conn.prepareStatement(sql2_1);
			}
				//sql2 에 들어갈 값을 지정
				
				pstmt.setInt(1, number); //글 고유 번호 
				pstmt.setString(2, board.getBrd_title());  //글 제목
				pstmt.setString(3, board.getBrd_writer()); //글 작성자
				pstmt.setInt(4, board.getBrd_view()); //조회수 
				pstmt.setString(5, board.getBrd_content()); //글 내용
				pstmt.setInt(6, board.getBrd_secret()); //비밀 글 여부
				pstmt.setInt(7, board.getUsernum()); //글 쓴 유저 번호
				pstmt.setInt(8, board.getBrd_ref()); 
				pstmt.setInt(9, board.getBrd_re_step()); 
				pstmt.setInt(10,board.getBrd_re_level());
				
				for(int i = 0 ; i < 3*board.getBrd_img_src().size() ; i = i+3) {
		               pstmt.setInt(i + 11, number);
		               pstmt.setInt(i + 12, (i+3)/3);
		               pstmt.setString(i + 13, board.getBrd_img_src().get(i/3));
		            }
				result = pstmt.executeUpdate();
				
				System.out.println("BoardDAO insert number->"+ number);
				System.out.println("BoardDAO insert board.getBrd_title->"+ board.getBrd_title());
				System.out.println("BoardDAO insert board.getBrd_view->"+ board.getBrd_view());
				System.out.println("BoardDAO insert board.getBrd_content->"+ board.getBrd_content());
				System.out.println("BoardDAO insert board.getBrd_secret->"+ board.getBrd_secret());
				System.out.println("BoardDAO insert board.getBrd_ref->"+ board.getBrd_ref());
				System.out.println("BoardDAO insert board.getBrd_re_step->"+ board.getBrd_re_step());
				System.out.println("BoardDAO insert board.getBrd_re_level->"+ board.getBrd_re_level());
				
	
		} catch (Exception e) {
			System.out.println("BoardDAO insert error ->"+e.getMessage());
		}
		finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		
		return result;
	}
	
	
	
	

}
			
					
				
		
			
			
			
			
