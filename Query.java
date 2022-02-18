package JDBC;

import java.io.IOException;
import net.sf.json.JSONArray;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/Query.java")
public class Query extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		SQL sql = new SQL();
		SQL.getcon();
		JSONArray array = new JSONArray();
		String number = request.getParameter("number");
		if(number=="") {
			String query = "select SNO,SNAME,SWHERE,SAREA from shop";
			array = sql.Query(query);
			response.setCharacterEncoding("UTF-8");
			response.getWriter().append(array.toString());
		}
		else {
			String query = "select SNO,SNAME,SWHERE,SAREA from shop where sno="+"'"+number+"'";
			array = sql.Query(query);
			response.setCharacterEncoding("UTF-8");
			response.getWriter().append(array.toString());
		}
	}
}
