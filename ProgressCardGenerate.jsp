<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="sytlesheet" href="ProgressCard.css">
<title>Insert title here</title>
<style type="text/css">
  header{
	text-align : center;
}
.disp{
  width : 50%;
    margin-left: auto;
        margin-right: auto;
}
.table{
   width : 90%;
}
.table th{
 text-align : center;
}
.table td{
 text-align : center;
}
.row{
text-align : center;
}
</style>
<script>
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
<!-- Header details -->
<div class="disp">
<header>
  <h3>Adarsha High School</h3>
  <small>Vemulawada</small>
</header>
<div>
  <table class="table table-bordered">
     <thead>
       <tr>
         <th>Language</th>
         <th>Marks</th>
       </tr>
     </thead>
     <%
     int rollno = 0;
     if(request.getParameter("Rollno")!=null) {
  	   rollno = Integer.parseInt(request.getParameter("Rollno")); 
     }
     System.out.println(rollno);
     String exam_type = request.getParameter("Exam");
     String class_name = request.getParameter("class");
     try{
  	   int x = 0;
  	   String firstname = null;
  	   String lastname = null;
  	   String not = "notfound";
  	   String stl  = "select rollno,FirstName,LastName from "+class_name+" where rollno = "+rollno+";";
  	   ResultSet rst = st.executeQuery(stl);
  	   while(rst.next()){
  		   x = rst.getInt(1);
  		   firstname = rst.getString(2);
  		   lastname = rst.getString(3);
  	   }
  	   if(x==0){
  		  
  	   }
  	   else{ %>
  	   <div style="text-align : center; width:80%">
  		   <div class="row">
  		      <div class="col-md-8">
  		        <h4>Name</h4>
  		      </div>
  		       <div class="col-md-4">
  		        <%=firstname%><%=lastname%>
  		      </div>
  		   </div>
  		   <div class="row">
  		      <div class="col-md-8">
  		        <h4>Class</h4>
  		      </div>
  		       <div class="col-md-4">
  		        <%=class_name%>
  		      </div>
  		   </div>
  		   <div class="row">
  		      <div class="col-md-8">
  		        <h4>RollNo</h4>
  		      </div>
  		       <div class="col-md-4">
  		        <%=rollno%>
  		      </div>
  		   </div>
  		  </div> 
  		  <% String sql = "select * from "+class_name+"marks where student_rollno = "+rollno+"  AND Examtype = '"+exam_type+"';";
  		   ResultSet rs = st.executeQuery(sql);
  		   while(rs.next()){
     %>
     <!--  <tr>
          <td>Name</td>
          <td><%=firstname%><%=lastname%></td>
       </tr>
       <tr>
          <td>Class</td>
          <td><%=class_name%></td>
       </tr>
       <tr>
          <td>RollNo</td>
          <td><%=rollno%></td>
       </tr> -->
     <tbody>
       <tr>
          <td>Telugu</td>
          <td><%=rs.getString(1)%></td>
       </tr>
       <tr>
          <td>Hindi</td>
          <td><%=rs.getString(2)%></td>
       </tr>
       <tr>
          <td>English</td>
          <td><%=rs.getString(3)%></td>
       </tr>
       <tr>
          <td>Maths</td>
          <td><%=rs.getString(4)%></td>
       </tr>
       <tr>
          <td>Science</td>
          <td><%=rs.getString(5)%></td>
       </tr>
       <tr>
          <td>Social</td>
          <td><%=rs.getString(6)%></td>
       </tr>
         <tr>
          <td> <b>Total</b></td>
          <td><b><%=rs.getString(9)%></b></td>
       </tr>
       </tbody>
       <%
	   }
	 }
	   con.close();
   }catch(Exception e){
	   e.printStackTrace();
   }
	   %>
  </table>
</div>
<br />
<br />
<br />
<br />
 <div class="row"s>
   <div  class="col-md-3">Teacher Sign</div>
   <div  class="col-md-3">Principal Sign</div>
   <div  class="col-md-3">Parent Sign</div>
   <div  class="col-md-3">School Stamp</div>
 </div>
<br />
    <button  class="btn btn-success" onclick="window.print()">Print</button>
</div>
</body>
</html>