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

//싱글톤 구현
public class UserDao 
{
	//싱글톤 구현 1 [김건희]
	private static UserDao instance;
	
	//싱글톤 구현 2 [김건희]
	private UserDao() {
		
	}
	
	//싱글톤 구현 3 [김건희]
	public static UserDao getInstance() 
	{
		if (instance == null) {	
			instance = new UserDao();		
		}
		return instance;
	}
	
	//데이터 베이스 연결을 위한 셋팅 [김건희]
	private Connection getConnection() 
	{
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)
				ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		}catch(Exception e) { 
			System.out.println(e.getMessage());	
		}
		return conn;
	}
	
	//아이디 중복을 확인하기 위한 메소드 [김건희]
	public int checkId (String id) throws SQLException
	{
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		//아이디 중복을 확인하지만 삭제된 아이디일 경우에는 아이디 중복이 가능하기 위한 쿼리문
		String sql = "SELECT id FROM users WHERE id = ? and deleted = ?";
		try 
		{
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, 1);
			
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				System.out.println("아이디 중복 확인");
				result++;
			}
		} catch (Exception e) {
			System.out.println("아이디 조회 실패");
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		
		System.out.println(result);
		return result;
	}

	// 로그인 페이지의 아이디 찾기 기능을 위한 메소드 (입력값 : 이름, 휴대폰 번호) [김건희]
		public Users findId(String name, String phone) throws SQLException
		{
			String result ="";
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			//아이디 찾기 시에 기존에 가졌던 데이터를 이용해서 바로 비밀번호 찾기를 원할 경우에 바로 넘어가기 위해서 id랑 usernum 을 조회한다 [김건희]
			String sql = "SELECT id, usernum FROM users WHERE name = ? AND phone = ?";
			Users users = new Users();
			
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setString(2, phone);
				rs = pstmt.executeQuery();
				
				if(rs.next())
				{
					users.setId(rs.getString(1));
					users.setUsernum(rs.getInt(2));
					System.out.println("아이디 조회 성공");	
				}
				
				else
				{
					System.out.println("아이디 조회 실패 \n 해당되는 아이디가 없습니다");
				}
				
			} catch (Exception e) {
				System.out.println(e.getMessage());
			} finally {
				if (rs != null) rs.close();
				if (conn != null) conn.close();
				if (pstmt != null) pstmt.close();
			}
			
			return users;
		}
		
		//비밀번호 찾기시에 정보 일치시에 비밀번호를 변경하는 메소드 [김건희]
		public int updatePw(String pw, String usernum)
		{
			int result = 0;
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			String sql = "UPDATE users SET pw = ? WHERE usernum = ?";
			
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, pw);
				pstmt.setString(2, usernum);
				result  = pstmt.executeUpdate();
				System.out.println("수정 성공");
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			
			return result;
		}
	
	//유저를 생성하는 메소드 시퀸스를 사용, 미리 정의해 둬야함, 자세한 내용은 공유 파일 참조바람 [김건희]
	public int insert (Users user) throws SQLException
	{
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "INSERT INTO Users VALUES(usernum_count.nextval,?,?,?,?,?,?,?,?,?)";
		
		try
		{
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,user.getId());
			pstmt.setString(2,user.getPw());
			pstmt.setString(3,user.getName());
			pstmt.setString(4,user.getGender());
			pstmt.setString(5,user.getPhone());
			pstmt.setString(6,user.getEmail());
			pstmt.setInt(7,1);
			pstmt.setInt(8,1);
			pstmt.setInt(9, user.getBrn_uid());
			result = pstmt.executeUpdate();
			System.out.println(result);
			System.out.println("입력 성공!");
		} catch (Exception e) {
			System.out.println("입력 실패!");
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		
		return result;
	}
	
	// 로그인 페이지의 비밀번호 찾기 위한 데이터를 추출하는 위한 메소드 (입력값 : 아이디, 이름, 휴대폰 번호) [김건희]
	public int findPw(String id, String name, String phone) throws SQLException
	{
		int result = 0;
		ResultSet rs = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "SELECT usernum FROM users WHERE id = ? AND name = ? AND phone = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, phone);
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				System.out.println("유저 번호 조회 성공");
				result = rs.getInt(1);
			}
			else
			{
				System.out.println("유저 번호 조회 실패");
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null) rs.close();
			if (conn != null) conn.close();
			if (pstmt != null) pstmt.close();
		}
		return result;
	}
	
	// 로그인 페이지에서 로그인을 할때 사용하는 메소드
	public int login(String id, String passwd) throws SQLException
	{
		int result = 0;
		ResultSet rs = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "SELECT pw FROM users WHERE id = ? AND pw = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, passwd);
			rs = pstmt.executeQuery();
			if(rs.next())
			{
				System.out.println("조회 성공");
				result++;
			}
			else
			{
				System.out.println("조회 실패");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null) rs.close();
			if (conn != null) conn.close();
			if (pstmt != null) pstmt.close();
		}
		
		return result;
	}
	
	// 마이페이지에서 회원정보를 불러오는 메소드
	public Users select(String id) throws SQLException {
		Users users = new Users();
		Connection conn = null;
		String sql = "select id,pw,name,gender,phone,email,brn_uid from users where id = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) 
			{
				users.setId(rs.getString(1));
				users.setPw(rs.getString(2));
				users.setName(rs.getString(3));
				users.setGender(rs.getString(4));
				users.setPhone(rs.getString(5));
				users.setEmail(rs.getString(6));
				users.setBrn_uid(rs.getInt(7));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}		
		return users;		
	}
	
	// 마이페이지에서 회원정보를 수정하는 메소드
	public int update(Users users) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "Update users set pw=?, name=?, phone=?, gender=?, brn_uid=?, email=? where id=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, users.getPw());
			pstmt.setString(2, users.getName());
			pstmt.setString(3, users.getPhone());
			pstmt.setString(4, users.getGender());
			pstmt.setInt(5, users.getBrn_uid());
			pstmt.setString(6, users.getEmail());
			pstmt.setString(7, users.getId());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return result;
	}
		
	// 마이페이지에서 회원탈퇴를 실행하는 메소드 , 데이터는 남기고 deleted를 1에서 0으로 바꿔줌 
	public int delete(String id, String pw) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		ResultSet rs = null;
		String sql1 = "select passwd from users where id = ?";
		String sql = "update users set deleted = 0 where id = ?";			
		try {
			String dbPasswd = "";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dbPasswd = rs.getString(1);
				if (dbPasswd.equals(pw)) {
					rs.close();
					pstmt.close();
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, id);
					result = pstmt.executeUpdate();
				} else result = 0;
			} else result = -1;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}		
		return result;		
	}	
	// users table  총 데이터 갯수 가져오는 method 09/30  [최지웅]
	public int getTotalCnt() throws SQLException{
		Connection conn = null;
		Statement  stmt = null;
		ResultSet  rs   = null;
		int tot =0;
		String sql = "select count(*) from users";   // users table  총 데이터 갯수 가져오기
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs   = stmt.executeQuery(sql);
			if(rs.next()) tot = rs.getInt(1);   // 결과값이 있으면 tot에 int형으로 값을 저장한다.
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			if(rs  != null) rs.close();
			if(stmt != null) stmt.close();
			
		}
		return tot;
	}

	//  user 테이블 데이터 list로 받아오는 method 09/30  [최지웅]
	public List <Users> usersList(int startRow, int endRow) throws SQLException{
		List<Users> list = new ArrayList<Users>();
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		String sql = "select *"
					+"FROM (select rownum rn,a.*"
					+"from(select * from users order by usernum) a)"
					+"where rn BETWEEN ? and  ?";
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Users users = new Users();
				users.setUsernum(rs.getInt("userNum"));
				users.setId(rs.getString("id"));
				users.setPw(rs.getString("pw"));
				users.setName(rs.getString("name"));
				users.setGender(rs.getString("gender"));
				users.setPhone(rs.getString("phone"));
				users.setEmail(rs.getString("email"));
				users.setAuth(rs.getInt("auth"));
				users.setDeleted(rs.getInt("deleted"));
				users.setBrn_uid(rs.getInt("brn_uid"));
				list.add(users);
			}
		} catch (Exception e) {
				System.out.println(e.getMessage());
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return list;
	
	
	}
	
	
	
}