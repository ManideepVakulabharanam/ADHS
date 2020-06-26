<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="java.time.format.*" %>
<%@page import="java.time.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="TeachersDashboard.jsp"></jsp:include>
</head>
<body>
<div class="wrapper d-flex">
    <div class="contents">
    <%  
    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
    LocalDateTime now = LocalDateTime.now();
    
    %>
    <span> <b>Leave Balance Report till Date : </b><%=dtf.format(now)%></span><br><br>
    <p>***You can avail these Leaves before 2021/04/01***</p>
 <%!Statement st = null; 
Connection con = null;
int count = 0;
%>
<%
  try{
	  HttpSession http = request.getSession(true);
	    int id = (int)	http.getAttribute("id");
	  Class.forName("com.mysql.jdbc.Driver");
	  String url="jdbc:mysql://localhost:3306/adhs?characterEncoding=utf8&useSSL=false&useUnicode=true";
	  con = DriverManager.getConnection(url,"root","Mandy.143");
       if(con!=null){
    	   System.out.println("connected");
       }
       st = con.createStatement();
       String str = "select * from teacher_attendence where id = "+id+";";
       ResultSet rs = st.executeQuery(str);
       %>
       <table class="table">
<thead>
   <tr>
   <th scope="col">Casual_leave</th>
   <th scope="col">Sick_leave</th>
   </tr>
  </thead>
       <%
       while(rs.next()){
    	   %>
    	    <tbody>
		   <tr>
			   <td><%=rs.getString(8) %></td>
			   <td><%=rs.getString(9) %></td>
			   </tr>
			   </tbody>
    	   <%
       }
       con.close();
  }catch(Exception e){
	  e.printStackTrace();
  }
%>
    </div>
    </div>
</body>
</html>