<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.util.*" %>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="FinanceManagement.jsp"></jsp:include>
</head>
<body>
<div class="wrapper d-flex">
<div class="contents">
<form action="MonthlyRevenue.jsp" method="get">
<div class="form-group col-md-3">
    <label>Select Duration</label><select name="Month" class="form-control" class=".clsno" required>
       <option  id="January" value="1">This Month</option>
       <option  id="Febraury" value="3">Last Three Months</option>
       <option  id="March" value="6">Last Six Months</option>
          </select>
    </div>
    <button type="submit" class="btn btn-primary">Get</button> 
    </form>
    <br>
    <table class="table">
      <thead>
<tr>
   <th scope="col">Date</th>
   <th scope="col">Electricity</th>
   <th scope="col">Petrol</th>
   <th scope="col">Vehicle</th>
   <th scope="col">Water</th>
   <th scope="col">Rents</th>
   <th scope="col">Total</th>
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
    	if(con.equals(null)){
    		
    	}else{
    		 System.out.print("done");
    	}
    	String strs = request.getParameter("Month");
    	st = con.createStatement();
    	String str = " select * from monthlyspends where  `Date` >= DATE_SUB(CURDATE(), INTERVAL "+strs+" MONTH) ";
        ResultSet rs = st.executeQuery(str);
        while(rs.next()){%>
        <tbody>
        <tr>
        	<td><%= rs.getString(1)%></td>
        	<td><%= rs.getString(2)%></td>
        	<td><%= rs.getString(3)%></td>
        	<td><%= rs.getString(4)%></td>
        	<td><%= rs.getString(5)%></td>
        	<td><%= rs.getString(6)%></td>
        	<td><%= rs.getString(7)%></td>
        	</tr>
        </tbody>
        </table>
       <% }
        con.close();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
%>
</div>
</div>
</body>
</html>