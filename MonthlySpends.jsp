<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.util.*" %>
    <%@page import="java.sql.*" %>
    <%@page import="java.time.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="FinanceManagement.jsp"></jsp:include>
<script>
function myFunc(){
	var Electricity = document.getElementById("Electricity").value;
		   var petrol = document.getElementById("petrol").value;
		   var Vehicle = document.getElementById("Vehicle").value;
		   var Water = document.getElementById("Water").value;
		   var Rents = document.getElementById("Rents").value;
		   var tot = +Rents + +Water + +(Vehicle) + +(petrol) + +(Electricity);
	   document.getElementById("Total").value = tot;
}
</script>
</head>
<body>
<%!
Statement st = null; 
Connection con = null;
int sum_daily_spends = 0;
%>
<%
 try {
	 Class.forName("com.mysql.jdbc.Driver");
	  String url="jdbc:mysql://localhost:3306/adhs?characterEncoding=utf8&useSSL=false&useUnicode=true";
	  con = DriverManager.getConnection(url,"root","Mandy.143");
    	st = con.createStatement();
    	LocalDate date = LocalDate.now();
    	int month = date.getMonthValue();
    	System.out.print(month);
    	String str = "select sum(amount) from daily_spends where month(Date) = "+month+";";
    	ResultSet rs = st.executeQuery(str);
    	while(rs.next()){
    		sum_daily_spends = rs.getInt(1);
    	}
    	System.out.print(sum_daily_spends);
    	con.close();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
%>
<div class="wrapper d-flex">
<div class="contents">
  <h2>Enter for Montly Expenses only</h2>
  <form action="${pageContext.servletContext.contextPath}/MonthlySpends" method="get">
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="Electricity">Electricity</label>
      <input type="text" class="form-control" id="Electricity" name="Electricity" required>
    </div>
     <div class="form-group col-md-6">
      <label for="petrol">petrol</label>
      <input type="text" name="petrol" class="form-control" id="petrol" required>
    </div>
    </div>
     <div class="form-row">
    <div class="form-group col-md-6">
      <label for="Vehicle">Vehicle</label>
      <input type="text" class="form-control" id="Vehicle" name="Vehicle" required>
    </div>
     <div class="form-group col-md-6">
      <label for="Water">Water</label>
      <input type="text" name="Water" class="form-control" id="Water" required>
    </div>
    </div>
    <div class="form-row">
    <div class="form-group col-md-4">
     <label>Others</label>
     <input type="text" name="others" id="others" class="form-control" value="<%= sum_daily_spends%>" readonly><br>
     </div>
   <div class="form-group col-md-4">
     <label>Rents</label>
     <input type="text" name="Rents" id="Rents" class="form-control" onchange="myFunc()"><br>
     </div>
  <div class="form-group col-md-4">
   <label>Total</label>
     <input type="text" name="Total" class="form-control" id="Total" readonly><br>
     </div>
     </div>
     <button type="submit" class="btn btn-primary">Upload</button>
  </form>
   <h3 id="res" style="color:black;"><%=request.getAttribute("result")%></h3>
   </div>
   </div>
</body>
</html>