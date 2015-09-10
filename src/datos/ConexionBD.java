package datos;
import java.sql.*;
import java.util.Map;
import java.util.Properties;
import java.util.concurrent.Executor;


public class ConexionBD {

    Connection Cone = null;
	//static String Url = "jdbc:mysql://localhost:3306/Comentautos_DB";
    static  String Url="jdbc:mysql://127.13.104.130:3306/tpjava";
	static String dbName = "Comentautos_DB";/*nombre de la base de datos*/
	static String driver = "com.mysql.jdbc.Driver";
	static String userName = "adminmV9ZeN7"; 
	static String password = "4uKd49NUj_-C";
//	static String userName="root";
	//static String password="";
	
	
	public void OpenConection()
	{
							try{
								  Class.forName(driver).newInstance();
								  Cone = DriverManager.getConnection(Url,userName,password);
							}
							catch( Exception e)
							{
								e.printStackTrace();
							}
	}
		
public void CloseConnection()
	{
							try{
								Cone.close();
							}
							catch( Exception e)
							{
								e.printStackTrace();
							}
	}

}
	
			

