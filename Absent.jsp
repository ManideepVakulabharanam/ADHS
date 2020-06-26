<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="StudentAttendenceManagement.jsp"></jsp:include>
</head>
<body>
<div class="wrapper d-flex">
<div class="contents">
<!-- This page is to check absent people from every class -->
<%!Statement st = null; 
Connection con = null;
int count = 0;
%>
<%
  try{
	  Class.forName("com.mysql.jdbc.Driver");
	  String url="jdbc:mysql://localhost:3306/adhs?characterEncoding=utf8&useSSL=false&useUnicode=true";
	  con = DriverManager.getConnection(url,"root","Mandy.143");
       if(con!=null){
    	   System.out.println("connected");
       }
       st = con.createStatement();
       
  }catch(Exception e){
	  e.printStackTrace();
  }
%>
<table class="table">
   <tr>
   <th>RollNo</th>
   <th>FirstName</th>
   <th>MobileNumber</th>
   </tr>
   <%
   //here we are retrieving data from mobile_number table from database
   try{
	  String sql = "select * from mobile_number;";
	   ResultSet rs = st.executeQuery(sql);
	   while(rs.next()){
		   %>
	   <tr>
		   <td><%=rs.getInt(1) %></td>
		   <td><%=rs.getString(2) %></td>
		   <td><%=rs.getString(3) %></td>
		   </tr><%
	   }
	   
   }catch(Exception e){
	   e.printStackTrace();
   }
	   %>
   
</table>
</div>
</div>
</body>
</html>