

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class TeacherLoginValid
 */
@WebServlet("/TeacherLoginValid")
public class TeacherLoginValid extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TeacherLoginValid() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		 String User = request.getParameter("UserName");
	     String Password = request.getParameter("PassWord");
	     String uname = null;
	     String pwd = null;
	     int login_done = 0;
	     System.out.print(User + ""+ Password);
	    Connection con = DBConnection.DBconnect();
	    try {
	    	if(con.equals(null)){
	    		
	    	}else{
	    		 System.out.print("done");
	    	}
			Statement st = con.createStatement();
			String updt = "update teacher_login set Login_done = 0 where Login_date < NOW() - INTERVAL 1 DAY;";
			st.executeUpdate(updt);
			String sql = "select * from teacher_login where Username = '"+User+"' ;";
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()){
				uname = rs.getString(1);
				pwd = rs.getString(2);
				login_done = rs.getInt(5);
			}
			login_done++;
			System.out.print(uname + ""+ pwd);
			if(uname.equals(User) && pwd.equals(Password)){
				String sqls = "update teacher_login set Login_date = CURRENT_TIMESTAMP, Login_done = "+login_done+" where Username = '"+User+"' ;";
			    st.executeUpdate(sqls);
				HttpSession http = request.getSession(true);
				http.setMaxInactiveInterval(8*60);
				http.setAttribute("User", uname);
				// request.setAttribute("User", uname);
				 con.close();
				   RequestDispatcher rd = request.getRequestDispatcher("AddTeacherAttendence");
				   rd.forward(request, response);
			}
			else{
				 con.close();
				String Error = "Enter correct details";
				request.setAttribute("Error", Error );
			    RequestDispatcher rd = request.getRequestDispatcher("TechSign.jsp");
			    rd.forward(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			String Error = "Enter correct details";
			request.setAttribute("Error", Error );
		    RequestDispatcher rd = request.getRequestDispatcher("TechSign.jsp");
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
