package JDBC;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Time {

	public static void main(String args[]) {
		Date date = new Date();
		DateFormat format =new SimpleDateFormat("yyyy-MM-dd");
		String time = format.format(date);
		System.out.print(time);
	}
}
