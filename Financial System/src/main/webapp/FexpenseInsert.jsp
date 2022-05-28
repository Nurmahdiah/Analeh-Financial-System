<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Expenses</title>
</head>
<body>
<% 
	
	String pname = request.getParameter("projname");
	String date = request.getParameter("date");
	String month = request.getParameter("month");
	String year = request.getParameter("year");
	String desc = request.getParameter("desc");
	double amount = Double.parseDouble(request.getParameter("amount"));
																																																		
	try
	{
		Class.forName("com.mysql.jdbc.Driver"); 
		 java.sql.Connection myConnection = DriverManager.getConnection("jdbc:mysql://localhost:3307/financial","root","");
	       
	
	Statement st = myConnection.createStatement();
	int k = st.executeUpdate("insert into expense (projectname,date,month,year,description,espAmount) values('"+pname+"','"+date+"','"+month+"','"+year+"','"+desc+"','"+amount+"')");
    int j = st.executeUpdate("insert into Esprofit (month,year,exp,projectname) values ('"+month+"','"+year+"','"+amount+"','"+pname+"')");
	
    out.println("<script type=\"text/javascript\">");
	out.println("alert(\"Success Add Expenses\")");
	out.println("</script>");
		
	RequestDispatcher rd = request.getRequestDispatcher("FexpenseView.jsp");
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