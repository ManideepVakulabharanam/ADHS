<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="StudentSMSManagement.jsp"></jsp:include>
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

$(document).ready(function() {
    $("#sub").click(function(){
        var favorite = [];
        $.each($("input[name='attend']:checked"), function(){
            favorite.push($(this).val());
        });
        alert("My favourite sports are: " + favorite.join(", "));
        var det = JSON.stringify(favorite);
    });
});
</script>
</head>
<body onload="visibilty()">
<div class="wrapper d-flex">
<div class="contents">
  <h2>Enter student Details</h2><br>
  <form action="SelectedSms.jsp" method="get">
    <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputState">Select Class</label>
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
    </div>
    <button type="submit" class="btn btn-primary">View Student Details</button>
   </form>
   <br>
   <button class="btn btn-primary" onclick="window.location.href='SelectedPeople.jsp';" id="delete" >Selected People</button>
<%!Statement st = null; 
Connection con = null;
int count = 0;
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
       
  }catch(Exception e){
	  e.printStackTrace();
  }
%>
<form action="${pageContext.servletContext.contextPath}/AddSelected" method="get">
<table class="table">
<thead>
   <tr>
   <th scope="col">check</th>
   <th scope="col">RollNo</th>
   <th scope="col">FirstName</th>
   <th scope="col">LastName</th>
   <th scope="col">MobileNumber</th>
   </tr>
   </thead>
   <%
   String class_name = request.getParameter("class");
   try{
	  String sql = "select * from "+class_name+";";
	   ResultSet rs = st.executeQuery(sql);
	   HttpSession sess = request.getSession(true);
	   sess.setAttribute("cls", class_name);
	   while(rs.next()){
		   %>
		   <tbody>
	   <tr>
	       <td><input type="checkbox" name="attend" value="<%=rs.getString(8) %>"></td>
		   <td name="rollno"><%=rs.getInt(1) %></td>
		   <td><%=rs.getString(2) %></td>
		   <td><%=rs.getString(3) %></td>
		   <td><%=rs.getString(8) %></td>
		   </tr>
		   </tbody>
		   <%
	   }
	   con.close();
   }catch(Exception e){
	   e.printStackTrace();
   }
	   %>
   
</table>
<button type="submit" class="btn btn-primary" id="sub">Done</button>
</form>
 <h3 id="res" style="color:black;"><%=request.getAttribute("result")%></h3>
 </div>
 </div>
</body>
</html>