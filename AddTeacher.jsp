<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="TeacherManagement.jsp"></jsp:include>
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
   function validate(){
	   var firstname = document.forms["register"]["firstname"];
	   var regex = /^[a-zA-Z]+$/;
	   var lastname = document.forms["register"]["Lastname"];
	   var mobile = document.forms["register"]["mobile"];
	   var regexnum = /^[6-9][0-9]{9}/;
	   var regexaadar = /[0-9]{12}/;
	   var regexroll = /[0-9]{2}/;
	   var FatherName = document.forms["register"]["FatherName"];
	   var Designation = document.forms["register"]["Designation"];
	   var aadarno = document.forms["register"]["aadarno"];
	   var village = document.forms["register"]["village"];
	   var Rollno = document.forms["register"]["Rollno"];
	   
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
	   if(Designation.value.match(regex)){
		   //window.alert('done');
	   }
	   else{
		   window.alert('plz enter correct Designation');
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
   </script>
</head>
<body onload="visibilty()">
<div class="wrapper d-flex">
    <div class="contents">
   <h3 id="res" style="color:white;"><%=request.getAttribute("result")%></h3>
   <h3 style="text-align:center;">Add Teacher</h3>
   <form action = "${pageContext.servletContext.contextPath}/AddTeacher" method="GET" onSubmit="return validate()" name="register" class="formreg">
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
      <label for="FatherName">FatherName/Husband/Guardian</label>
      <input type="text" class="form-control" id="FatherName" name="FatherName" required>
    </div>
     <div class="form-group col-md-6">
      <label for="Designation">Designation</label>
      <input type="text" name="Designation" class="form-control" id="Designation" required>
    </div>
    </div>
       <div class="form-row">
    <div class="form-group col-md-6">
      <label for="dob">Date of join</label>
      <input type="text" class="form-control" id="dob" name="dob" placeholder="YYYY-MM-DD" pattern="^\d{4}\-(0[1-9]|1[012])\-(0[1-9]|[12][0-9]|3[01])$" title="Enter a date in this format YYYY/MM/DD" required>
    </div>
     <div class="form-group col-md-6">
      <label for="aadarno">Aadar Number</label>
      <input type="text" name="aadarno" class="form-control" id="aadarno" required>
    </div>
    </div>
     <div class="form-row">
    <div class="form-group col-md-6">
      <label for="mobile">Mobile Number</label>
      <input type="text" class="form-control" id="mobile" name="mobile" required>
    </div>
     <div class="form-group col-md-6">
      <label for="village">Village</label>
      <input type="text" name="village" class="form-control" id="village" required>
    </div>
    </div>
      <button type="submit" class="btn btn-primary">Register</button> 
   </form>
   </div>
   </div>
</body>
</html>