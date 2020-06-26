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
<link rel="stylesheet" type="text/css" href="Style.css?version=51" >
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
	  function goBack(){
		  window.history.back();
	  }
  </script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark" style="background-color : #00695c;">
<button class="navbar-toggler sideMenuToggler" type="button">
    <span class="navbar-toggler-icon"></span>
  </button>
  <a class="navbar-brand" href="AdminDashboard.jsp">ADHS</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav ml-auto">
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Account
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Sign Out</a>
        </div>
      </li>
    </ul>
  </div>
</nav>

<div class="wrapper d-flex">
  <div class="sideMenu">
      <div class="sidebar ">
        <ul class="navbar-nav" id="accordionSidebar">
        <li class="nav-item ">
            <a class="nav-link active" href="#" onclick="goBack()" >
               <i class="material-icons icon">
               arrow_back
          </i>
              <span class="text"> Back</span>
            </a>
          </li>
           <li class="nav-item ">
            <a class="nav-link active" href="#" id="dashboard" >
               <i class="material-icons icon">
         dashboard
          </i>
              <span class="text"> Dashboard</span>
            </a>
          </li>
      <li class="nav-item">
          <a class="nav-link" href="ViewTeacherAttendence.jsp" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
            <i class="material-icons icon">
         person
          </i>
            <span class="text">View Attendance</span>
            </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="py-2 collapse-inner rounded" style="background-color :#00897b;text-align:center">
            <a class="nav-link collapse-item" href="TeacherLoginTimings.jsp"><i class="material-icons icon">
         timer
          </i><span  class="text">Teacher Timings</span></a><br>
            <a class="nav-link collapse-item" href="CheckLeaves.jsp"><i class="material-icons icon">
          
         view_comfy
          </i><span  class="text">Check Leaves</span></a>
          </div>
        </div>
     </li>
          <li class="nav-item ">
            <a class="nav-link" href="TeacherAbsentDetails.jsp" id="">
             <i class="material-icons icon">
         person_outline
          </i>
              <span class="text">Absent Details</span>
            </a>
          </li>
           <li class="nav-item sideMenuToggler text-center"><a href="#" class="nav-link"><i class="material-icons icon">
           keyboard_arrow_left
          </i><span class="text">
          </span></a></li>
</ul>
</div>
</div>
</div>
</body>
</html>