<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*" %>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
  <head>
    </head>
  <body>
  <%! int[] arr = new int[10];
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
    	String sql = "select count(*) from class_"+i+";";
    	 st = con.createStatement();
    	ResultSet rs = st.executeQuery(sql);
    	while(rs.next()){
    	  x = rs.getInt(1);
    	}

    	arr[i-1] = x;
    	}
    	con.close();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

%> 
  
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = google.visualization.arrayToDataTable([
            ['classes', 'Strength'],
            ['class_1',    <%= arr[0]%>],
            ['class_2',    <%= arr[1]%>],
            ['class_3',    <%= arr[2]%>],
            ['class_4',    <%= arr[3]%>],
            ['class_5',    <%= arr[4]%>],
            ['class_6',    <%= arr[5]%>],
            ['class_7',    <%= arr[6]%>],
            ['class_8',    <%= arr[7]%>],
            ['class_9',    <%= arr[8]%>],
            ['class_10',   <%= arr[9]%>]
        ]);

        var options = {
          title: 'class Strength',
          is3D: true,
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));

        chart.draw(data, options);
      }
    </script>
    <div id="piechart_3d" style="width: 900px; height: 600px;"></div>
  </body>
</html>