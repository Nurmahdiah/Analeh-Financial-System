<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Estimation</title>
</head>
<body>
<% 
	
	String projectName = request.getParameter("projectname");
	String date = request.getParameter("date");
	String month = request.getParameter("month");
	String year = request.getParameter("year");
	double amount = Double.parseDouble(request.getParameter("amount"));
																																																		
	try
	{
		Class.forName("com.mysql.jdbc.Driver"); 
		 java.sql.Connection myConnection = DriverManager.getConnection("jdbc:mysql://localhost:3307/financial","root","");
	       
	
	Statement st = myConnection.createStatement();
	int k = st.executeUpdate("insert into estimation (projectName,date,year,month,estAmount)values('"+projectName+"','"+date+"','"+year+"','"+month+"','"+amount+"')");
    int j = st.executeUpdate("insert into Etprofit (month,year,esp) values ('"+month+"','"+year+"','"+amount+"')");
	
	out.println("<script type=\"text/javascript\">");
	out.println("alert(\"Success Add Estimation\")");
	out.println("</script>");
		
	RequestDispatcher rd = request.getRequestDispatcher("FestimationView.jsp");
	rd.include(request, response);
	
	}
	catch(Exception e)
	{
	System.out.print(e);
	e.printStackTrace();
	}
%>
</body>
</html>