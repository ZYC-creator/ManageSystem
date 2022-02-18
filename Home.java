package JDBC;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
@WebServlet("/Home.java")
public class Home extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		SQL sql = new SQL();
		SQL.getcon();
		String query ="select SNAME,PPROFIT from Sprofit";
		JSONArray array = new JSONArray();
		array = sql.Query(query);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().append(array.toString());
	}
}
