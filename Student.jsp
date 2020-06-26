<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="//code.jquery.com/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style>
.sidebar{
z-index : 0;
 padding: 50px 0 0;
 background-color: 	#A52A2A;

}
a{
   color : #FFFFFF;
 font-size : .875rem;
}
#frame{
  margin-top : -20%;
}
</style>
</head>
<body>
    <nav class="navbar navbar-dark fixed-top shadow"  style="background-color:brown;">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav">
   <span class="navbar-toggler-icon"></span>
  </button>
  <a class="navbar-brand" href="AdminDashboard.jsp">Adarsha high school</a>
  <ul class="navbar-nav px-4">
     <li class="nav-item text-nowrap">
      <a class="nav-link" href="SingOut.jsp">Sign out</a>
  </li>
  </ul>
</nav>
<div class="container-fluid">
  <div class="row">
    <nav class="col-md-2 d-none d-md-block sidebar">
      <div class="sidebar-sticky collapse navbar-collapse" id="navbarNav">
        <ul class="nav flex-column">
          <li class="nav-item">
            <a class="nav-link active" href="StudentDashboard.jsp" target="AddStu">
              <span ></span>
              Dashboard <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="ViewDet.jsp" target="AddStu">
              <span></span>
              View Students
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="AddStudent.jsp" target="AddStu">
              
              Add Students
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="EditStudent.jsp" target="AddStu">
              <span></span>
              Edit Student
            </a>
          </li>
            <li class="nav-item">
            <a class="nav-link" href="StudentAttendence.jsp" target="AddStu">
              <span></span>
              Student Attendence
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="ExamIndex.jsp" target="AddStu">
              <span></span>
               Examination
            </a>
          </li>
           <li class="nav-item">
            <a class="nav-link" href="FeeDet.jsp" target="AddStu">
              <span></span>
               Fee Details
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="Sendsms.jsp" target="AddStu">
              <span></span>
               Send SMS
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="GetBonafied.jsp" target="AddStu">
              <span></span>
                Generate Bonafied
            </a>
          </li>
        </ul>
      </div>
    </nav>
   </div>
    <div class="text-right" id="frame">
    <iframe height="500px" width="83%" src="#" name="AddStu" class="col-md-15" style="border:none;float:right;"></iframe>
   </div> 
    </div>
    
</body>
</html>