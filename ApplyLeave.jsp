<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="TeachersDashboard.jsp"></jsp:include>
</head>
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
<body onload="visibilty()">
<div class="wrapper d-flex">
    <div class="contents">
  <form action="${pageContext.servletContext.contextPath}/Updateleave" method="get">
   <label><b>Select Date</b></label><br>
        <div class="form-row">
    <div class="form-group col-md-3">
         <label>Start Date</label>
         <input class="form-control" type="date" name="date" required>
    </div>
     <div class="form-group col-md-3">
         <label>End Date</label>
         <input class="form-control" type="date" name="date2" required>
    </div>
    <div class="form-group col-md-3">
     <label>Select Leave Type</label>
      <select id="leave" class="form-control" name="leave" required>
        <option   id="Casual_leave" value="casual_leave">Casual_leave</option>
       <option   id="Sick_leave" value="sick_leave">Sick_leave</option>
      </select>
    </div>
     <div class="form-group col-md-6">
         <label>Leave Reason</label>
         <input class="form-control" type="text" name="reason" required>
    </div>     
    </div>
    <button type="submit" class="btn btn-primary">Apply</button> 
  </form>
  <h3 id="res" style="color:black"><%=request.getAttribute("Error")%></h3>
  </div>
    
  </div>
</body>
</html>