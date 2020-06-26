

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
 * Servlet implementation class UpdateFees
 */
@WebServlet("/UpdateFees")
public class UpdateFees extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateFees() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		//String class_no = request.getParameter("class"); 
		HttpSession sess = request.getSession(true);
		String user_name = (String)sess.getAttribute("User");
		String Term = request.getParameter("Term");
		System.out.println(Term);
		String cls = request.getParameter("class");
		int fee = Integer.parseInt(request.getParameter("fee"));
		int rollno = Integer.parseInt(request.getParameter("Rollno")); 
		String str = "select rollno from "+cls+" where rollno like '"+rollno+"'";
		long millis=System.currentTimeMillis();  
		java.sql.Date date=new java.sql.Date(millis);
		Connection con = DBConnection.DBconnect();
		java.sql.Statement st;
		int x = 0;
		try {
			st = con.createStatement();
			ResultSet rt = st.executeQuery(str);
			while(rt.next()){
			x =	rt.getInt(1);
			}
			if(x!=rollno){
				request.setAttribute("result", "No datafound");
				RequestDispatcher rd = request.getRequestDispatcher("Fees.jsp");
				rd.forward(request, response);
			}
			else{
		int i = 0;
	    	switch(Term){
	    	case "Term1": i = update(Term,cls,rollno,fee);
	    	              break;
	    	case "Term2": i = update(Term,cls,rollno,fee);
            break;
	    	case "Term3": i = update(Term,cls,rollno,fee);
            break;
	    	case "Term4": i = update(Term,cls,rollno,fee);
            break;
	    	}
	    	if(i > 0){
	    		 String string = "insert into notifications values('"+date+"','"+user_name+"','Added fee for Student rollno : "+rollno+" class : "+cls+"');";
	      	   st.executeUpdate(string);
	    		 con.close(); 
				request.setAttribute("result", "successfully added");
				RequestDispatcher rd = request.getRequestDispatcher("Fees.jsp");
				rd.forward(request, response);
			}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	int update(String s,String cls,int rollno,int fee){
		Connection con = DBConnection.DBconnect();
		 int i = 0;
		 int x = 0;
	    try {
	    	java.sql.Statement st = con.createStatement();
            String sql = "update fee_details"+cls+" set "+s+"="+fee+",Rollno = "+rollno+" ;";
	    		i = st.executeUpdate(sql);
    }catch(Exception e){
    	e.printStackTrace();
    }  
		return i;
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
