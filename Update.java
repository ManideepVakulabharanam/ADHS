

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
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Update
 */
@WebServlet("/Update")
public class Update extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Update() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession sess = request.getSession(true);
		String user_name = (String)sess.getAttribute("User");
		System.out.print(user_name);
		String class_no = request.getParameter("cls"); 
		int rollno = Integer.parseInt(request.getParameter("Rollno")); 
		System.out.println(rollno);
		String firstname = request.getParameter("firstname"); 
		String Lastname = request.getParameter("Lastname"); 
		String FatherName = request.getParameter("FatherName"); 
		String MotherName = request.getParameter("MotherName"); 
		String aadarno = request.getParameter("aadarno"); 
		String dob = request.getParameter("dob");
		System.out.println(dob);
		String mobile = request.getParameter("mobile"); 
		String village = request.getParameter("village"); 
		long millis=System.currentTimeMillis();  
		java.sql.Date date=new java.sql.Date(millis);
		Connection con = DBConnection.DBconnect();
	    try {
	    	if(con.equals(null)){
	    		
	    	}else{
	    		 System.out.print("done");
	    	}
	    	   String sql = "update "+class_no+" set Firstname='"+firstname+"', Lastname='"+Lastname+"', FatherName='"+FatherName+"',MotherName ='"+MotherName+"',aadarNumber='"+aadarno+"',dob ='"+dob+"', MobileNumber='"+mobile+"', Village='"+village+"' where rollno="+rollno; 
	    	Statement st = con.createStatement();
			int i = st.executeUpdate(sql);
			if(i > 0){
				
				 String string = "insert into notifications values('"+date+"','"+user_name+"','Edited student of class : "+class_no+"  id : "+rollno+"');";
		    	   st.executeUpdate(string);
		    	   con.close();
				request.setAttribute("result", "successfully Updated");
				RequestDispatcher rd = request.getRequestDispatcher("EditStudent.jsp");
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
