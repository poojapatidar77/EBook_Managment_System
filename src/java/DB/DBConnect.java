package DB;
import java.sql.*;

public class DBConnect {

  private static Connection con;
	
  public static Connection getCon()
  {
	try
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/EBook?useSSL=false","root","root");
		
	}catch(Exception e)
	{
		System.out.println("What to do.........................");
		e.printStackTrace();
	}
	  return con;
  }
}
