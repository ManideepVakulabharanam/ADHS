<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="StaffSalariesManagement.jsp"></jsp:include>
</head>
<body>
<div class="wrapper d-flex">
    <div class="contents">
 <form action = "GetStaffSalaries.jsp" method="GET" name="register" class="formreg">
      <div class="form-row">
    <div class="form-group col-md-6">
      <label for="FirstName">First Name</label>
      <input type="text" class="form-control" id="firstname" name="firstname" required>
    </div>
    </div>
    <button type="submit" class="btn btn-primary">Update</button> 
    </form>
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
<thead>
   <tr>
   <th scope="col">Name</th>
   <th scope="col">Jan</th>
   <th scope="col">Feb</th>
   <th scope="col">Mar</th>
   <th scope="col">Apr</th>
   <th scope="col">May</th>
   <th scope="col">Jun</th>
   <th scope="col">Jul</th>
   <th scope="col">Aug</th>
   <th scope="col">Sep</th>
   <th scope="col">Oct</th>
   <th scope="col">Nov</th>
   <th scope="col">Dec</th>
   </tr>
   </thead>
   <%
   try{
	   String FirstName = request.getParameter("firstname");
	   int id = 0;
	  String str = "select id from staff_details where Name = '"+FirstName+"' ";
	  ResultSet rst = st.executeQuery(str);
	  while(rst.next()){
		  id = rst.getInt(1);
	  }
	  System.out.println(id);
	  String sql = "select * from staff_salaries where id = "+id+";";
	   ResultSet rs = st.executeQuery(sql);
	   while(rs.next()){
		   %>
		   <tbody>
	   <tr>
	       <td><%= FirstName %></td>
	       <td><%=rs.getInt(2) %></td>
	       <td><%=rs.getInt(3) %></td>
	       <td><%=rs.getInt(4) %></td>
	       <td><%=rs.getInt(5) %></td>
	       <td><%=rs.getInt(6) %></td>
	       <td><%=rs.getInt(7) %></td>
	       <td><%=rs.getInt(8) %></td>
	       <td><%=rs.getInt(9) %></td>
	       <td><%=rs.getInt(10) %></td>
	       <td><%=rs.getInt(11) %></td>
	       <td><%=rs.getInt(12) %></td>
	       <td><%=rs.getInt(13) %></td>
		   </tr>
		   </tbody>
		   <%
	   }
	   con.close();
   }catch(Exception e){
	   e.printStackTrace();
   }
	   %>
   
</table>
</div>
</div>
</body>
</html>