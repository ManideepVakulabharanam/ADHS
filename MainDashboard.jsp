<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="AdminDashboard.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="MainDashStyle.css" >
</head>
<body>
<!-- Main Contents -->
<%
if(session.getAttribute("User")==(null)){
	   response.sendRedirect("SignIn.jsp");
}
%>
<%! 
    int strength = 0;
	int totalIncome = 0;
	int totalSpent = 0;
	int totalTeachers = 0;
	int[] arr = new int[10];
	int[] pre = new int[10];
	int[] class_strength = new int[10];
	int[] income = new int[4];
	int[] spends = new int[12];
	%>
<%
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost:3306/adhs?characterEncoding=utf8&useSSL=false&useUnicode=true";
Connection con = DriverManager.getConnection(url,"root","Mandy.143");
try {
	
	Statement st = con.createStatement();
	///attendance for each class
	for(int i =1;i<11;i++){
	String sql = "select todaypresent,todayabsent from attendenceclass_"+i+";";
	ResultSet rs = st.executeQuery(sql);
	while(rs.next()){
		pre[i-1] += rs.getInt(1);
		arr[i-1] += rs.getInt(2);
	}
	}
	/////clswise count....need to look for some logic////
	strength = 0;
	for(int i =1;i<11;i++){
		String str = "select count(*) from class_"+i+";";
		ResultSet rst = st.executeQuery(str);
		while(rst.next()){
			class_strength[i-1] = rst.getInt(1);
			strength +=  rst.getInt(1);
		}
	}
	/////Teachers count/////////
	String strs = "select count(*) from teacher_details;";
	ResultSet rsts = st.executeQuery(strs);
	while(rsts.next()){
		totalTeachers = rsts.getInt(1);
	}
	////Termwise Fee
	for(int i =1;i<11;i++){
	String sql = "select sum(Term1),sum(Term2),sum(Term3),sum(Term4) from fee_detailsclass_"+i+";";
	st = con.createStatement();
	ResultSet rs = st.executeQuery(sql);
	while(rs.next()){
		income[0] += rs.getInt(1);
		income[1] += rs.getInt(2);
		income[2] += rs.getInt(3);
		income[3] += rs.getInt(4);
	}
	//System.out.println(income[0]+" "+income[1]+" "+income[2]+" "+income[3]);
	}
	totalIncome = income[0] + income[1] + income[2] + income[3];
	//////////Spends Code////////////////////
	String str = "select Total from monthlyspends;";
	ResultSet rst = st.executeQuery(str);
	int p = 0;
	while(rst.next()){
		spends[p++] = rst.getInt(1); 
	}
	totalSpent = 0;
	for(int i=0;i<12;i++){
		totalSpent  += spends[i];
	}
	//System.out.println(p+""+totalSpent);
	con.close();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
%>
<div class="wrapper d-flex">
<div class="maincontent">
    <div class="row container-fluid">
       <div class="col-xl-6 col-md-6 ">
       <div class="card shadow bg-success disp">
           <div  class="text-uppercase">Total Students<i class="material-icons icon float-right">people_alt</i></div> 
           <div>
               <%= strength%>
           </div>
           </div>
       </div>
        <div class="col-xl-6 col-md-6 ">
        <div class="card shadow bg-info disp">
           <div  class="text-uppercase">Total Teachers  <i class="material-icons icon float-right">people_alt</i></div> 
           <div>
               <%= totalTeachers%>
           </div>
       </div>
       </div>
    </div>
     
    <div class="row container-fluid charts">
    <div class="col-xl-7 col-lg-6">
              <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold">Absent Students</h6>
                </div>
                <div class="card-body">
                  <div class="blocks">
                    <canvas id="myChart"></canvas>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-xl-5 col-lg-4">
              <div class="card shadow mb-4">
          <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold">Total Students</h6>
                </div>
               
                <div class="card-body">
                  <div class="blocks-pie pt-4 pb-2">
                    <canvas id="myCharts"></canvas>
                  </div>
                </div>
              </div>
            </div>
    </div>
    <div  class="row container-fluid">
       <div class="col-xl-12 col-lg-12">
              <div class="card shadow mb-4">
                
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold">Earnings</h6>
                </div>
                
                <div class="card-body" style="position: relative;">
                <div class="content-bg">
                  <div class="row text-center">
                    <div class="col-md-6">
                     <p class="text-muted mb-0 mt-3">Total Income</p>
                     <h2 class="font-weight-normal mb-3">
                      <span class="mr-2">
                      <i class="fas fa-circle text-success mt-4 small"></i>&#8377;<%= totalIncome%>
                    </span>
                     </h2>
                    </div>
                    <div class="col-md-6">
                     <p class="text-muted mb-0 mt-3">Total Spent</p>
                     <h2 class="font-weight-normal mb-3">
                       <span class="mr-2">
                      <i class="fas fa-circle text-primary mt-4 small"></i>&#8377; <%= totalSpent%>
                    </span>
                     </h2>
                    </div>
                  </div>
                </div>
                <br>
                <div class="row text-center">
                    <div class="col-md-6">
                      <canvas id="financeincomechart"></canvas>
                    </div>
                    <div class="col-md-6">
                      <canvas id="financespendchart"></canvas>
                    </div>
                  </div>
                </div>
              </div>
            </div>
    </div>
    </div>
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
			<%= arr[1]%>,
			<%= arr[2]%>,
			<%= arr[3]%>,
			<%= arr[4]%>,
			<%= arr[5]%>,
			<%= arr[6]%>,
			<%= arr[7]%>,
			<%= arr[8]%>,
			<%= arr[9]%>,
			
				],
				backgroundColor: 
					'#c34618'
					,
			},
			{
			label : 'present',
			data: [
				<%= pre[0]%>,
				<%= pre[1]%>,
				<%= pre[2]%>,
				<%= pre[3]%>,
				<%= pre[4]%>,
				<%= pre[5]%>,
				<%= pre[6]%>,
				<%= pre[7]%>,
				<%= pre[8]%>,
				<%= pre[9]%>,
				],
				backgroundColor: 'green',
			
			}],
			
			},
		options :{
			title :{
				display : true,
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
/////////
var myChrts = document.getElementById('myCharts');
var data = {
		labels: ["class_1","class_2","class_3","class_4","class_5","class_6","class_7","class_8","class_9","class_10"],	
		datasets: [{
			data: [
				<%= class_strength[0]%>,
				<%= class_strength[1]%>,
				<%= class_strength[2]%>,
				<%= class_strength[3]%>,
				<%= class_strength[4]%>,
				<%= class_strength[5]%>,
				<%= class_strength[6]%>,
				<%= class_strength[7]%>,
				<%= class_strength[8]%>,
				<%= class_strength[9]%>
			],
			backgroundColor: ['green','blue','yellow','white','black','brown','orange','grey','red','yellow'],
		}],
		
};
let diffChart = new Chart(myChrts, {
		type: 'doughnut',//Chart type!
		data : data,
		options :{
			//maintainAspectRatio: false,
		    tooltips: {
		      backgroundColor: "rgb(255,255,255)",
		      bodyFontColor: "#858796",
		      borderColor: '#dddfeb',
		      borderWidth: 1,
		      xPadding: 15,
		      yPadding: 15,
		      //displayColors: false,
		      caretPadding: 10,
		    },
		    title :{
				display : true,
			    text : "ClassWise Data",
			    position : 'bottom'
			},
		    legend: {
		      display: false 
		    },
		    cutoutPercentage: 80,
		}
});
////////////
var myChart = document.getElementById('financeincomechart');
let chrt = new Chart(myChart,{
	type : 'line',
	data : {
	labels: ["Term1","Term2","Term3","Term4"],
	datasets: [{
		label: "Earnings",
	      lineTension: 0.2,
	      backgroundColor: "rgba(38, 185, 23, 0.05)",
	      borderColor: "rgba(38, 185, 23, 1)",
	      pointRadius: 4,
	      pointBackgroundColor: "rgba(38, 185, 23, 1)",
	      pointBorderColor: "rgba(38, 185, 23, 1)",
	      pointHoverRadius: 4,
	      pointHoverBackgroundColor: "rgba(38, 185, 23, 1)",
	      pointHoverBorderColor: "rgba(38, 185, 23, 1)",
	      pointHitRadius: 10,
	      pointBorderWidth: 2,
	      data: [
	    	  <%= income[0]%>,
	    	  <%= income[1]%>,
	    	  <%= income[2]%>,
	    	  <%= income[3]%>,
	      ],
	}],
	},
	options: {
	   // maintainAspectRatio: false
	    legend: {
	      display: false
	    },
	  }
});
//////////////////

var myCharts = document.getElementById('financespendchart');
let chrts = new Chart(myCharts,{
	type : 'line',
	data : {
	labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
	datasets: [{
		label: "Spends",
	      lineTension: 0.2,
	      backgroundColor: "rgba(78, 115, 223, 0.05)",
	      borderColor: "rgba(78, 115, 223, 1)",
	      pointRadius: 4,
	      pointBackgroundColor: "rgba(78, 115, 223, 1)",
	      pointBorderColor: "rgba(78, 115, 223, 1)",
	      pointHoverRadius: 4,
	      pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
	      pointHoverBorderColor: "rgba(78, 115, 223, 1)",
	      pointHitRadius: 10,
	      pointBorderWidth: 2,
	      data: [
	    	  <%= spends[0]%>,
	    	  <%= spends[1]%>,
	    	  <%= spends[2]%>,
	    	  <%= spends[3]%>,
	    	  <%= spends[4]%>,
	    	  <%= spends[5]%>,
	    	  <%= spends[6]%>,
	    	  <%= spends[7]%>,
	    	  <%= spends[8]%>,
	    	  <%= spends[9]%>,
	    	  <%= spends[10]%>,
	    	  <%= spends[11]%>
	      ],
	}],
	},
	options: {
	   // maintainAspectRatio: false
	    legend: {
	      display: false
	    },
	  }
});
</script>
</body>
</html>