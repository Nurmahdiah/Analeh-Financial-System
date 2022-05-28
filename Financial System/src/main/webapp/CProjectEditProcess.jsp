<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*"%>

<title>Edit Projects</title>
<% 
	String Pname = request.getParameter("txtprojName");
	String Comname = request.getParameter("txtcompname");
	String PSdate = request.getParameter("dateStart");
	String PEdate = request.getParameter("dateEnd");
	String PDuration = request.getParameter("projectDuration");
	String PLocation = request.getParameter("projectLocation");
																																																		
	try
	{
	Class.forName("com.mysql.jdbc.Driver"); 
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/financial","root","");
	
	Statement st = con.createStatement();
	int k = st.executeUpdate("insert into Projects (projectName,companyName,projStartDate,projEndDate,projectDuration,projectLocation) values ('"+Pname+"','"+Comname+"','"+PSdate+"','"+PEdate+"','"+PDuration+"','"+PLocation+"')");
	
	out.println("<script type=\"text/javascript\">");
	out.println("alert(\"Insert Project Success\")");
	out.println("</script>");
	
	RequestDispatcher rd = request.getRequestDispatcher("CProjectView.jsp");
	rd.include(request, response);
	
	}
	catch(Exception e)
	{
	System.out.print(e);
	e.printStackTrace();
	}
%>
