<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="StudentSMSManagement.jsp"></jsp:include>
</head>
<body>
<div class="wrapper d-flex">
<div class="contents">
   <form action="${pageContext.servletContext.contextPath}/Teachersms" method="get">
   <div class="form-group">
   <br>
   <br>
   <label>Send Message to Everyone</label>
   <textarea id="w3mission" class="form-control" rows="4" name="message" cols="80">
    
</textarea>
   </div>
   <button type="submit" class="btn btn-primary">send</button>
   <table class="table">
     <thead>
       <tr>
         <th>Sent to These Numbers</th>
       </tr>
     </thead>
    	 <tbody>
    	   <tr>
    	     <td><%=  request.getAttribute("result")%></td>
    	   </tr>
    	 </tbody>
    	   </table>
   </form>
   </div>
   </div>
</body>
</html>