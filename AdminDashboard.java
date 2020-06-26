
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;
/**
 * Servlet implementation class AdminDashboard
 */
@WebServlet("/AdminDashboard")
public class AdminDashboard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminDashboard() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	     String UserName = request.getParameter("UserName");
	     String Password = request.getParameter("PassWord");
	     String uname = null;
	     String pwd = null;
	    Connection con = DBConnection.DBconnect();
	    try {
	    	if(con.equals(null)){
	    		
	    	}else{
	    		 System.out.print("done");
	    	}
			Statement st = con.createStatement();
			String sql = "select * from admin_logins";
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()){
				uname = rs.getString(1);
				pwd = rs.getString(2);
			}
			if(uname.equals(UserName)&&pwd.equals(Password)){
				HttpSession old_session_http = request.getSession(false);
				if(old_session_http != null){
					System.out.append("yes");
					old_session_http.invalidate();
				}
				HttpSession http = request.getSession(true);
				 http.setMaxInactiveInterval(2*60);
				 
				 Cookie message = new Cookie("message", "Welcome");
		            response.addCookie(message);
		            
				 System.out.print(http.getMaxInactiveInterval());
				http.setAttribute("User", uname);
				// request.setAttribute("User", uname);
				
				 con.close();
				   RequestDispatcher rd = request.getRequestDispatcher("AdminDashboard.jsp");
				   rd.forward(request, response);
				  
			}
			else{
				 con.close();
				String Error = "Enter correct details";
				request.setAttribute("Error", Error );
			    RequestDispatcher rd = request.getRequestDispatcher("SignIn.jsp");
			    rd.forward(request, response);
			   
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
