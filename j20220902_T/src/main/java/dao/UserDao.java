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
	
	public int delete(String id, String pw) throws SQLException {
		int result = 0;
		Connection conn = null;
		result = check(id, pw);
		if (result != 1) return result;
		String sql = "delete from scott2 where id=?";
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}		
		return result;		
	}
}