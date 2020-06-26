

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MonthlySpends
 */
@WebServlet("/MonthlySpends")
public class MonthlySpends extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MonthlySpends() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String Electricity = request.getParameter("Electricity"); 
		String petrol = request.getParameter("petrol"); 
		String Vehicle = request.getParameter("Vehicle"); 
		String Water = request.getParameter("Water"); 
		String others = request.getParameter("others");  
		String Rents = request.getParameter("Rents");  
		int Tot = Integer.parseInt(request.getParameter("Total"));
		 long millis=System.currentTimeMillis();  
			java.sql.Date date=new java.sql.Date(millis);
		Connection con = DBConnection.DBconnect();
		int sum = 0;
	    try {
	    	if(con.equals(null)){
	    		
	    	}else{
	    		 System.out.print("done");
	    	}
	    	String sql = "insert into monthlyspends values(?,?,?,?,?,?,?,?);";
	    	java.sql.PreparedStatement st = con.prepareStatement(sql);
	    	st.setDate(1, date);
			st.setString(2, Electricity);
			st.setString(3, petrol );
			st.setString(4, Vehicle );
			st.setString(5, Water );
			st.setString(6, Rents );
			st.setString(7, others );
			st.setInt(8, Tot);
			int i = st.executeUpdate();
			if(i > 0){
				 con.close();
				request.setAttribute("result", "successfully added");
				RequestDispatcher rd = request.getRequestDispatcher("MonthlySpends.jsp");
				rd.forward(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			request.setAttribute("result", " Sorry Check Date you can only enter on month end");
			RequestDispatcher rd = request.getRequestDispatcher("MonthlySpends.jsp");
			rd.forward(request, response);
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
