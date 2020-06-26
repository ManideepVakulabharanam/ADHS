<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="FeeIndex.jsp"></jsp:include>
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
</script>
</head>
<body onload="visibilty()">
<div class="wrapper d-flex">
    <div class="contents">
   <div class="forms">
   <h3 id="res" style="color:white;"><%=request.getAttribute("result")%></h3>
   <h1 style="text-align:center;">Add Student</h1>
   <form action = "${pageContext.servletContext.contextPath}/UpdateFees" method="GET" name="register" class="formreg">
   <div class="form-row">
    <div class="form-group col-md-3">
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
    <div class="form-group col-md-3">
    <label>Select Fee</label><select name="Term" class="form-control" class=".clsno">
       <option  id="Term1" value="Term1">Term1</option>
       <option  id="Term2" value="Term2">Term2</option>
       <option  id="Term3" value="Term3">Term3</option>
       <option  id="Term4" value="Term4">Term4</option>
          </select>
    </div>
     <div class="form-group col-md-3">
      <label for="RollNo">Roll No</label>
      <input type="text" name="Rollno" class="form-control" id="Rollno" required>
    </div>
    <div class="form-group col-md-3s">
      <label>Amount</label><input type="text" class="form-control" name="fee">
          </div>
    </div>
      <button type="submit" class="btn btn-primary">Update</button> 
   </form>
   </div>
   <h3 id="res" style="color:black;"><%=request.getAttribute("result")%></h3>
   </div>
   </div>
</body>
</html>