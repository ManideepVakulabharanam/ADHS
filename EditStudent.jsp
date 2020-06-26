<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="StudentMgmt.html"></jsp:include>
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
function enable(){
	 document.getElementById("delete").disabled = false;
	 document.getElementById("edit").disabled = false;
	 var show = document.getElementById("show").innerHTML;
	   if(show == "null"){
		   document.getElementById("show").style.visibility = "hidden";
	   }
	   else{
		   document.getElementById("show").style.visibility = "visible";
	   }
}
</script>
</head>
<body onload="visibilty()">
<div class="wrapper d-flex">
<div class="contents">
  <h2>Enter student Details</h2><br>
   <form action="EditStudent.jsp" method="get">
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
     <div class="form-group col-md-6">
      <label for="RollNo">Roll No</label>
      <input type="text" name="Rollno" class="form-control" id="Rollno" required>
    </div>
    </div>
   <button type="submit" class="btn btn-primary" onclick="enable()" aria-describedby="passwordHelpBlock">View Student Details</button>
   <small id="passwordHelpBlock" class="form-text text-muted">
     Double click to Enable Delete and Edit
   </form>
    
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
<table class="table">
<thead>
   <tr>
   <th scope="col">RollNo</th>
   <th scope="col">FirstName</th>
   <th scope="col">LastName</th>
   <th scope="col">FatherName</th>
   <th scope="col">MotherName</th>
   <th scope="col">aadarNumber</th>
   <th scope="col">DOB</th>
   <th scope="col">MobileNumber</th>
   <th scope="col">Village</th>
   </tr>
   </thead>
   <%
   int rollno = 0;
   if(request.getParameter("Rollno")!=null) {
	   rollno = Integer.parseInt(request.getParameter("Rollno")); 
   }
   System.out.println(rollno);
   String class_name = request.getParameter("class");
   try{
	   int x = 0;
	   String not = "notfound";
	   String stl  = "select rollno from "+class_name+" where rollno = "+rollno+";";
	   ResultSet rst = st.executeQuery(stl);
	   while(rst.next()){
		   x = rst.getInt(1);
	   }
	   if(x==0){
		   %>
		    <h3 id="show" style="color:black;"><%=not%></h3>
		   <% 
	   }
	   else{
	  String sql = "select * from "+class_name+" where rollno = "+rollno+";";
	   ResultSet rs = st.executeQuery(sql);
	   HttpSession sess = request.getSession(true);
	   sess.setAttribute("roll", rollno);
	   sess.setAttribute("cls", class_name);
	   while(rs.next()){
		   %>
		   <tbody>
	   <tr>
		   <td scope="row" name="rollno"><%=rs.getInt(1) %></td>
		   <td><%=rs.getString(2) %></td>
		   <td><%=rs.getString(3) %></td>
		   <td><%=rs.getString(4) %></td>
		   <td><%=rs.getString(5) %></td>
		   <td><%=rs.getString(6) %></td>
		   <td><%=rs.getString(7) %></td>
		   <td><%=rs.getString(8) %></td>
		   <td><%=rs.getString(9) %></td>
		   <td></td>
		   <td></td>
		   </tr>
		   </tbody>
		   <%
	   }
	   }
	   con.close();
   }
   catch(Exception e){
	   e.printStackTrace();
   }
	   %>
</table>
<button class="btn btn-primary" onclick="window.location.href='Delete';" id="delete" disabled>Delete</button>
<button class="btn btn-primary" onclick="window.location.href='Edit.jsp';" id="edit" disabled>Edit</button>
 <h3 id="res" style="color:black;"><%=request.getAttribute("result")%></h3>
 </div>
 </div>
</body>
</html>