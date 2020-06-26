<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="ExamIndex.jsp"></jsp:include>
</head>
<body>
<script type="text/javascript">
var tot = 0;
var prev = 0;
var ini = 0;
function myFunc(){
	       var Telugu = document.getElementById("Telugu").value;
		   var Hindi = document.getElementById("Hindi").value;
		   var English = document.getElementById("English").value;
		   var Science = document.getElementById("Science").value;
		   var Maths = document.getElementById("Maths").value;
		   var Social = document.getElementById("Social").value;
		   var tot = +Telugu + +Hindi + +(English) + +(Science) + +(Maths) + +(Social);
	       document.getElementById("Total").value = tot;
	    if(Telugu < 35){
	    	 document.getElementById("Tel").innerHTML = "Fail";
	    }
	    else{
	    	 document.getElementById("Tel").innerHTML = "Pass";
	    }
	    if(Hindi < 35){
	    	 document.getElementById("Hin").innerHTML = "Fail";
	    }
	    else{
	    	 document.getElementById("Hin").innerHTML = "Pass";
	    }
	    if(English < 35){
	    	 document.getElementById("Eng").innerHTML = "Fail";
	    }
	    else{
	    	 document.getElementById("Eng").innerHTML = "Pass";
	    }
	    if(Maths < 35){
	    	 document.getElementById("Mat").innerHTML = "Fail";
	    }
	    else{
	    	 document.getElementById("Mat").innerHTML = "Pass";
	    }
	    if(Science < 35){
	    	 document.getElementById("Sci").innerHTML = "Fail";
	    }
	    else{
	    	 document.getElementById("Sci").innerHTML = "Pass";
	    }
	    if(Social < 35){
	    	 document.getElementById("Soc").innerHTML = "Fail";
	    }
	    else{
	    	 document.getElementById("Soc").innerHTML = "Pass";
	    }
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
   function validate(){
	   var Telugu = document.forms["register"]["Telugu"];
	   var regex = /[0-9]{1,3}/;
	   var Hindi = document.forms["register"]["Hindi"];
	   var English = document.forms["register"]["English"];
	   var regexnum = /^[6-9][0-9]{9}/;
	   var regexaadar = /[0-9]{12}/;
	   var regexroll = /[0-9]{1,2}/;
	   var Science = document.forms["register"]["Science"];
	   var Maths = document.forms["register"]["Maths"];
	   var Social = document.forms["register"]["Social"];
	   var Rollno = document.forms["register"]["Rollno"];
	   
	    
	   if(Telugu.value.match(regex) && (Telugu.value >= 0 && Telugu.value < 101 ) ){
		   //window.alert('done');
	   }
	   else{
		   window.alert('plz enter correct Telugu Marks');
		   return false;
	   }
	   if(Hindi.value.match(regex) && (Hindi.value >= 0 && Hindi.value < 101 )){
		   //window.alert('done lastname');
	   }
	   else{
		   window.alert('plz enter correct Hindi Marks');
		   return false;
	   }
	   if(English.value.match(regex) && (English.value >= 0 && English.value < 101 )){
		   //window.alert('done');
	   }
	   else{
		   window.alert('plz enter correct English Marks');
		   return false;
	   }
	   if(Maths.value.match(regex) && (Maths.value >= 0 && Maths.value < 101 ) ){
		   //window.alert('done');
	   }
	   else{
		   window.alert('plz enter correct Maths Marks');
		   return false;
	   }
	   if(Science.value.match(regex) && (Science.value >= 0 && Science.value < 101 )){
		   //window.alert('done email');
	   }
	   else{
		   window.alert('plz enter correct Science Marks');
		   return false;
	   }
	   if(Social.value.match(regex) && (Social.value >= 0 && Social.value < 101 )) {
		   //window.alert('done num');
	   }
	   else{
		   window.alert('plz enter correct Social Marks');
		   return false;
	   }
	   if(Rollno.value.match(regexroll)){
		   //window.alert('done num');
	   }
	   else{
		   window.alert('plz enter correct Rollno');
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
   <div class="forms">
   <h3 id="res" style="color:white;"><%=request.getAttribute("result")%></h3>
   <h1>Add Exam</h1>
   <form action = "${pageContext.servletContext.contextPath}/UpdateMarks" method="GET" onSubmit="return validate()" name="register" class="formreg">
    
     <div class="form-row">
    <div class="form-group col-md-4">
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
    <div class="form-group col-md-4">
    <label>Select Exam Type</label><select name="Exam" class="form-control" class=".clsno">
       <option value="SA1"  id="SA1" value="SA1">SA1</option>
       <option value="SA2"  id="SA2" value="SA2">SA2</option>
       <option value="FA1"  id="FA1" value="FA1">FA1</option>
       <option value="FA2"  id="FA2" value="FA2">FA2</option>
       <option value="FA3"  id="FA3" value="FA3">FA3</option>
       <option value="FA4"  id="FA4" value="FA4">FA4</option>
          </select>
    </div>
     <div class="form-group col-md-4">
      <label for="RollNo">Roll No</label>
      <input type="text" name="Rollno" class="form-control" id="Rollno" required>
    </div>
    </div>
      <div class="form-row">
    <div class="form-group col-md-6">
      <label for="Telugu">Telugu</label>
      <input type="text" class="form-control" id="Telugu" name="Telugu" required>
    </div>
     <div class="form-group col-md-6">
      <label for="Hindi">Hindi</label>
      <input type="text" name="Hindi" class="form-control" id="Hindi" required>
    </div>
    </div>
    <div class="form-row">
    <div class="form-group col-md-6">
      <label for="English">English</label>
      <input type="text" class="form-control" id="English" name="English" required>
    </div>
     <div class="form-group col-md-6">
      <label for="Maths">Maths</label>
      <input type="text" name="Maths" class="form-control" id="Maths" required>
    </div>
    </div>
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="Science">Science</label>
      <input type="text" class="form-control" id="Science" name="Science" required>
    </div>
     <div class="form-group col-md-6">
      <label for="Social">Social</label>
      <input type="text" name="Social" class="form-control" id="Social" onchange="myFunc()" required>
    </div>
    </div>
    <div class="form-group col-md-4">
      <label for="Total">Total</label>
      <input type="text" name="Total" class="form-control" id="Total" required>
    </div>
     
      <button type="submit" class="btn btn-primary">Update</button> 
   </form>
   </div>
   <h3 id="res" style="color:black;"><%=request.getAttribute("result")%></h3>
   </div>
   </div>
</body>
</html>