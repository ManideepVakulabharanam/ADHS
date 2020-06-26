<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="TeacherSMSManagement.jsp"></jsp:include>
</head>
<body>
<div class="wrapper d-flex">
<div class="contents">

   <form action="${pageContext.servletContext.contextPath}/Teachersms" method="get">
   <div class="form-group">
   <label>Send Message to Teacher</label>
   <textarea id="w3mission" class="form-control" rows="4" name="message" cols="80">
    
</textarea>
   </div>
   <button type="submit" class="btn btn-primary">send</button>
   <h3 id="res" style="color:white;"><%=request.getAttribute("result")%></h3>
   </form>
   </div>
   </div>
</body>
</html>