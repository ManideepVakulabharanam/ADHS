<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="ExamIndex.jsp"></jsp:include>
<script type="text/javascript">
function visibilty(){
	var show = document.getElementById("show").innerHTML;
	   if(show == "null"){
		   document.getElementById("show").style.visibility = "hidden";
	   }
	   else{
		   document.getElementById("show").style.visibility = "visible";
	   }
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
  <h2>Enter student Details</h2><br>
   <form action="GetMarks.jsp" method="get">
   <div class="form-row">
    <div class="form-group col-md-4">
      <label for="">Select Class</label>
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
    </div >
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
    <button type="submit" class="btn btn-primary">View Student Details</button>
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
   <th scope="col">Exam Type</th>
   <th scope="col">Telugu</th>
   <th scope="col">Hindi</th>
   <th scope="col">English</th>
   <th scope="col">Maths</th>
   <th scope="col">Science</th>
   <th scope="col">Social</th>
   <th scope="col">Total</th>
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
	   if(exam_type.equals("allExams")){
		   String sql = "select * from "+class_name+"marks where student_rollno = "+rollno+";";
		   ResultSet rs = st.executeQuery(sql);
		   HttpSession sess = request.getSession(true);
		   sess.setAttribute("roll", rollno);
		   sess.setAttribute("cls", class_name);
		   while(rs.next()){
			   %>
			   <tbody>
		   <tr>
		       <td><%=rs.getInt(7) %></td>
		       <td><%=rs.getString(8) %></td>
			   <td name="rollno"><%=rs.getString(1) %></td>
			   <td><%=rs.getString(2) %></td>
			   <td><%=rs.getString(3) %></td>
			   <td><%=rs.getString(4) %></td>
			   <td><%=rs.getString(5) %></td>
			   <td><%=rs.getString(6) %></td>
			   <td><%=rs.getString(9) %></td>
			   </tr>
			   </tbody>
			   <%
		   }
	   }
	   else{
	  String sql = "select * from "+class_name+"marks where student_rollno = "+rollno+" AND Examtype = '"+exam_type+"';";
	   ResultSet rs = st.executeQuery(sql);
	   HttpSession sess = request.getSession(true);
	   sess.setAttribute("roll", rollno);
	   sess.setAttribute("cls", class_name);
	   while(rs.next()){
		   %>
	   <tr>
	       <td><%=rs.getInt(7) %></td>
	       <td><%=rs.getString(8) %></td>
		   <td name="rollno"><%=rs.getString(1) %></td>
		   <td><%=rs.getString(2) %></td>
		   <td><%=rs.getString(3) %></td>
		   <td><%=rs.getString(4) %></td>
		   <td><%=rs.getString(5) %></td>
		   <td><%=rs.getString(6) %></td>
		   <td><%=rs.getString(9) %></td>
		   </tr><%
	   }
	   
   }
	   }
	   con.close();
   }catch(Exception e){
	   e.printStackTrace();
   }
	   %>
   
</table>
 <h3 id="res" style="color:black;">${result}</h3>
 </div>
 </div>
</body>
</html>