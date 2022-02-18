package JDBC;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/Update.java")
public class Update extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		SQL sql = new SQL();
		SQL.getcon();
		request.setCharacterEncoding("UTF-8");
		String number = request.getParameter("number");
		String name = request.getParameter("name");
		String where = request.getParameter("where");
		String area = request.getParameter("area");
	    String price = request.getParameter("price");
	    String count = request.getParameter("count");
	    String sale = request.getParameter("sale");
	    String unit = request.getParameter("unit");
	    String Update="Update Shop set SNO='"+number+"'where SNO='"+number+"';"
	    		+"Update Shop set sname='"+name+"'where SNO='"+number+"';"
	    		+"Update Shop set swhere='"+where+"'where SNO='"+number+"';"
	    		+"Update Shop set sarea='"+area+"'where SNO='"+number+"';"
	    		+"Update Profit set psale='"+price+"'where SNO='"+number+"';"
	    		+"Update profit set pin='"+sale+"'where SNO='"+number+"';"
	    		+"Update warehouse set win='"+count+"'where SNO='"+number+"';"
	    		+"Update warehouse set unit='"+unit+"'where SNO='"+number+"';";
	    sql.Update(Update);
	}
}
