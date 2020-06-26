

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
 * Servlet implementation class UpdateSalaries
 */
@WebServlet("/UpdateSalaries")
public class UpdateSalaries extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateSalaries() {
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
		String lastname = request.getParameter("Lastname");
		String month = request.getParameter("Month");
		int sal = Integer.parseInt(request.getParameter("salary"));
		Connection con = DBConnection.DBconnect();
	    try {
	    	if(con.equals(null)){
	    		
	    	}else{
	    		 System.out.print("done");
	    	}
	    	int x = 0;
	    	Statement st = con.createStatement();
	    	String sql = "select id from teacher_details where FirstName = '"+firstname+"' AND LastName = '"+lastname+"' ;";
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()){
				x = rs.getInt(1);
			}
			if(x>0){
				String str = "update teachersalaries set "+ month+" = "+sal+" where id = "+x+";";
				int i = st.executeUpdate(str);
				if(i > 0 ){
					 con.close();
					request.setAttribute("result", "successfully added");
					RequestDispatcher rd = request.getRequestDispatcher("TeacherSalaries.jsp");
					rd.forward(request, response);
				}
			}else{
				 con.close();
				request.setAttribute("result", " No data Found");
				RequestDispatcher rd = request.getRequestDispatcher("TeacherSalaries.jsp");
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
