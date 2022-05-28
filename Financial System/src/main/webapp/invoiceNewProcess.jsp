<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Invoice</title>
</head>
<body>
<% 
	
	String rcvr = request.getParameter("rcvr");
	String addr = request.getParameter("addr");
	String pkra = request.getParameter("perkara");
	String ivno = request.getParameter("ivno");
	String date = request.getParameter("date");
	String pjnm = request.getParameter("pjname");
																																																		
	try
	{
		Class.forName("com.mysql.jdbc.Driver"); 
		 java.sql.Connection myConnection = DriverManager.getConnection("jdbc:mysql://localhost:3307/financial","root","");
	       
	
	Statement st = myConnection.createStatement();
	int k = st.executeUpdate("insert into invoice (receiver,address,perkara,invoiceNo,date,projectname) values('"+rcvr+"','"+addr+"','"+pkra+"','"+ivno+"','"+date+"','"+pjnm+"')");

    out.println("<script type=\"text/javascript\">");
	out.println("alert(\"Success Add New Invoice Details\")");
	out.println("</script>");
		
	RequestDispatcher rd = request.getRequestDispatcher("invoiceView.jsp");
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