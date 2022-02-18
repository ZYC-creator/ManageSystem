package JDBC;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/Register.java")
public class Register extends HttpServlet{
	protected void service(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		request.setCharacterEncoding("UTF-8");
		SQL sql = new SQL();
		SQL.getcon();
		Date date = new Date();
		DateFormat format =new SimpleDateFormat("yyyy-MM-dd");
		String user = request.getParameter("username");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		String time = format.format(date);
		String number = request.getParameter("number");
		String position = request.getParameter("position");
		String Insert = "insert into Message(ID,PassWord,Name,Age,Time,Number,Position)values('"
		+user+"','"+password+"','"+name+"',"+age+",'"+time+"','"+number+"','"+position+"')";
		if((number!="")&&(user!="")&&(password!="")&&(name!="")&&(age!="")&&(time!="")&&(number!="")&&(position!="")) {
			sql.Update(Insert);
		}
		else {
			response.getWriter().write("1");
		}
	}
}
