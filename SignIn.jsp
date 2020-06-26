<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="SignIn.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" ></script>
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
	  var values =	localStorage.getItem("values");//localStorage is javascript properties to save data permanently
	  //window.alert(values);
	  if (values !== null){
		 if(values == 0){
			 document.getElementById("Button").disabled = true;
			 document.getElementById("msg").innerHTML = "Your login attempts are more than 3 <br> you can't <b>login now</b> <br> TRY AFTER FEW HOURS<br> <i>help : </i><a href='mailto:'>Send Mail</a><br>";
			 setTimeout(function(){ document.getElementById("Button").disabled = false;
			 localStorage.setItem("values",3);
			 document.getElementById("msg").innerHTML = "<b>TRY NOW</b><br>";
			 }, 86400000);
		 }
	  document.getElementById("login_attempt").value = 	values;
		window.alert(document.getElementById("login_attempt").value);
	  }
	  else{
		  document.getElementById("login_attempt").value = 3;
		  window.alert(document.getElementById("login_attempt").value);
	  }
	}
	function redirect(){
		if(document.getElementById("TechSign").checked == true){
			 window.location.href = 'TechSign.jsp';
		}
	}
	$(document).ready(function(){
		$("button").on("click",function(){
			var value = document.getElementById("login_attempt").value;
			value--;
			localStorage.setItem("values",value);
		})
	});
</script>
</head>
<body onload="visibilty()">
    <div class="text-center" id="signin">
    <form class="form-signin" action="AdminDashboard" method="get"  name="register">
  <img class="mb-4" src="D:/Images/far/VPK_8296.JPG" alt="" width="72" height="72">
  <% String ErrorMsg = (String)request.getAttribute("Error"); %>
  <h1 id="req" style="color:red;text-align :center;"><%= ErrorMsg %></h1>
  <h1 class="h3 mb-3 font-weight-normal">Sign In</h1>
  <div class="checkbox mb-3">
    <label>
      <input type="checkbox" value="remember-me" id="TechSign" onClick="redirect()"> Teacher SignIn
    </label>
  </div>
  <label for="inputEmail" class="sr-only">UserName</label>
  <input type="text" id="UserName" class="form-control" placeholder="UserName" name="UserName" required autofocus>
  <label for="inputPassword" class="sr-only">Password</label>
  <input type="password" id="PassWord" class="form-control" placeholder="Password" name="PassWord" required>
  <small>please enter correct password</small>
  <div class="checkbox mb-3">
    <label>
      <input type="checkbox" value="remember-me"> Remember me
    </label>
    <input type="hidden" id="login_attempt" value="">
  </div>
  <button class="btn btn-lg btn-primary btn-block" type="submit" id="Button">Sign in</button>
  <h5 id="msg"></h5>
</form>
</div>
</body>
</html>