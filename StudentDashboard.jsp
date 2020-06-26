<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*" %>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<%! int[] arr = new int[10];
int[] pre = new int[10];
%>
<%
 try {
	 Statement st = null; 
	 Connection con = null;
	 Class.forName("com.mysql.jdbc.Driver");
	  String url="jdbc:mysql://localhost:3306/adhs?characterEncoding=utf8&useSSL=false&useUnicode=true";
	  con = DriverManager.getConnection(url,"root","Mandy.143");
    	if(con.equals(null)){
    		
    	}else{
    		 System.out.print("done");
    	}
    	for(int i =1;i<11;i++){
    		int x = 0;
    		int y = 0;
    		int tt = 0;
			 int total = 0;
    	String sql = "select todaypresent,todayabsent from attendenceclass_"+i+";";
    	 st = con.createStatement();
    	ResultSet rs = st.executeQuery(sql);
    	while(rs.next()){
    		y += rs.getInt(1);
    		x += rs.getInt(2);
    	}
    	tt+=y;
    	total += x;
    	arr[i-1] = total;
    	pre[i-1] = tt;
    	}
    	con.close();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
%>

<div class="container" id="content">
<canvas id="myChart"></canvas>
</div>
<script>
Chart.defaults.global.defaultFontColor = '#666'; 

var myChrt = document.getElementById('myChart').getContext('2d');
let barChart = new Chart(myChrt, {
		type: 'bar',//Chart type
		data: {
			labels: ["class_1","class_2","class_3","class_4","class_5","class_6","class_7","class_8","class_9","class_10"],
			datasets: [{
			label : 'Absent',
			data: [
				<%= arr[0]%>,
				<%= arr[1]%> ,
				<%= arr[2]%> , 
				<%= arr[3]%> ,
				<%= arr[4]%> ,
				<%= arr[5]%> ,
				<%= arr[6]%> ,
				<%= arr[7]%> ,
				<%= arr[8]%> ,
				<%= arr[9]%> ],
				backgroundColor: 
					'#c34618'
					,
			},
			{
			label : 'present',
			data: [
				<%= pre[0]%>,
				<%= pre[1]%> ,
				<%= pre[2]%> , 
				<%= pre[3]%> ,
				<%= pre[4]%> ,
				<%= pre[5]%> ,
				<%= pre[6]%> ,
				<%= pre[7]%> ,
				<%= pre[8]%> ,
				<%= pre[9]%> ],
				backgroundColor: 
					'green'
					,
			
			}],
			
			},
		options :{
			title :{
				display : true,
			    text : "Today Total absenties classwise"
			},
			legend:{
				position : 'right'
			},
			 layout: {
		            padding: {
		                left: 70,
		                right: 0,
		                top: 0,
		                bottom: 0
		            }
		        },
			scales: {
		        yAxes: [{
		        	ticks: {
		        		beginAtZero : true 
		        	}
		        }]	
		        }
		}
});


</script>
</body>
</html>