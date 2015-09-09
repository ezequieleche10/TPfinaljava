package datos;
import java.sql.*;
import java.util.Map;
import java.util.Properties;
import java.util.concurrent.Executor;


public class ConexionBD {

    Connection Cone = null;
	//static String Url = "jdbc:mysql://localhost:3306/";
    static  String Url="jdbc:mysql://mysql25655-finaljava.mycloud.by/Comentautos_DB";
	static String dbName = "Comentautos_DB";/*nombre de la base de datos*/
	static String driver = "com.mysql.jdbc.Driver";
	static String userName = "root"; 
	static String password = "";
	
	
	
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
	
			

