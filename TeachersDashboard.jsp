<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="//code.jquery.com/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script  src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
<link rel="stylesheet" type="text/css" href="AdminStyle.css?version=51" >
<title>ADHS</title>
<script type="text/javascript">
$(document).ready(function(){
	 $(".sideMenuToggler").on("click", function(){
		 $(".wrapper").toggleClass("active");
	 })
 });
$(document).ready(function(){
	  $(".sideMenuToggler").on("click", function(){
		  $(".sideMenuToggler").toggleClass('flip');
		 })
	  });

</script>

</head>
<body>
<%
if(session.getAttribute("User")==(null)){
	   response.sendRedirect("TechSign.jsp");
}
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");

response.setHeader("Pragma", "no-cache");

response.setHeader("Expires","0");
%>
<nav class="navbar navbar-expand-lg navbar-dark fixed-top" style="background-color:#00695c">
 <div class="container-fluid" >
 <button class="navbar-toggler sideMenuToggler" type="button">
    <span class="navbar-toggler-icon"></span>
  </button>
<% 
String usr = (String)session.getAttribute("User");
%>
<%
String user = (String) request.getAttribute("User"); %>
  <a class="navbar-brand mb-02 h2" href="#">Welcome <%= usr %></a> 
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav">
   <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse flex-grow-1 text-right" id="navbarNav">
  <ul class="navbar-nav ml-auto flex-nowrap">
   <li class="nav-item">
  <a class="nav-link" href="SingOut.jsp">Sign Out</a>
  </li>
  </ul>
  </div>
  </div>
  </nav>
    <div class="wrapper d-flex">
  <div class="sideMenu">
      <div class="sidebar">
        <ul class="navbar-nav">
         <li class="nav-item ">
            <a class="nav-link active" href="" id="dashboard" >
               <i class="material-icons icon">
         dashboard
          </i>
              <span class="text">Dashboard</span>
            </a>
          </li>
           <hr class="divide-side-elements">
           <div class="subtitle-side-elements">
              PEOPLE
           </div>
           
      <li class="nav-item ">
            <a class="nav-link active" href="Studentindex_teacher.jsp" id="" >
               <i class="material-icons icon">
         people
          </i>
              <span class="text"> Students</span>
            </a>
          </li>
           <hr class="divide-side-elements">
           <div class="subtitle-side-elements">
              MY PROFILE
           </div>
           
      <li class="nav-item ">
            <a class="nav-link active" href="ViewTeacherProfile.jsp" id="" >
               <i class="material-icons icon">
         person
          </i>
              <span class="text"> Profile</span>
            </a>
          </li>
           <hr class="divide-side-elements">
           <div class="subtitle-side-elements">
              Leave Details
           </div>
          <li class="nav-item ">
            <a class="nav-link active" href="ApplyLeave.jsp" id="" >
               <i class="material-icons icon">
         person
          </i>
              <span class="text">Apply Leave</span>
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link active" href="CheckLeaves_teacher.jsp" id="" >
               <i class="material-icons icon">
         person
          </i>
              <span class="text">View Leaves</span>
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link active" href="TeacherLeavehistory.jsp" id="" >
               <i class="material-icons icon">
         person
          </i>
              <span class="text">Leave History</span>
            </a>
          </li>
          <hr class="divide-side-elements">
           <div class="subtitle-side-elements">
              SMS Details
           </div>
            <li class="nav-item sideMenuToggler text-center"><a href="#" class="nav-link"><i class="material-icons icon" style="margin-left:-40px">
           keyboard_arrow_left
          </i><span class="text">
          </span></a></li>
               
 </ul>
 </div>
 </div>
  <div class="contents">
        Hello
    </div>
 </div>

</body>
</html>