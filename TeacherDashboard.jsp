<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" ></script>
 <link href="StyleSheet.css" rel="stylesheet" type="text/css" media="only screen" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%!Statement st = null; 
Connection con = null;
int count = 0;
String str = null;
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
      str="select count(*) from teacher_details";
     ResultSet rs = st.executeQuery(str);
     while(rs.next()){
    	 count = rs.getInt(1);
     }
  }catch(Exception e){
	  e.printStackTrace();
  }
%>
<div class="card text-center" style="width: 18rem;">
  <div class="card-body">
    <h5 class="card-title">Total Teaching Staff</h5>
    <p class="card-text"><%=count%></p>
  </div>
</div>
</body>
</html>