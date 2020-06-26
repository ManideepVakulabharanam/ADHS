<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <%@page import="java.util.Date" %>
    <%@page import="java.util.Calendar" %>
    <%@page import="java.text.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<!-- This page is to add absenties which are selected by admin or teacher from jsp page Studentattendence -->
<%!Statement st = null; 
Connection con = null;
int count = 0;
%>
<%
//HttpSession for getting class & user from main Login page
HttpSession sess = request.getSession(true);
String cls = (String)sess.getAttribute("cls");
String user_name = (String)sess.getAttribute("User");
System.out.print(user_name);
  try{
	  //code for connection with database
	  Class.forName("com.mysql.jdbc.Driver");
	  String url="jdbc:mysql://localhost:3306/adhs?characterEncoding=utf8&useSSL=false&useUnicode=true";
	  con = DriverManager.getConnection(url,"root","Mandy.143");
       if(con!=null){
    	   System.out.println("connected");
       }
       st = con.createStatement();
       //millis is to get current date 
       long millis=System.currentTimeMillis();  
       //adding date to sql date
		java.sql.Date date=new java.sql.Date(millis);
		String dates= null;
 
 /*Date datee = Calendar.getInstance().getTime();  
 DateFormat dateFormat = new SimpleDateFormat("dd-mm-yyyy"); */
 
 //make today absent and present 0 before marking attendence
		String updt = "update attendence"+cls+" set todayabsent = 0, todaypresent = 0 where date_today < NOW() - INTERVAL 1 DAY;";
		st.executeUpdate(updt);
		//delete previous absenties data from table mobile_number for every day updating new absents list 
       String del = "delete from mobile_number where date_today < NOW() - INTERVAL 1 DAY;";
       st.executeUpdate(del);
       //get array of mobile numbers from Studentattendence.jsp
       String res[]  = request.getParameterValues("attend");
         
       int rollno = 0;
       String name = null;
       String mobile = null;
       int present = 0;
       int absent = 0;
       for(int i =0 ;i<res.length;i++){
    	   String sql = "select * from "+cls+" where MobileNumber = '"+res[i]+"';";
    	   ResultSet rs = st.executeQuery(sql);
    	   rs.next();
    		   rollno = rs.getInt(1);
    		   System.out.print(rollno);
    		   name = rs.getString(2);
    		   System.out.print(rollno);
    		  mobile = rs.getString(8);
    		  System.out.print(rollno);
    		  //select present,absent from attendence table from database to mark absent and present
    	   String stl = "select present,absent from attendence"+cls+" where rollno = "+rollno+";";
           ResultSet rss = st.executeQuery(stl);
          rss.next();
        	present =  rss.getInt(1);
        	  absent =  rss.getInt(2);
        	  
         // System.out.println(present);
         //increment absent present to add students data if he is absent add incremented absent to absent column similarly to present column
        	  absent++;
        	  present++;
        //Update attendence table of particular class if he/she is absent below code does that for absenties	  
           String up = "update attendence"+cls+" set absent = "+absent+", todayabsent = 1,date_today ='"+date+"'  where rollno = "+rollno+";";
           System.out.print(date);
           st.executeUpdate(up);     
           //and insert into to table mobile_number who are absent
    	   String sqll = "insert into mobile_number values ('"+rollno+"','"+name+"','"+mobile+"','"+cls+"','"+date+"');";
    	   count = st.executeUpdate(sqll);
       }
       // This code is to update present peoples table where absent is not zero
       String uppresent = "update attendence"+cls+" set present = "+present+",todaypresent = 1 where todayabsent = 0;";
     int j =   st.executeUpdate(uppresent);
     //select date from attendence and add it to column absenton to see Absent dates 
     String ret = "select date_today from attendence"+cls+" where rollno = "+rollno+";";
		ResultSet rr = st.executeQuery(ret);
		while(rr.next()){
			dates += rr.getDate(1);
			System.out.println(dates);
		}
		//code to update attendence table absenton column where rollno is condition
		String updd = "update attendence"+cls+" set absenton = '"+dates+"' where rollno = "+rollno+"";
		int k = st.executeUpdate(updd);
       if(count > 0){
    	   // update notifications table to add recent activities
    	   String string = "insert into notifications values('"+date+"','"+user_name+"','Changed attendence of class :"+cls+"');";
    	   st.executeUpdate(string);
    	   request.setAttribute("result", "successfully added absenties");
			RequestDispatcher rd = request.getRequestDispatcher("StudentAttendence.jsp");
			rd.forward(request, response);
       }
       con.close();
  }catch(Exception e){
	  e.printStackTrace();
  }
%>
</body>
</html>