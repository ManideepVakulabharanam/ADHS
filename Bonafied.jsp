<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%!Statement st = null; 
Connection con = null;
int count = 0;
%>
<%
//Below code is to generate bonafied certificate for students
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
<%
  String cls = request.getParameter("class");
  int roll = Integer.parseInt(request.getParameter("Rollno"));
  String sql = "select FirstName,LastName from "+cls+" where rollno = "+roll+";";
  ResultSet rs = st.executeQuery(sql);
  while(rs.next()){
%>
<body style="Text-align:center;">
  BONAFIDE CERTIFICATE<br />
<br />
Mr./Ms. <%= rs.getString(1) %> <%= rs.getString(2) %>
 is a bonafide <br />student of Adarsha high School studying<br />
 in __________________________ Class.<br />
<br />
Date: _____________________<br />
<br />
<br />
<br />
<br />
HeadMaster signature: __________________<br />
<br />
<br />
School Stamp
<%
  }
  con.close();
%>
<br>
<br>
<button onclick="window.print()">print</button>
</body>
</html>