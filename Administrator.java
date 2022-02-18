package JDBC;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
@WebServlet("/Administrator.java")
public class Administrator extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("na");
		SQL sql = new SQL();
		SQL.getcon();
		String query = "select * from Message where ID='"+name+"'";
		JSONArray array = new JSONArray();
		array=sql.Query(query);
		response.getWriter().append(array.toString());
	}
}
