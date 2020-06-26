

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
 * Servlet implementation class InsesrtDailySpends
 */
@WebServlet("/InsesrtDailySpends")
public class InsesrtDailySpends extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsesrtDailySpends() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
       //response.getWriter().append("Served at: ").append(request.getContextPath());
		String[] labels = request.getParameterValues("labels");
		String[] values = request.getParameterValues("values");
		long millis=System.currentTimeMillis();  
		int k= 0;
		java.sql.Date date=new java.sql.Date(millis);
		Connection con = DBConnection.DBconnect();
		try {
			Statement st = con.createStatement();
			for(int i=0,j=0;i<labels.length&&j<values.length;i++,j++){
				System.out.print(values[j]+""+labels[i]);
				String str = "insert into daily_spends values('"+date+"','"+labels[i]+"','"+values[j]+"');";
				 k = st.executeUpdate(str);
			}
			if(k>0){
				request.setAttribute("result", "successfully added");
				RequestDispatcher rd = request.getRequestDispatcher("DailySpends.jsp");
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
