package JDBC;

import java.sql.*;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class SQL  {
	
	private static Connection con = null;
	private PreparedStatement PST = null;
	private Statement ST = null;
	private ResultSet RS = null;
	
	private static final String Driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	private static final String URL = "jdbc:sqlserver://localhost:1433;integratedSecurity=true;DatabaseName=Shop";
	
	public static Connection getcon() {
			try {
				Class.forName(Driver);
				try {
					con = DriverManager.getConnection(URL);
				}
				catch (SQLException e) {
					e.printStackTrace();
				}
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			 
		return con;
	}
	
	public int Update(String sql) {
		int num=0;
		con=getcon();
		try {
			PST = con.prepareStatement(sql);
			num = PST.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return num;
	}
	
	public JSONArray Query(String sql) {
		con=getcon();
		JSONArray array = new JSONArray();
		try {
			ST = con.createStatement();
			ResultSet RS = ST.executeQuery(sql);
			ResultSetMetaData metaData = RS.getMetaData();
			int columnCount= metaData.getColumnCount();  
			while(RS.next()) {
				JSONObject jsonObj = new JSONObject();
				for(int i = 1; i <= columnCount;i++)  
	              {  
	               String columnName = metaData.getColumnLabel(i);  
	               String value =RS.getString(columnName);
	               jsonObj.put(columnName, value);
	              }
				array.add(jsonObj);  
			} 
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
			}
		return array;
	}
	
	public void close() {
		try {
			if(RS != null) {
				RS.close();
				}
			if(ST != null) {
				ST.close();
				}
			if(con != null) {
				con.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
				}
		}
}
