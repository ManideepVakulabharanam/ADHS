<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="ExamIndex.jsp"></jsp:include>
</head>
<body>
<div class="wrapper d-flex">
    <div class="contents">
 <h2>Enter student Details</h2><br>
   <form action="ProgressCardGenerate.jsp" method="get">
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
       <option value="Quaterly"  id="Quaterly" value="Quaterly">Quaterly</option>
       <option value="Halfyearly"  id="Halfyearly" value="Halfyearly">Halfyearly</option>
       <option value="annual"  id="annual" value="annual">annual</option>
       <option value="allExams"  id="allExams" value="allExams">allExams</option>
          </select>
    </div>
    <div class="form-group col-md-4">
    <label for="RollNo">Roll No</label>
    <input type="text" name="Rollno" class="form-control" id="Rollno" required>
    </div>
    </div>
    <button type="submit" class="btn btn-primary">View Student Details</button>
   </form>
   </div>
   </div>
</body>
</html>