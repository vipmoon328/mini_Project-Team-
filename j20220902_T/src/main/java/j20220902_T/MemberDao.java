package j20220902_T;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

//Singleton + DBCP
public class MemberDao 
{
		private static MemberDao instance;
		private MemberDao() {
			
		}
		
		public static MemberDao getInstance()
		{
			if(instance == null)
			{
				instance = new MemberDao();
			}
			return instance;
		}
		
		//DBCP
		private Connection getConnection() throws SQLException
		{
			Connection conn = null;
			try {
				Context ctx = new InitialContext();
				DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/OracleDB"); 
				conn = ds.getConnection();
			} catch (NamingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return conn;
		}
}

