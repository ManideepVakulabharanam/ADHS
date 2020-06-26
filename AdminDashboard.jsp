<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
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
<script src="https://cdn.jsdelivr.net/npm/js-cookie@2.2.1/src/js.cookie.min.js"></script>
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
	  
	  
/*$(document).ready(function(){
	  $(".notification").on("click", function(){
		  Cookies.set('count', 'true');
		  $("#count").remove();
		 })
	  });
$(document).ready(function(){
    if (Cookies.get('count') == 'true' && Cookies.get('count') != 'undefined' ){
        $("#count").hide();
        } else {
            $("#count").show();
        }
        });*/

</script>
</head>
<body>
<%!Statement st = null; 
Connection con = null;
int count = 0;
%>
<%
   if(session.getAttribute("User")==(null)){
	   response.sendRedirect("SignIn.jsp");
   }
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");

response.setHeader("Pragma", "no-cache");

response.setHeader("Expires","0");
  try{
	  Class.forName("com.mysql.jdbc.Driver");
	  String url="jdbc:mysql://localhost:3306/adhs?characterEncoding=utf8&useSSL=false&useUnicode=true";
	  con = DriverManager.getConnection(url,"root","Mandy.143");
       if(con!=null){
    	   System.out.println("connected");
       }
       st = con.createStatement();
       long millis=System.currentTimeMillis();  
		java.sql.Date date=new java.sql.Date(millis);
		HttpSession http = request.getSession(true);
       String sql = "select count(*) from notifications where Date = '"+date+"'";
       ResultSet rs = st.executeQuery(sql);
       while(rs.next()){
    	  count = rs.getInt(1);
       }
  }catch(Exception e){
	  e.printStackTrace();
  }
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
            <a class="nav-link active" href="MainDashboard.jsp" id="dashboard" >
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
            <a class="nav-link active" href="Studentindex.jsp" id="" >
               <i class="material-icons icon"><abbr title="Student">
         people
          </i>
              <span class="text"> Students</span>
            </a>
          </li>
               
      <li class="nav-item ">
            <a class="nav-link active" href="Teacherindex.jsp" id="" >
               <i class="material-icons icon">
        people_outline
          </i>
              <span class="text"> Teacher/Staff</span>
            </a>
          </li>
      <hr class="divide-side-elements">
      
      <div class="subtitle-side-elements">
              MONEY
           </div>
       <li class="nav-item ">
            <a class="nav-link active" href="Financeindex.jsp" id="" >
               <i class="material-icons icon">
        account_balance_wallet
          </i>
              <span class="text">Finance</span>
            </a>
          </li>    
           <hr class="divide-side-elements">
      
      <div class="subtitle-side-elements">
              OTHERS
           </div>
       <li class="nav-item ">
            <a class="nav-link active" href="SmsManagement.jsp" id="" >
               <i class="material-icons icon">
       local_post_office
          </i>
              <span class="text">SMS</span>
            </a>
          </li>  
           <li class="nav-item notification">
            <a class="nav-link active" href="Notifications.jsp" id="" >
               <i class="material-icons icon">
       campaign
          </i>
              <span class="text">Notifications</span>
               <span class="badge badge-danger" id="count"><%=count%></span>&nbsp;&nbsp;
            </a>
          </li>    
           
      <li class="nav-item sideMenuToggler text-center"><a href="#" class="nav-link"><i class="material-icons icon" style="margin-left:-40px">
           keyboard_arrow_left
          </i><span class="text">
          </span></a></li>
          <li>
      </li>
        </ul>
      </div>
    </nav>
   </div>
  <div class="contents">
        Hello
    </div> 
    </div>
<!--  
  <div class="album py-5 bg-light">
    <div class="container">
      <div class="row">
        <div class="col-md-4" id="student">
          <div class="card mb-4 shadow text-center">
                  <div class="card-body align-items-center">
                  <img class="mb-4" src="E:/download.png" alt="" width="100%" height="155px">
              <p class="card-text" style="text-align:center;">Students</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-primary btn-block" onclick="window.location.href='Student.jsp';">View</button>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-4" id="student">
          <div class="card mb-4 shadow text-center">
                  <div class="card-body align-items-center">
                  <img class="mb-4" src="E:/download.png" alt="" width="100%" height="155px">
              <p class="card-text" style="text-align:center;">Teachers</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-primary btn-block" onclick="window.location.href='TeacherManagement.jsp';">View</button>
                </div>
              </div>
            </div>
          </div>
        </div>
         <div class="col-md-4" id="student">
          <div class="card mb-4 shadow text-center">
                  <div class="card-body align-items-center">
                  <img class="mb-4" src="E:/download.png" alt="" width="100%" height="155px">
              <p class="card-text" style="text-align:center;">Staff</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-primary btn-block" onclick="window.location.href='StaffManagement.jsp';">View</button>
                </div>
              </div>
            </div>
          </div>
        </div>
          <div class="col-md-4" id="student">
          <div class="card mb-4 shadow text-center">
                  <div class="card-body align-items-center">
                  <img class="mb-4" src="E:/download.png" alt="" width="100%" height="155px">
              <p class="card-text" style="text-align:center;">Class Management</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-primary btn-block" onclick="window.location.href='ClassManagement.jsp';">View</button>
                </div>
              </div>
            </div>
          </div>
        </div>
           <div class="col-md-4" id="student">
          <div class="card mb-4 shadow text-center">
                  <div class="card-body align-items-center">
                  <img class="mb-4" src="E:/download.png" alt="" width="100%" height="155px">
              <p class="card-text" style="text-align:center;">Finance Management</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-primary btn-block" onclick="window.location.href='FinanceManagement.jsp';">View</button>
                </div>
              </div>
            </div>
          </div>
        </div>
             <div class="col-md-4" id="student">
          <div class="card mb-4 shadow text-center">
                  <div class="card-body align-items-center">
                  <img class="mb-4" src="E:/download.png" alt="" width="100%" height="155px">
              <p class="card-text" style="text-align:center;">Sms Management</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-primary btn-block" onclick="window.location.href='SmsManagement.jsp';">View</button>
                </div>
              </div>
            </div>
          </div>
        </div>
        </div>
  </div>
</div>
-->
</body>
</html>