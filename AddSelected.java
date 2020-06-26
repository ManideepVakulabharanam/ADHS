

import java.io.IOException;
import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AddSelected
 */
@WebServlet("/AddSelected")
public class AddSelected extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddSelected() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		Statement st = null; 
		Connection con = null;
		int count = 0;
		HttpSession sess = request.getSession(true);
		String cls = (String)sess.getAttribute("cls");
		  try{
			  Class.forName("com.mysql.jdbc.Driver");
			  String url="jdbc:mysql://localhost:3306/adhs?characterEncoding=utf8&useSSL=false&useUnicode=true";
			  con = DriverManager.getConnection(url,"root","Mandy.143");
		       if(con!=null){
		    	   System.out.println("connected");
		       }
		       st = con.createStatement();
		       long millis=System.currentTimeMillis();  
				java.sql.Date date=new java.sql.Date(millis);
				String dates= null;
		 int roll = 0;
		      java.util.Date datee = Calendar.getInstance().getTime();  
		       DateFormat dateFormat = new SimpleDateFormat("dd-mm-yyyy");  
		       String del = "delete from selectedsms where date_today < NOW() - INTERVAL 1 DAY;";
		       st.executeUpdate(del);
		       String res[]  = request.getParameterValues("attend");
		       int rollno = 0;
		       String name = null;
		       String mobile = null;
		       int present = 0;
		       int absent = 0;
		       for(int i =0 ;i<res.length;i++){
		    	   String sql = "select * from "+cls+" where MobileNumber = '"+res[i]+"';";
		    	   ResultSet rs = st.executeQuery(sql);
		    	   while(rs.next()){
		    		   rollno = rs.getInt(1);
		    		   System.out.print(rollno);
		    		   name = rs.getString(2);
		    		   System.out.print(rollno);
		    		  mobile = rs.getString(8);
		    		  System.out.print(rollno);
		    	   }
		    	   String sqll = "insert into mobile_number values ('"+rollno+"','"+name+"','"+mobile+"','"+cls+"','"+date+"');";
		    	   count = st.executeUpdate(sqll);
		       }
		       con.close();
		       if(count > 0){
		    	   request.setAttribute("result", "successfully added");
					RequestDispatcher rd = request.getRequestDispatcher("SelectedSms.jsp");
					rd.forward(request, response);
		       }
		  }catch(Exception e){
			  e.printStackTrace();
		  }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
