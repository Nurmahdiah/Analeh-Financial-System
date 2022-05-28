<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profit</title>
</head>
<body>
<%
try
{
	
	Class.forName("com.mysql.jdbc.Driver"); 
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/financial","root","");
	
    String month = request.getParameter("month");
    String year = request.getParameter("year");
    double est = 0.0;
    double esp = 0.0;
    String pn = "";
	Statement st = con.createStatement();
	
	String k = "select * from Esprofit where month='"+month+"' and year='"+year+"'";
	
	ResultSet resultSet = st.executeQuery(k);
	while(resultSet.next()){
	    month = resultSet.getString(2);
		year = resultSet.getString(3);
		esp  = resultSet.getDouble(4);
		pn = resultSet.getString(5);
	}
	
	String l = "select * from Etprofit where month='"+month+"' and year='"+year+"'";
	ResultSet resultSet2 = st.executeQuery(l);
	while(resultSet2.next()){
	    month = resultSet2.getString(2);
		year = resultSet2.getString(3);
		est  = resultSet2.getDouble(4);
	

		
	Class.forName("com.mysql.jdbc.Driver"); 
		 
	java.sql.Connection myConnection = DriverManager.getConnection("jdbc:mysql://localhost:3307/financial","root","");
	       
	double profit = est - esp;
	String status = "";
	if(profit < 0){
		status = "lost";
	}
	else if (profit >= 0){
		status = "profit";
	}
		
	Statement st2 = myConnection.createStatement();
		
	int k2 = st2.executeUpdate("insert into profit (projectName,espAmount,estAmount,month,year,profit,status) values('"+pn+"','"+esp+"','"+est+"','"+month+"','"+year+"','"+profit+"','"+status+"')");
		
		
	out.println("<script type=\"text/javascript\">");
		
	out.println("alert(\"Success Add Profit\")");
		
	out.println("</script>");
			
		
	RequestDispatcher rd = request.getRequestDispatcher("FprofitView.jsp");
		
	rd.include(request, response);
		
	}
	con.close();
	} catch (Exception e) {
	e.printStackTrace();
	}
	%>
	
</body>
</html>