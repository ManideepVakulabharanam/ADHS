

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.Period;
import java.util.Formatter;
import java.sql.Date;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Updateleave
 */
@WebServlet("/Updateleave")
public class Updateleave extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Updateleave() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		Connection con = DBConnection.DBconnect();
		HttpSession sess = request.getSession(true);
		String user_name = (String)sess.getAttribute("User");
		Date dt = null;
		Date dt2 = null;
		String reason = request.getParameter("reason");
		String leave_type = request.getParameter("leave");
		try {
			HttpSession http = request.getSession(true);
		    int id = (int)	http.getAttribute("id");
			Statement st = con.createStatement();
			String date = request.getParameter("date");
			String date2 = request.getParameter("date2");
			//System.out.print(date);
			
			LocalDate ldt = LocalDate.parse(date);
			LocalDateTime ldtr = LocalDateTime.of(ldt, LocalTime.MIDNIGHT);
			LocalDate ldt2 = LocalDate.parse(date2);
			LocalDateTime ldtr2 = LocalDateTime.of(ldt2, LocalTime.MIDNIGHT);
			//System.out.print(ldt);
	          dt = Date.valueOf(ldt);
			 dt2 = Date.valueOf(ldt2);
			//System.out.print(dt);
			Period period = Period.between(ldtr.toLocalDate(), ldtr2.toLocalDate());
			//Duration duration = Duration.between(ldt,ldt2);
			System.out.print(period.getDays());
			
		    String str = "insert into teacher_leave_details values("+id+",'"+dt+"','"+dt2+"','"+reason+"','"+leave_type+"');";
		    st.executeUpdate(str);
		    String strng = "select "+leave_type+" from teacher_attendence where id="+id+";";
		    ResultSet rs = st.executeQuery(strng);
		    float count_leaves = 0;
		    while(rs.next()){
		    	count_leaves = rs.getFloat(1);
		    }
		    if(count_leaves < period.getDays()||count_leaves == 0){
		    	String Error = "You don't have balance "+leave_type+" you will be marked absent";
				request.setAttribute("Error", Error );
		    	RequestDispatcher rd = request.getRequestDispatcher("ApplyLeave.jsp");
				rd.forward(request, response);
		    }
		    else{
		    	count_leaves -= period.getDays();
		    	String strs = "update teacher_attendence set "+leave_type+" = "+count_leaves+" where id ="+id+";";
		    	st.executeUpdate(strs);
		    	 String string = "insert into notifications values('"+date+"','"+user_name+"','Teacher applied for leave for "+period.getDays()+" days');";
		    	   st.executeUpdate(string);
		    	String Error = "You leave is approved now your "+leave_type+" on "+dt+"balance is "+count_leaves+"";
		    	request.setAttribute("Error", Error );
		    	RequestDispatcher rd = request.getRequestDispatcher("ApplyLeave.jsp");
				rd.forward(request, response);
		    }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			String Error = "You leave is already approved type : "+leave_type+" from date "+dt+" to "+dt2+"";
	    	request.setAttribute("Error", Error );
	    	RequestDispatcher rd = request.getRequestDispatcher("ApplyLeave.jsp");
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
