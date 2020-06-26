<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="TeacherManagement.jsp"></jsp:include>
<title>Insert title here</title>
<script type="text/javascript">
function visibilty(){
   var result = document.getElementById("res").innerHTML;
   if(result == "null"){
	   document.getElementById("res").style.visibility = "hidden";
   }
   else{
	   document.getElementById("res").style.visibility = "visible";
   }
}
</script>
</head>
<body onload="visibilty()">
<div class="wrapper d-flex">
    <div class="contents">
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
   <th scope="col">FirstName</th>
   <th scope="col">LastName</th>
   <th scope="col">FatherName</th>
   <th scope="col">Designation</th>
   <th scope="col">aadarNumber</th>
   <th scope="col">Date of join</th>
   <th scope="col">MobileNumber</th>
   <th scope="col">Village</th>
   </tr>
   </thead>
   <%
   try{
	  String sql = "select * from  teacher_details";
	   ResultSet rs = st.executeQuery(sql);
	   HttpSession sess = request.getSession(true);
	   while(rs.next()){
		   %>
		   <tbody>
	   <tr>
		   <td><%=rs.getString(2) %></td>
		   <td><%=rs.getString(3) %></td>
		   <td><%=rs.getString(4) %></td>
		   <td><%=rs.getString(5) %></td>
		   <td><%=rs.getString(6) %></td>
		   <td><%=rs.getString(7) %></td>
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
   
</table>
 <h3 id="res" style="color:black;"><%=request.getAttribute("result")%></h3>
 </div>
 </div>
</body>
</html>