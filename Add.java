

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.PreparedStatement;

/**
 * Servlet implementation class Add
 */
@WebServlet("/Add")
public class Add extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Add() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("deprecation")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession sess = request.getSession(true);
		String user_name = (String)sess.getAttribute("User");
		String class_no = request.getParameter("class"); 
		int rollno = Integer.parseInt(request.getParameter("Rollno")); 
		String firstname = request.getParameter("firstname"); 
		String Lastname = request.getParameter("Lastname"); 
		String FatherName = request.getParameter("FatherName"); 
		String MotherName = request.getParameter("MotherName"); 
		String aadarno = request.getParameter("aadarno"); 
		String dob = request.getParameter("dob");
		String mobile = request.getParameter("mobile"); 
		String village = request.getParameter("village"); 
		long millis=System.currentTimeMillis();  
		java.sql.Date date=new java.sql.Date(millis);
		Connection con = DBConnection.DBconnect();
		int sum = 0;
	    try {
	    	if(con.equals(null)){
	    		
	    	}else{
	    		 System.out.print("done");
	    	}
	    	String sql = "insert into "+class_no+" values(?,?,?,?,?,?,?,?,?);";
	    	java.sql.PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, rollno);
			st.setString(2,firstname );
			st.setString(3,Lastname );
			st.setString(4,FatherName );
			st.setString(5,MotherName );
			st.setString(6,aadarno );
			st.setString(7, dob);
			st.setString(8,mobile);
			st.setString(9,village);
			int i = st.executeUpdate();
			String stl = "insert into attendence"+class_no+" values("+rollno+",0,0,0,0,' ','2006-03-20');";
			System.out.print(class_no);
			String sll = "insert into fee_details"+class_no+" values(0,0,0,0,"+rollno+");";
			Statement stt = con.createStatement();
			int j = stt.executeUpdate(sll);
			int k = stt.executeUpdate(stl);
          
			if(i > 0 && j > 0 && k > 0){
				 String string = "insert into notifications values('"+date+"','"+user_name+"','Added New Student of class : "+class_no+" id :"+rollno+"');";
		    	   st.executeUpdate(string);
		    	   con.close();
				request.setAttribute("result", "successfully added");
				RequestDispatcher rd = request.getRequestDispatcher("AddStudent.jsp");
				rd.forward(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			request.setAttribute("result", "Please Check Details Correctly Student Already exists");
			RequestDispatcher rd = request.getRequestDispatcher("AddStudent.jsp");
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
