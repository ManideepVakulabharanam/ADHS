<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.util.*" %>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="//code.jquery.com/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<%!
int total = 0;
int total2 = 0;
int total3 = 0;
int total4 = 0;
int sum = 0;
int totex = 0;
Statement st = null; 
Connection con = null;
%>
<%
 try {
	
	 Class.forName("com.mysql.jdbc.Driver");
	  String url="jdbc:mysql://localhost:3306/adhs?characterEncoding=utf8&useSSL=false&useUnicode=true";
	  con = DriverManager.getConnection(url,"root","Mandy.143");
    	if(con.equals(null)){
    		
    	}else{
    		 System.out.print("done");
    	}
    	
    	for(int i =1;i<11;i++){
    		int x = 0;
    		int y = 0;
    		int v = 0;
    		int j = 0;
    	String sql = "select Term1,Term2,Term3,Term4 from fee_detailsclass_"+i+";";
    	 st = con.createStatement();
    	ResultSet rs = st.executeQuery(sql);
    	while(rs.next()){
    		x += rs.getInt(1);
    		y += rs.getInt(2);
    		v += rs.getInt(3);
    		j += rs.getInt(4);
    	}
    	System.out.println(x+" "+y+" "+v+" "+j);
    	total += x;
    	total2 += y;
    	total3 += v;
    	total4 += j;
    	}
    	sum = total + total2 + total3 + total4;
    	String str = "select Total from monthlyspends;";
    	ResultSet rst = st.executeQuery(str);
    	int p = 0;
    	while(rst.next()){
    		p = rst.getInt(1);
    	}
    	totex += p;
    	System.out.println(p+""+totex);
    	con.close();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
%>
<h1>Total Income</h1>
<table class="table">
<thead>
<tr>
   <th scope="col">Term 1 income</th>
   <th scope="col">Term 2 income</th>
   <th scope="col">Term 3 income</th>
   <th scope="col">Term 4 income</th>
   <th scope="col">Total</th>
   </tr>
</thead>
<tbody>
  <tr>
     <td><%= total %></td>
     <td><%= total2 %></td>
     <td><%= total3 %></td>
     <td><%= total4 %></td>
     <td><%= sum %></td>
  </tr>
</tbody>
</table>
</body>
</html>