import java.sql.Connection;
import java.sql.DriverManager;
public class DBConnection{

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//got error for url initially then gone after adding things after ? in url
		//java.sql.SQLException: Unknown initial character set index '255' received from server this is error
		DBConnection.DBconnect();
	}
	public static Connection DBconnect(){
		String url="jdbc:mysql://localhost:3306/adhs?characterEncoding=utf8&useSSL=false&useUnicode=true";
		Connection con = null;
		try{
       	 Class.forName("com.mysql.jdbc.Driver");
         con = DriverManager.getConnection(url,"root","Mandy.143");
        }
        catch(Exception e){
       	 e.printStackTrace();
        }
		
		return con;
	}

}