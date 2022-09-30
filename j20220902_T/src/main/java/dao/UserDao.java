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
	private static UserDao instance;
	
	private UserDao() {
		
	}
	
	public static UserDao getInstance() 
	{
		if (instance == null) {	
			instance = new UserDao();		
		}
		return instance;
	}
	
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
	
	public int checkId (String id) throws SQLException
	{
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT id FROM users WHERE id = ?";
		try 
		{
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
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
	
	public String findId(String name, String phone) throws SQLException
	{
		String result ="";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT id FROM users WHERE name = ? AND phone = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, phone);
			rs = pstmt.executeQuery();
			if(rs.next())
			{
				result = rs.getString(1);
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
		
		return result;
	}
	
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
	
	public Users select(String id) throws SQLException {
		Users users = new Users();
		Connection conn = null;
		String sql = "select * from users where id=?"+id;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
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
	
	// 마이페이지 정보수정 09/29
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
		
	
	public int delete(String id, String pw) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		ResultSet rs = null;
		String sql1 = "select passwd from users where id=?";
		String sql = "delete from users where id=?";			
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