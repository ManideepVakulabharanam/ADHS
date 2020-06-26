<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="AdminDashboard.jsp"></jsp:include>
</head>
<body>
   <div class="wrapper d-flex">
    <div class="maincontent">
    <%
    if(session.getAttribute("User")==(null)){
 	   response.sendRedirect("SignIn.jsp");
 }
    response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
    
    response.setHeader("Pragma", "no-cache");
    
    response.setHeader("Expires","0");
    %>
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
       long millis=System.currentTimeMillis();  
		java.sql.Date date=new java.sql.Date(millis);
       String sql = "select * from notifications ORDER BY DATE(Date) DESC";
       ResultSet rs = st.executeQuery(sql);
       %><ul class="list-group"><%
       
       while(rs.next()){%>
    	  
  <li class="list-group-item list-group-item-info">
     <div><%= rs.getString(3) %><i class="float-right">modified date : <%= rs.getDate(1) %></i><br>
       <i><small class="subtitle-side-elements" style="color:rgba(0,0,0,.5);">Modified By : <%= rs.getString(2)%></small></i>
     </div>
  </li>
  

    	 <%
       }
  }catch(Exception e){
	  e.printStackTrace();
  }
%>
    </ul>
    </div>
    </div>
</body>
</html>