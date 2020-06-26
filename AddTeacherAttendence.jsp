<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <%@page import="java.time.*" %>
        <%@page import="java.lang.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>
<%!Statement st = null; 
Connection con = null;
int count = 0;
%>
<%
HttpSession sess = request.getSession(true);
String cls = (String)sess.getAttribute("cls");
  try{
	  //DB connection
	  Class.forName("com.mysql.jdbc.Driver");
	  String url="jdbc:mysql://localhost:3306/adhs?characterEncoding=utf8&useSSL=false&useUnicode=true";
	  con = DriverManager.getConnection(url,"root","Mandy.143");
       if(con!=null){
    	   System.out.println("connected");
       }
       //timestamp is to get date and time
       java.sql.Timestamp timestamp = null;
       st = con.createStatement();
       int id = 0;
       //to get current date 
       long millis=System.currentTimeMillis();  
		java.sql.Date date=new java.sql.Date(millis);
		//update teacher_attendence today_present & absent as 0
		String updt = "update teacher_attendence set today_absent = 0, today_present = 0 where date_today < NOW() - INTERVAL 1 DAY;";
		st.executeUpdate(updt);
		//localDateTime is to get time at 11:00 clock 
		 LocalDateTime datetime1 = LocalDateTime.now().withHour(11).withMinute(0);  
		 //System.out.println(datetime1);
		 
		HttpSession http = request.getSession(true);
		String uname = (String) http.getAttribute("User");
		//get Login_date and id from teacherslogin
		String string = "select Login_date,id from teacher_login where Username = '"+uname+"';";
        ResultSet rs = st.executeQuery(string);
       
        while(rs.next()){
        	 timestamp = rs.getTimestamp(1);
        	//LocalDateTime datetime = LocalDateTime.
        	id = rs.getInt(2);
        }
        /*
         Below code is to check the casual leaves and sick leaves 
         Update leaves if he was logged in lately remove leaves based on his time
         if there are no leaves left the they will marked as absent.
        */
        String str = "select casual_leave from teacher_attendence where id = '"+id+"';";
        ResultSet rst = st.executeQuery(str);
        float cl =0;
        while(rst.next()){
        	cl = rst.getFloat(1);
        }
    	int b = datetime1.compareTo(timestamp.toLocalDateTime());
    	//long diff = ChronoUnit.HOURS.between(timestamp.toLocalDateTime(),datetime1);
    	Duration duration = Duration.between(datetime1,timestamp.toLocalDateTime());
    	
    	System.out.println(duration.toMinutes() +""+duration.toMinutes()/1440);
    	if(b>0){
    		System.out.println("datetime is greater");
    	}
    	else{
    		System.out.println("timestamp is greater");	
    		cl -= (float)  ((float)duration.toMinutes()/1440.00);
    		System.out.print(cl);
    		String stt = "update teacher_attendence set casual_leave = "+cl+";";
    		st.executeUpdate(stt);
    	}
        
     /*  int present = 0;
       int absent = 0;
    	   String stl = "select present,absent from teacher_attendence where Username = "+uname+";";
           ResultSet rss = st.executeQuery(stl);
          while(rss.next()){
        	present =  rss.getInt(1);
        	  absent =  rss.getInt(2);
          }
          System.out.println(present);
        	  absent++;
        	  present++;
           String up = "update attendence"+cls+" set absent = "+absent+", todayabsent = 1,date_today ='"+date+"'  where rollno = "+rollno+";";
           System.out.print(date);
           st.executeUpdate(up);     
    	   String sqll = "insert into mobile_number values ('"+rollno+"','"+name+"','"+mobile+"','"+cls+"','"+date+"');";
    	   count = st.executeUpdate(sqll);
       String uppresent = "update attendence"+cls+" set present = "+present+",todaypresent = 1 where todayabsent = 0;";
     int j =   st.executeUpdate(uppresent);
     String ret = "select date_today from attendence"+cls+" where rollno = "+rollno+";";
		ResultSet rr = st.executeQuery(ret);
		while(rr.next()){
			dates += rr.getDate(1);
			System.out.println(dates);
		}
		String updd = "update attendence"+cls+" set absenton = '"+dates+"' where rollno = "+rollno+"";*/
		/*int k = st.executeUpdate(updd);
       if(count > 0){
    	   request.setAttribute("result", "successfully added absenties");
			RequestDispatcher rd = request.getRequestDispatcher("StudentAttendence.jsp");
			rd.forward(request, response);
       } */
  }catch(Exception e){
	  e.printStackTrace();
  }
%>
</body>
</html>