

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

/**
 * Servlet implementation class AddStaff
 */
@WebServlet("/AddStaff")
public class AddStaff extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddStaff() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String firstname = request.getParameter("firstname");  
		String Designation = request.getParameter("Designation"); 
		System.out.print(Designation);
		String mobile = request.getParameter("mobile"); 
		String village = request.getParameter("village"); 
		Connection con = DBConnection.DBconnect();
		int sum = 0;
	    try {
	    	if(con.equals(null)){
	    		
	    	}else{
	    		 System.out.print("done");
	    	}
	    	int i = 0;
	    	String ret = "select id from staff_details";
	    	Statement stt = con.createStatement();
	    	ResultSet rs = stt.executeQuery(ret);
	       while(rs.next()){
	    	   i = rs.getInt(1);
	       }
	       i++;
	       System.out.print(i);
	    	String sql = "insert into staff_details values(?,?,?,?,?);";
	    	java.sql.PreparedStatement st = con.prepareStatement(sql);
	    	st.setInt(1, i );
			st.setString(2,firstname );
			st.setString(3,Designation );
			st.setString(4,mobile);
			st.setString(5,village);
			String salary = "insert into staff_salaries values("+i+",0,0,0,0,0,0,0,0,0,0,0,0);";
			int j = st.executeUpdate();
			int l = stt.executeUpdate(salary);
			con.close();
			if(j > 0 && l > 0){
				request.setAttribute("result","Successfully added your id : "+i);
				RequestDispatcher rd = request.getRequestDispatcher(""
						+"AddStaffs.jsp");
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
