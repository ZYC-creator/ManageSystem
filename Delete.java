package JDBC;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/Delete.java")
public class Delete extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		SQL sql = new SQL();
		SQL.getcon();
		request.setCharacterEncoding("UTF-8");
		String number = request.getParameter("td");
		String delete = "delete from shop where sno ="+"'"+number+"';"
				+"delete from WareHouse where sno ='"+number+"';"
				+"delete from Profit where sno ='"+number+"'";
		sql.Update(delete);
	}
}
