

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class StudentDashboard
 */
@WebServlet("/StudentDashboard")
public class StudentDashboard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentDashboard() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		 try {
			 Connection con = DBConnection.DBconnect();
			 ArrayList ll = new ArrayList();
			 
			 for(int i = 0;i<10;i++){
				 ll.add(0);
			 }
		    	if(con.equals(null)){
		    		
		    	}else{
		    		 System.out.print("done");
		    	}
		    	for(int i =0;i<10;i++){
		    		int x = 0;
					 int total = 0;
		    	String sql = "select todayabsent from attendenceclass_"+i+";";
		    	Statement st = con.createStatement();
		    	ResultSet rs = st.executeQuery(sql);
		    	while(rs.next()){
		    		x += rs.getInt(1);
		    	}
		    	total += x;
		    	ll.add(total);
		    	}
				if(ll.size() > 0){
					 con.close();
					request.setAttribute("result", ll);
					RequestDispatcher rd = request.getRequestDispatcher("StudentDashboard.jsp");
					rd.forward(request, response);
				}
				else{
					 con.close();
					request.setAttribute("nodt", "No data found");
					RequestDispatcher rd = request.getRequestDispatcher("StudentDashboard.jsp");
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
