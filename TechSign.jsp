<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="SignIn.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<title>Insert title here</title>
<script>
function visibilty(){
	  var result = document.getElementById("req").innerHTML;
	  if(result == "null"){
		  //window.alert(result);
		  document.getElementById("req").style.visibility = "hidden";
	  }
	  else{
		  document.getElementById("req").style.visibility = "visible";
	  }
	}

</script>
</head>
<body onload="visibilty()">
    <div class="text-center" id="signin">
    <form class="form-signin" action="TeacherLoginValid" method="get" name="register">
  <img class="mb-4" src="" alt="" width="72" height="72">
  <% String ErrorMsg = (String)request.getAttribute("Error"); %>
  <h1 id="req" style="color:red;text-align :center;"><%= ErrorMsg %></h1>
  <h1 class="h3 mb-3 font-weight-normal">Sign In</h1>
  <label for="inputEmail" class="sr-only">UserName</label>
  <input type="text" id="UserName" class="form-control" placeholder="UserName" name="UserName" required autofocus>
  <label for="inputPassword" class="sr-only">Password</label>
  <input type="password" id="PassWord" class="form-control" placeholder="Password" name="PassWord" required>
  <div class="checkbox mb-3">
    <label>
      <input type="checkbox" value="remember-me"> Remember me
    </label>
  </div>
  <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
</form>
</div>
</body>
</html>