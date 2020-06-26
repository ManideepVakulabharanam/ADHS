<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="StudentMgmt.html"></jsp:include>
<script type="text/javascript">
   function validate(){
	   var firstname = document.forms["register"]["firstname"];
	   var lastname = document.forms["register"]["Lastname"];
	   var mobile = document.forms["register"]["mobile"];
	   var FatherName = document.forms["register"]["FatherName"];
	   var MotherName = document.forms["register"]["MotherName"];
	   var aadarno = document.forms["register"]["aadarno"];
	   var village = document.forms["register"]["village"];
	   var Rollno = document.forms["register"]["Rollno"];
	   var regex = /^[a-zA-Z]+$/;
	   var regexnum = /^[6-9][0-9]{9}/;
	   var regexaadar = /[0-9]{12}/;
	   var regexroll = /[0-9]{2}/;
	   //document.write(firstname.value);
	   if(firstname.value.match(regex)){
		   //window.alert('done');
	   }
	   else{
		   window.alert('plz enter correct name');
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
	   //${pageContext.servletContext.contextPath}/Register
   }
   
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
<%
   if(session.getAttribute("User")==(null)){
	   response.sendRedirect("SignIn.jsp");
   }
%>
<div class="wrapper d-flex">
<div class = "contents">
   <div class="forms">
   <h3 style="text-align:center;">Add Student</h3>
   <form action = "${pageContext.servletContext.contextPath}/Add" method="GET" onSubmit="return validate()" name="register" class="formreg">
    <div class="form-row">
    <div class="form-group col-md-6">
      <label>Select Class</label>
      <select id="class" class="form-control" name="class" class=".clsno" required>
        <option value="class_1"  id="class1" value="class_1">class_1</option>
       <option value="class_2"  id="class2" value="class_2">class_2</option>
       <option value="class_3"  id="class3" value="class_3">class_3</option>
       <option value="class_4"  id="class4" value="class_4">class_4</option>
       <option value="class_5"  id="class5" value="class_5">class_5</option>
       <option value="class_6"  id="class6" value="class_6">class_6</option>
       <option value="class_7"  id="class7" value="class_7">class_7</option>
       <option value="class_8"  id="class8" value="class_8">class_8</option>
       <option value="class_9"  id="class9" value="class_9">class_9</option>
       <option value="class_10"  id="class10" value="class_10">class_10</option>
      </select>
    </div>
     <div class="form-group col-md-6">
      <label for="RollNo">Roll No</label> <input type="text" name="Rollno" class="form-control" id="Rollno" required>
    </div>
    </div>
 <div class="form-row">
    <div class="form-group col-md-6">
      <label for="FirstName">First Name</label>
      <input type="text" class="form-control" id="firstname" name="firstname" required>
    </div>
     <div class="form-group col-md-6">
      <label for="LastName">Last Name</label>
      <input type="text" name="Lastname" class="form-control" id="Lastname" required>
    </div>
    </div>
     <div class="form-row">
    <div class="form-group col-md-6">
      <label for="FatherName">Father Name</label>
      <input type="text" class="form-control" id="FatherName" name="FatherName" required>
    </div>
     <div class="form-group col-md-6">
      <label for="Mother Name">Mother Name</label>
      <input type="text" name="MotherName" class="form-control" id="MotherName" required>
    </div>
    </div>
    <div class="form-row">
    <div class="form-group col-md-3">
      <label for="aadarno">Aadar Number</label>
      <input type="text" class="form-control" id="aadarno" name="aadarno" required>
    </div>
     <div class="form-group col-md-2">
      <label for="DOB">DOB</label>
      <input type="text" name="dob" class="form-control" id="dob" placeholder="YYYY-MM-DD" pattern="^\d{4}\-(0[1-9]|1[012])\-(0[1-9]|[12][0-9]|3[01])$" title="Enter a date in this format YYYY/MM/DD" required>
    </div>
      <div class="form-group col-md-3">
      <label for="MobileNumber">Mobile Number</label>
      <input type="tel" name="mobile" class="form-control" id="mobile" required>
    </div>
     <div class="form-group col-md-4">
      <label for="village">village</label>
      <input type="text" name="village" class="form-control" id="village"  value="Vemulawada" required>
    </div>
    </div>
      <button type="submit" class="btn btn-primary">Register</button> 
   </form>
   </div>
   <h5 id="res" style="color:green"><%=request.getAttribute("result")%></h5>
   </div>
   </div>
</body>
</html>