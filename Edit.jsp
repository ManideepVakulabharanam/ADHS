<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="StudentMgmt.html"></jsp:include>
<script>
function validate(){
	  var regex = /^[a-zA-Z]+$/;
	   var firstname = document.forms["register"]["firstname"];
	   var lastname = document.forms["register"]["Lastname"];
	   var FatherName = document.forms["register"]["FatherName"];
	   var MotherName = document.forms["register"]["MotherName"];
	   var mobile = document.forms["register"]["mobile"];
	   var regexnum = /^[6-9][0-9]{9}/;
	   var regexaadar = /[0-9]{12}/;
	   var Village = document.forms["register"]["Village"];
	   var aadarno = document.forms["register"]["aadarno"];
	   if(firstname.value.match(regex)){
		   //window.alert('done');
	   }
	   else{
		   window.alert('plz enter correct firstname');
		   return false;
	   }
	   if(lastname.value.match(regex)){
		   //window.alert('done lastname');
	   }
	   else{
		   window.alert('plz enter correct lastname');
		   return false;
	   }
	   if(FatherName.value.match(regex)){
		   //window.alert('done');
	   }
	   else{
		   window.alert('plz enter correct FatherName');
		   return false;
	   }
	   if(MotherName.value.match(regex)){
		   //window.alert('done');
	   }
	   else{
		   window.alert('plz enter correct MotherName');
		   return false;
	   }
	   if(aadarno.value.match(regexaadar)){
		   //window.alert('done email');
	   }
	   else{
		   window.alert('plz enter correct aadarno');
		   return false;
	   }
	   if(mobile.value.match(regexnum)){
		   //window.alert('done num');
	   }
	   else{
		   window.alert('plz enter correct number');
		   return false;
	   }
	   return true;
}
</script>
<style>
  table{
      width:100%;
      border:groove;
   }
   td{
    padding:10px;
   }
   button{
     background-color: rgb(0, 102, 255);
      border-radius : 5px; 
      
   }
</style>
</head>
<body>
<div class="wrapper d-flex">
  <div class="contents">
<%!int rollno = 0; 
String cls = null;
Statement st = null;
Connection con = null;
%>
<% HttpSession se = request.getSession(true);
  rollno = (Integer)se.getAttribute("roll");
  cls = (String)se.getAttribute("cls");
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
     String sql = "select * from "+cls+" where rollno = "+rollno+";";
     ResultSet set = st.executeQuery(sql);
     while(set.next()){
    	 %>
 <table class="table">
<form action="${pageContext.servletContext.contextPath}/Update" method="get" name="register" onSubmit="return validate()" class="formreg">
<div class="forms">
<div class="form-row">
    <div class="form-group col-md-6">
      <label for="FirstName">Class</label>
      <input type="text" class="form-control" id="cls" name="cls" value="<%=cls%>" readonly required>
    </div>
     <div class="form-group col-md-6">
      <label for="LastName">RollNo</label>
      <input type="text" name="Rollno" class="form-control" id="Rollno" value="<%=rollno%>" readonly required>
    </div>
    </div>
<div class="form-row">
    <div class="form-group col-md-6">
      <label for="FirstName">First Name</label>
      <input type="text" class="form-control" id="firstname" name="firstname" value="<%= set.getString(2)%>" required>
    </div>
     <div class="form-group col-md-6">
      <label for="LastName">Last Name</label>
      <input type="text" name="Lastname" class="form-control" id="Lastname" value="<%= set.getString(3) %>" required>
    </div>
    </div>
     <div class="form-row">
    <div class="form-group col-md-6">
      <label for="FatherName">Father Name</label>
      <input type="text" class="form-control" id="FatherName" value="<%= set.getString(4) %>" name="FatherName" required>
    </div>
     <div class="form-group col-md-6">
      <label for="Mother Name">Mother Name</label>
      <input type="text" name="MotherName" class="form-control" value="<%= set.getString(5) %>" id="MotherName" required>
    </div>
    </div>
    <div class="form-row">
    <div class="form-group col-md-3">
      <label for="aadarno">Aadar Number</label>
      <input type="text" class="form-control" id="aadarno" value="<%= set.getString(6) %>" name="aadarno" required>
    </div>
     <div class="form-group col-md-2">
      <label for="DOB">DOB</label>
      <input type="text" name="dob" class="form-control" value="<%= set.getString(7) %>"  id="dob" placeholder="YYYY-MM-DD" required>
    </div>
      <div class="form-group col-md-3">
      <label for="MobileNumber">Mobile Number</label>
      <input type="text" name="mobile" class="form-control" value="<%= set.getString(8) %>" id="mobile" required>
    </div>
     <div class="form-group col-md-4">
      <label for="village">village</label>
      <input type="text" name="village" class="form-control" value="<%= set.getString(9) %>" id="village"  value="Vemulawada" required>
    </div>
    </div>
      <button type="submit" class="btn btn-primary">Update</button> 
       </div>
   </form>
  
  </table>
  </div>
  </div>
<%}
   con.close();  }
catch(Exception e){
       e.printStackTrace();
     }%>
     </body>
     </html>