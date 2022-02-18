package JDBC;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
@WebServlet("/Message.java")
public class Message extends HttpServlet{
	protected void service(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		SQL sql = new SQL();
		JSONArray array = new JSONArray();
		SQL.getcon();
		String query = "select shop.sno,shop.sname,shop.swhere,shop.sarea,warehouse.win,warehouse.unit,profit.PSALE,profit.PIN "
				+ "from shop,warehouse,profit "
				+ "where shop.sno=WareHouse.Sno and shop.sno=profit.sno";
		array = sql.Query(query);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().append(array.toString());
	}
}
