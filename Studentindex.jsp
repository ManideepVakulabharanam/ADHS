<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="AdminDashboard.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<%
if(session.getAttribute("User")==(null)){
	   response.sendRedirect("SignIn.jsp");
}
%>
 <div class="wrapper d-flex">
    <div class="maincontent">
          <div class="row container-fluid charts">
             <div class="col-xl-3 col-lg-3">
               <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between bg-info">
                  <h6 class="m-0 font-weight-bold">Student Management</h6>
                </div>
                <div class="card-body">
                     Add/View/Edit/Delete Students
                     <br>
                     <br>
                     <div>
                        <button class="btn btn-primary" onclick="window.location.href='StudentMgmt.html';">View</button>
                     </div>
                </div>
              </div>
            </div>
            <div class="col-xl-4 col-lg-3">
               <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between bg-secondary">
                  <h6 class="m-0 font-weight-bold">Student Attendance Management</h6>
                </div>
                <div class="card-body">
                     Add/View Students Attendance
                     <br>
                     <br>
                     <div>
                        <button class="btn btn-primary" onclick="window.location.href='StudentAttendenceManagement.jsp'">View</button>
                     </div>
                </div>
              </div>
            </div>
          
          <div class="col-xl-5 col-lg-3">
               <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between bg-success">
                  <h6 class="m-0 font-weight-bold">Examination Management</h6>
                </div>
                <div class="card-body">
                     Add/View Students Exam Details & Bonafied Certificate
                     <br>
                     <br>
                     <div>
                        <button class="btn btn-primary" onclick="window.location.href='ExamIndex.jsp';">View</button>
                     </div>
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-lg-3">
               <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between bg-warning">
                  <h6 class="m-0 font-weight-bold">Fee Management</h6>
                </div>
                <div class="card-body">
                     Add/View Students Fee Details
                     <br>
                     <br>
                     <div>
                        <button class="btn btn-primary" onclick="window.location.href='FeeIndex.jsp';">View</button>
                     </div>
                </div>
              </div>
            </div>
          </div>
          </div>
    </div>
 </div>
</body>
</html>