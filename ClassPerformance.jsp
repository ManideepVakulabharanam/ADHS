<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
  <jsp:include page="ExamIndex.jsp"></jsp:include>
  </head>
  <body>
  <div class="wrapper d-flex">
    <div class="contents" style="margin-top:50px;">
     <div  class="row container-fluid">
       <div class="col-xl-10 col-lg-10">
          <div class="card-body" >
                <div class="row text-center">
                     <canvas id="myChart"></canvas>
                </div>
              </div>
       </div>
    </div>
    <div  class="row container-fluid">
       <div class="col-xl-10 col-lg-10">
          <div class="card-body">
                <div class="row text-center">
                     <canvas id="myChart2"></canvas>
                </div>
              </div>
       </div>
    </div>
   </div>
 </div>
  <%!Statement st = null; 
Connection con = null;
int count = 0;
double sa1[] = new double[11];
double sa2[] = new double[11];
double fa1[] = new double[11];
double fa2[] = new double[11];
double fa3[] = new double[11];
double fa4[] = new double[11];
%>
<%
  try{
	  Class.forName("com.mysql.jdbc.Driver");
	  String url="jdbc:mysql://localhost:3306/adhs?characterEncoding=utf8&useSSL=false&useUnicode=true";
	  con = DriverManager.getConnection(url,"root","Mandy.143");
       if(con!=null){
    	   System.out.println("connected");
       }
       st = con.createStatement();
       for(int i=1;i<11;i++){
    	   String sql = "select AVG(Total) from class_"+i+"marks where Examtype = 'SA1'";
    	   ResultSet rs = st.executeQuery(sql);
    	   while(rs.next()){
    		   sa1[i-1] = rs.getInt(1);
    	   } 
    	   String sqls = "select AVG(Total) from class_"+i+"marks where Examtype = 'SA2'";
    	   ResultSet rst = st.executeQuery(sqls);
    	   while(rst.next()){
    		   sa2[i-1] = rst.getInt(1);
    	   } 
    	   String str = "select AVG(Total) from class_"+i+"marks where Examtype = 'FA1'";
    	   ResultSet r = st.executeQuery(str);
    	   while(r.next()){
    		   fa1[i-1] = r.getInt(1);
    	   } 
    	   String strs = "select AVG(Total) from class_"+i+"marks where Examtype = 'FA2'";
    	   ResultSet rt = st.executeQuery(strs);
    	   while(rt.next()){
    		   fa2[i-1] = rt.getInt(1);
    	   } 
    	   String strin = "select AVG(Total) from class_"+i+"marks where Examtype = 'FA3'";
    	   ResultSet rss = st.executeQuery(strin);
    	   while(rss.next()){
    		   fa3[i-1] = rss.getInt(1);
    	   } 
    	   String string = "select AVG(Total) from class_"+i+"marks where Examtype = 'FA4'";
    	   ResultSet rr = st.executeQuery(string);
    	   while(r.next()){
    		   fa4[i-1] = rr.getInt(1);
    	   } 
    	   
       }
       con.close();
  }catch(Exception e){
	  e.printStackTrace();
  }
%>
    <script type="text/javascript">
    Chart.defaults.global.defaultFontColor = '#666'; 

    var myChrt = document.getElementById('myChart').getContext('2d');
    let barChart = new Chart(myChrt, {
    		type: 'bar',//Chart type
    		data: {
    			labels: ["class_1","class_2","class_3","class_4","class_5","class_6","class_7","class_8","class_9","class_10"],
    			datasets: [{
    			label : 'SA1',
    			data: [
    				<%= sa1[0]%>,
    				<%= sa1[1]%> ,
    				<%= sa1[2]%> , 
    				<%= sa1[3]%> ,
    				<%= sa1[4]%> ,
    				<%= sa1[5]%> ,
    				<%= sa1[6]%> ,
    				<%= sa1[7]%> ,
    				<%= sa1[8]%> ,
    				<%= sa1[9]%> ],
    				backgroundColor: 
    					'#c34618'
    					,
    			},
    			{
    			label : 'SA2',
    			data: [
    				<%= sa2[0]%>,
    				<%= sa2[1]%> ,
    				<%= sa2[2]%> , 
    				<%= sa2[3]%> ,
    				<%= sa2[4]%> ,
    				<%= sa2[5]%> ,
    				<%= sa2[6]%> ,
    				<%= sa2[7]%> ,
    				<%= sa2[8]%> ,
    				<%= sa2[9]%> ],
    				backgroundColor: 
    					'green'
    					,
    			}],
    			
    			},
    		options :{
    			title :{
    				display : true,
    			    text : "summative assessment"
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
    var myChrt = document.getElementById('myChart2').getContext('2d');
    let barCharts = new Chart(myChrt, {
    		type: 'bar',//Chart type
    		data: {
    			labels: ["class_1","class_2","class_3","class_4","class_5","class_6","class_7","class_8","class_9","class_10"],
    			datasets: [{
    			label : 'FA1',
    			data: [
    				<%= fa1[0]%>,
    				<%= fa1[1]%> ,
    				<%= fa1[2]%> , 
    				<%= fa1[3]%> ,
    				<%= fa1[4]%> ,
    				<%= fa1[5]%> ,
    				<%= fa1[6]%> ,
    				<%= fa1[7]%> ,
    				<%= fa1[8]%> ,
    				<%= fa1[9]%> ],
    				backgroundColor: 
    					'#c34618'
    					,
    			},
    			{
    			label : 'FA2',
    			data: [
    				<%= fa2[0]%>,
    				<%= fa2[1]%> ,
    				<%= fa2[2]%> , 
    				<%= fa2[3]%> ,
    				<%= fa2[4]%> ,
    				<%= fa2[5]%> ,
    				<%= fa2[6]%> ,
    				<%= fa2[7]%> ,
    				<%= fa2[8]%> ,
    				<%= fa2[9]%> ],
    				backgroundColor: 
    					'green'
    					,
    			},
    			{
        			label : 'FA3',
        			data: [
        				<%= fa3[0]%>,
        				<%= fa3[1]%> ,
        				<%= fa3[2]%> , 
        				<%= fa3[3]%> ,
        				<%= fa3[4]%> ,
        				<%= fa3[5]%> ,
        				<%= fa3[6]%> ,
        				<%= fa3[7]%> ,
        				<%= fa3[8]%> ,
        				<%= fa3[9]%> ],
        				backgroundColor: 
        					'blue'
        					,
        			},
        			{
            			label : 'FA4',
            			data: [
            				<%= fa4[0]%>,
            				<%= fa4[1]%> ,
            				<%= fa4[2]%> , 
            				<%= fa4[3]%> ,
            				<%= fa4[4]%> ,
            				<%= fa4[5]%> ,
            				<%= fa4[6]%> ,
            				<%= fa4[7]%> ,
            				<%= fa4[8]%> ,
            				<%= fa4[9]%> ],
            				backgroundColor: 
            					'black'
            					,
            			}
    			],
    			
    			},
    		options :{
    			title :{
    				display : true,
    			    text : "formative assessment"
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
