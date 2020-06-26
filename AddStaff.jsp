<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script src="//code.jquery.com/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<title>Register</title>
        <script>
            $(function () {
                $("#datepicker").datepicker();
            });
        </script>

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
	   var mobile = document.forms["register"]["mobile"];
	   var regexnum = /^[6-9][0-9]{9}/;
	   var regexaadar = /[0-9]{12}/;
	   var regexroll = /[0-9]{2}/;
	  
	   var Designation = document.forms["register"]["Designation"];
	  
	   var village = document.forms["register"]["village"];
	   
	   
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
   <div class="forms">
   <h3 id="res" style="color:white;"><%=request.getAttribute("result")%></h3>
   <h3 style="text-align:center;">Add Staff</h3>
   <form action = "${pageContext.servletContext.contextPath}/AddStaff" method="GET" onSubmit="return validate()" name="register" class="formreg">
     <div class="form-row">
    <div class="form-group col-md-6">
      <label for="FirstName">Name</label>
      <input type="text" class="form-control" id="firstname" name="firstname" required>
    </div>
     <div class="form-group col-md-6">
      <label for="Designation">Designation</label>
      <input type="text" name="Designation" class="form-control" id="Designation" required>
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
</body>
</html>