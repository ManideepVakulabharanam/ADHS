<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="FinanceManagement.jsp"></jsp:include>
<script type="text/javascript">
function add() {
	  var new_data_no = parseInt($('#spends_data').val()) + 1;
	 // window.alert(new_data_no);
	  var new_input = "<div id='new_" + new_data_no + "' class='form-row'>"+
	  "<div class='form-group col-md-6'> <label>Reason</label><input type='text' class='form-control' name= 'labels' id='labels' pattern='[A-Za-z]{1,9}' title='Enter Correct Reason'>"+
	  "</div>"+
	  "<div class='form-group col-md-6'> <label>Money</label><input type='text' class='form-control' id='values' name='values' pattern='[0-9]{1,4}' title='Enter Correct Money'></div></div>";
	  
	  $('#new_data').append(new_input);
	  $('#spends_data').val(new_data_no);
	}

	function remove() {
	  var last_data_no = $('#spends_data').val();
	  //window.alert(last_data_no);
	  if (last_data_no > 1) {
	    $('#new_' + last_data_no).remove();
	    $('#spends_data').val(last_data_no - 1);
	  }
	}
	
	$(document).ready(function() {
	     $(':input[type="submit"]').prop('disabled', true);
	        $("#btn1").click(function(){
	        	//window.alert("inside");
	           $(':input[type="submit"]').prop('disabled', false);
	        })
	 });
	$(document).ready(function() {
		
	        $("#btn2").click(function(){
	        	 var last_data_no = $('#spends_data').val();
	    		 //window.alert(last_data_no);
	    		 if(last_data_no == 1){
	        	//window.alert("inside");
	           $(':input[type="submit"]').prop('disabled', true);
	    		 }
	        })
	 });
	 function visibilty(){
	   	   var result = document.getElementById("res").innerHTML;
	   	   if(result == "null"){
	   		   document.getElementById("res").style.visibility = "hidden";
	   	   }
	   	   else{
	   		   document.getElementById("res").style.visibility = "visible";
	   	   }
	   	}
</script>
</head>
<body style="text-align:center" onload="visibilty()">
<div class="wrapper d-flex">
<div class="contents">
<button onclick="add()" class="btn btn-primary" id="btn1">Add New</button>
<button onclick="remove()" class="btn btn-danger" id="btn2">Remove</button><br>
<form action="${pageContext.servletContext.contextPath}/InsesrtDailySpends" method="get" id="formV" onSubmit="return validate()" name="register">
<div id="new_data"></div>
<input type="hidden" value="1" id="spends_data"><br>
<button type="submit" class="btn btn-success" id="sub">Submit</button>
</form>
<h3 id="res" style="color:black"><%=request.getAttribute("result")%></h3>
</div>
</div>
</body>
</html>