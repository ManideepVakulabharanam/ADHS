<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="StaffSalariesManagement.jsp"></jsp:include>
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
   <h3 id="res" style="color:white;"><%=request.getAttribute("result")%></h3>
   <h1 style="text-align:center;">Add Salaries</h1>
   <form action = "${pageContext.servletContext.contextPath}/UpdateStaffSalaries" method="GET" name="register" class="formreg">
      <div class="form-row">
    <div class="form-group col-md-6">
      <label for="FirstName">Name</label>
      <input type="text" class="form-control" id="firstname" name="firstname" required>
    </div>
    </div>
    <div class="form-row">
    <div class="form-group col-md-3">
    <label>Select Month</label><select name="Month" class="form-control" class=".clsno" required>
       <option  id="January" value="January">January</option>
       <option  id="Febraury" value="Febraury">Febraury</option>
       <option  id="March" value="March">March</option>
       <option  id="April" value="April">April</option>
       <option  id="May" value="May">May</option>
       <option  id="June" value="June">June</option>
       <option  id="July" value="July">July</option>
       <option  id="August" value="August">August</option>
       <option  id="September" value="September">September</option>
       <option  id="October" value="October">October</option>
       <option  id="November" value="November">November</option>
       <option  id="December" value="December">December</option>
          </select>
    </div>
    <div class="form-group col-md-3s">
      <label>Amount</label><input type="text" class="form-control" name="salary" required>
          </div>
    </div>
      <button type="submit" class="btn btn-primary">Add</button> 
   </form>
   
   <h3 id="res" style="color:black;"><%=request.getAttribute("result")%></h3>
   </div>
   </div>
</body>
</html>