<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="AdminDashboard.jsp"></jsp:include>
</head>
<body>
<%
if(session.getAttribute("User")==(null)){
	   response.sendRedirect("SignIn.jsp");
}
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");

response.setHeader("Pragma", "no-cache");

response.setHeader("Expires","0");
%>
 <div class="wrapper d-flex">
    <div class="maincontent">
          <div class="row container-fluid">
             <div class="col-xl-3 col-lg-3">
               <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between bg-info">
                  <h6 class="m-0 font-weight-bold">Student SMS Management</h6>
                </div>
                <div class="card-body">
                     Send SMS for Students
                     <br>
                     <br>
                     <div>
                        <button class="btn btn-primary" onclick="window.location.href='StudentSMSManagement.jsp';">View</button>
                     </div>
                </div>
              </div>
            </div>
            <div class="col-xl-4 col-lg-3">
               <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between bg-secondary">
                  <h6 class="m-0 font-weight-bold">Teacher SMS Management</h6>
                </div>
                <div class="card-body">
                     Send SMS for Teacher
                     <br>
                     <br>
                     <div>
                        <button class="btn btn-primary" onclick="window.location.href='TeacherSMSManagement.jsp'">View</button>
                     </div>
                </div>
              </div>
            </div>
            </div>
            </div>  
   
            </div>
</body>
</html>