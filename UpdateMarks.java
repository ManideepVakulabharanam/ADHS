

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
 * Servlet implementation class UpdateMarks
 */
@WebServlet("/UpdateMarks")
public class UpdateMarks extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMarks() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String class_no = request.getParameter("class"); 
		String Exam = request.getParameter("Exam");
		int rollno = Integer.parseInt(request.getParameter("Rollno")); 
		String Telugu = request.getParameter("Telugu"); 
		String Hindi = request.getParameter("Hindi"); 
		String English = request.getParameter("English"); 
		String Maths = request.getParameter("Maths"); 
		String Science = request.getParameter("Science"); 
		String Social = request.getParameter("Social");
		String Total = request.getParameter("Total");
		HttpSession sess = request.getSession(true);
		String user_name = (String)sess.getAttribute("User");
		long millis=System.currentTimeMillis();  
		java.sql.Date date=new java.sql.Date(millis);
		Connection con = DBConnection.DBconnect();
		int sum = 0;
	    try {
	    	if(con.equals(null)){
	    		
	    	}else{
	    		 System.out.print("done");
	    	}
	    	String str = "select rollno from "+class_no+" where rollno like '"+rollno+"'";
	    	int x = 0;
	    	Statement sts = con.createStatement();
	    	ResultSet rt = sts.executeQuery(str);
			while(rt.next()){
			x =	rt.getInt(1);
			}
			if(x!=rollno){
				request.setAttribute("result", "No datafound");
				RequestDispatcher rd = request.getRequestDispatcher("Exam.jsp");
				rd.forward(request, response);
			}
			else{
	    	String sql = "insert into "+class_no+"marks values(?,?,?,?,?,?,?,?,?) where student_rollno = "+rollno+";";
	    	java.sql.PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, Telugu);
			st.setString(2,Hindi );
			st.setString(3,English );
			st.setString(4,Maths );
			st.setString(5,Science );
			st.setString(6,Social );
			st.setInt(7, rollno);
			st.setString(8,Exam);
			st.setString(9,Total);
			int i = st.executeUpdate();
			if(i > 0){
				String string = "insert into notifications values('"+date+"','"+user_name+"','Changed Marks of class :"+class_no+" id :"+rollno+"');";
		    	   st.executeUpdate(string);
				 con.close();
				request.setAttribute("result", "successfully added");
				RequestDispatcher rd = request.getRequestDispatcher("AddExam.jsp");
				rd.forward(request, response);
			}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			request.setAttribute("result", "Check Exam Type");
			RequestDispatcher rd = request.getRequestDispatcher("AddExam.jsp");
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
