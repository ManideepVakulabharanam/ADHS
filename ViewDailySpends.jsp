<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*" %>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="FinanceManagement.jsp"></jsp:include>
</head>
<body>
<div class="wrapper d-flex">
<div class="contents">
<form action="ViewDailySpends.jsp" method="get">
  <label><b>Select Date</b></label><br>
        <div class="form-row">
    <div class="form-group col-md-3">
         <input class="form-control" type="date" name="date" required>
    </div>
    </div>
    <button type="submit" class="btn btn-primary">Get</button> 
    </form>
    <br>
 <table class="table">
 <thead>
<tr>
   <th scope="col">Date</th>
   <th scope="col">Reason</th>
   <th scope="col">Money</th>
   </tr>
</thead>
    
<%!
Statement st = null; 
Connection con = null;
%>
<%
 try {
	 Class.forName("com.mysql.jdbc.Driver");
	  String url="jdbc:mysql://localhost:3306/adhs?characterEncoding=utf8&useSSL=false&useUnicode=true";
	  con = DriverManager.getConnection(url,"root","Mandy.143");
    	String strs = request.getParameter("date");
    	System.out.print(strs);
    	st = con.createStatement();
    	String str = " select * from daily_spends where  `Date` = '"+strs+"' ; ";
        ResultSet rs = st.executeQuery(str);
        if(rs.next() == false){
        	%>
        	 <h2>No Data found on date : <%= strs %></h2>
        	<%
        }else{
        while(rs.next()){%>
        <tbody>
        <tr>
        	<td><%= rs.getDate(1)%></td>
        	<td><%= rs.getString(2)%></td>
        	<td><%= rs.getString(3)%></td>
        	</tr>
        </tbody>
       
       <% }
        }
        con.close();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
%>
 </table>
</div>
</div>
</body>
</html>