package JDBC;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/Insert.java")
public class Insert extends HttpServlet{
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
	    String UNIT = "元";
	    //;
	    int Count = Integer.valueOf(count).intValue();//获取进货的数量
	    int x = (int)(Math.random()*10+1);//随机生成销量
	    int y=Count - x;//得到剩余库存;
	    //;
	    int Sale =Integer.valueOf(sale).intValue();//获取进货价
	    int Price =Integer.valueOf(price).intValue();//获取售价
	    int m = (Price - Sale)*x;//得到每个商品的利润
	    String Insert="insert into shop(SNO,SNAME,SWHERE,SAREA)values("+"'"+number+"'"+","+"'"+name+"'"+","+"'"+where+"'"+","+"'"+area+"'"+")"
	    +"insert into WareHouse(SNO,SNAME,WIN,UNIT,WOU,WLEFT)values("+"'"+number+"',"+"'"+name+"',"+count+","+"'"+unit+"',"+x+","+y+")"
	    		+"insert into Profit(SNO,SNAME,PIN,PSALE,PProfit,UNIT)values("+"'"+number+"',"+"'"+name+"',"+Sale+","+Price+","+m+",'"+UNIT+"'"+")";
		sql.Update(Insert);
		}
}
