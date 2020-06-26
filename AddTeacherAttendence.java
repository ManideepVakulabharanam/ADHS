

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.Duration;
import java.time.LocalDateTime;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AddTeacherAttendence
 */
@WebServlet("/AddTeacherAttendence")
public class AddTeacherAttendence extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddTeacherAttendence() {
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
		try{
			 //DB Connection here
			  Class.forName("com.mysql.jdbc.Driver");
			  String url="jdbc:mysql://localhost:3306/adhs?characterEncoding=utf8&useSSL=false&useUnicode=true";
			  con = DriverManager.getConnection(url,"root","Mandy.143");
		       if(con!=null){
		    	   System.out.println("connected");
		       }
		       //TimeStamp to insert into Database table teacher_attendence
		       java.sql.Timestamp timestamp = null;
		       Statement st = con.createStatement();
		       int id = 0;
		       int login_done = 0;//login_done from teacher_login
		       long millis=System.currentTimeMillis();  
				java.sql.Date date=new java.sql.Date(millis);//sql date to insert into tables
				//LocalDateTime to set Time for Login
				 LocalDateTime datetime1 = LocalDateTime.now().withHour(11).withMinute(0);  
				// System.out.println(datetime1);
				HttpSession http = request.getSession(true);
				String uname = (String) http.getAttribute("User");
				//selecting from Teacher_login from DB
				String string = "select Login_date,id,Login_done from teacher_login where Username = '"+uname+"';";
		        ResultSet rs = st.executeQuery(string);
		        while(rs.next()){
		        	timestamp = rs.getTimestamp(1);//timestamp is used here
		        	id = rs.getInt(2);
		        	login_done = rs.getInt(3);
		        }
		        //present and absent used for teacher_attendence table
		        int present = 0;
	            int absent = 0;
		        String stl = "select present,absent from teacher_attendence where id = "+id+";";
                ResultSet rss = st.executeQuery(stl);
               while(rss.next()){
             	present =  rss.getInt(1);
             	  absent =  rss.getInt(2);
               }
               System.out.println(present);
             	  absent++;
             	  present++;
		        if(login_done == 0){
		        	//when login_done is 0 that means Teacher didn't login till day end so mark him/his as Absent
		            	String up = "update teacher_attendence set absent = "+absent+", todayabsent = 1,date_today ='"+date+"'  where id = "+id+";";
	                    System.out.print(date);
	                    st.executeUpdate(up);   
	                    String insertintonotifi = "insert into notifications values('"+date+"','"+uname+"','Teacher Marked as Absent ');";
			     	    st.executeUpdate(insertintonotifi);
		        }
		        else if(login_done == 1){
		        	//when login_done is 1 that means Teacher Login in into system
		        	
		        	//Reseting absent/present in teacher_attendence when day is over
		        	String updt = "update teacher_attendence set today_absent = 0, today_present = 0 where date_today < NOW() - INTERVAL 1 DAY;";
					st.executeUpdate(updt);
					//selecting Casual_leave form table to make changes to it
		            String str = "select casual_leave from teacher_attendence where id = "+id+";";
		            ResultSet rst = st.executeQuery(str);
		        float casual_leave = 0;
		        while(rst.next()){
		        	casual_leave = rst.getFloat(1);
		        }
		        if(casual_leave == 0.0){
		        	//where casual_leave are not there mark as absent
		             	 String up = "update teacher_attendence set absent = "+absent+", todayabsent = 1,date_today ='"+date+"'  where id = "+id+";";
		                 System.out.print(date);
		                 st.executeUpdate(up);   
		                 String insertintonotifi = "insert into notifications values('"+date+"','"+uname+"','Teacher Marked as Absent ');";
				     	 st.executeUpdate(insertintonotifi);
		        }
		        else{
		        //if casual_leave are present then we can alter it based on login time
		        //Teacher should login before time set at LocalDateTime above other wise those hours are removed from casual_leave  	
		    	int difference_in_time = datetime1.compareTo(timestamp.toLocalDateTime());//datetime1 is declared above and timestamp data is taken from database above
		    	Duration duration = Duration.between(datetime1,timestamp.toLocalDateTime());//calculating time difference between what we set and what teacher loggedin
		    	
		    	System.out.println(duration.toMinutes() +""+duration.toMinutes()/1440);
		    	if(difference_in_time>0){
		    		//if teacher logged in ontime then Execute this marking as present
		    		String uppresent = "update teacher_attendence set present = "+present+",today_present = 1 where today_absent = 0;";
		             st.executeUpdate(uppresent);
		             String strng = "On TIME";
		             String stt = "update teacher_attendence set Leave_description = '"+strng+"' ;";//Enter On time in Leave_Description
		             st.executeUpdate(stt);
		             String insertintonotifi = "insert into notifications values('"+date+"','"+uname+"','Teacher Loggedin : "+strng+"');";//Notification table update
			     	 st.executeUpdate(insertintonotifi);
		    		System.out.println("datetime is greater");
		    		HttpSession https = request.getSession(true);
		    		https.setAttribute("id", id);
		    		request.setAttribute("User", uname);
		    		request.setAttribute("id", id);
					RequestDispatcher rd = request.getRequestDispatcher("TeachersDashboard.jsp");
					rd.forward(request, response);
		    	}
		    	else{
		    		//If teacher is late by some time execute this
		    		System.out.println("timestamp is greater");	
		    		casual_leave -= (float)  ((float)duration.toMinutes()/1440.00);
		    		if(casual_leave<0.0){
		    			//if casual_leave balance is less execute this code Mark as absent
		    			String up = "update teacher_attendence set absent = "+absent+", today_absent = 1,date_today ='"+date+"'  where id = "+id+";";
		                 System.out.print(date);
		                 st.executeUpdate(up);  
		                 String insertintonotifi = "insert into notifications values('"+date+"','"+uname+"','Teacher Marked as Absent ');";
				     	 st.executeUpdate(insertintonotifi);
		    			String Error = "You don't have balance CL you will be marked absent";
						request.setAttribute("Error", Error );
		    			RequestDispatcher rd = request.getRequestDispatcher("TechSign.jsp");
						rd.forward(request, response);
		    		}
		    		else{
		    			//if casual_leave balance is present then remove hours then mark as present
		    		String uppresent = "update teacher_attendence set present = "+present+",today_present = 1 where today_absent = 0 AND id="+id+";";
			        st.executeUpdate(uppresent);
		    		System.out.print(casual_leave);
		    		float time = (float)(duration.toMinutes()/60);
		    		String strng = "Late for Hours "+time+" on "+date;
		    		//After removing hours then update table with new casual_leave
		    		String stt = "update teacher_attendence set casual_leave = "+casual_leave+" , hours_late ="+duration.toMinutes()+", Leave_description = '"+strng+"' where id ="+id+";";
		    		//update when teacher got leaves decreased
		    		String for_history = "insert into teacher_absent_history values("+id+","+time+",'"+date+"',' ')";
		    		st.executeUpdate(stt);
		    		st.executeUpdate(for_history);
		    		//Notifying the updates
		    		String insertintonotifi = "insert into notifications values('"+date+"','"+uname+"','Teacher Loggedin lately by : "+time+" hours');";
			     	   st.executeUpdate(insertintonotifi);
		    		HttpSession https = request.getSession(true);
		    		https.setAttribute("id", id);
		    		request.setAttribute("User", uname);
		    		request.setAttribute("id", id);
					RequestDispatcher rd = request.getRequestDispatcher("TeachersDashboard.jsp");
					rd.forward(request, response);
		    		}
		    	}
		        }
		        }
		        else{
		        	HttpSession https = request.getSession(true);
		    		https.setAttribute("id", id);
		        	request.setAttribute("User", uname);
		    		request.setAttribute("id", id);
					RequestDispatcher rd = request.getRequestDispatcher("TeachersDashboard.jsp");
					rd.forward(request, response);
		        }
		        con.close();
	}catch(Exception e){
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
