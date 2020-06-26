<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="TeacherAttendenceManagement.jsp"></jsp:include>
</head>
<body>
   <div class="wrapper d-flex">
    <div class="contents">
 <%!Statement st = null; 
Connection con = null;
int count = 0;
%>
<%
  try{

       int id =Integer.parseInt(request.getParameter("id"));
	  Class.forName("com.mysql.jdbc.Driver");
	  String url="jdbc:mysql://localhost:3306/adhs?characterEncoding=utf8&useSSL=false&useUnicode=true";
	  con = DriverManager.getConnection(url,"root","Mandy.143");
       if(con!=null){
    	   System.out.println("connected");
       }
       st = con.createStatement();
       String str = "select * from teacher_leave_details where id="+id+";";
       ResultSet rs = st.executeQuery(str);
       %>
       <table class="table">
<thead>
   <tr>
   <th scope="col">ID</th>
   <th scope="col">Leave_Type</th>
   <th scope="col">StartDate</th>
   <th scope="col">EndDate</th>
   <th scope="col">Leave Description</th>
   </tr>
  </thead>
       <%
       while(rs.next()){
    	   %>
    	    <tbody>
		   <tr>
			   <td><%=rs.getString(1) %></td>
			   <td><%=rs.getString(5) %></td>
			   <td><%=rs.getString(2) %></td>
			   <td><%=rs.getString(3) %></td>
			   <td><%=rs.getString(4) %></td>
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