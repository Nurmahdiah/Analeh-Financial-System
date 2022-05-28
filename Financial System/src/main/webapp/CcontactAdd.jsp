<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*"%>

<title>Contact</title>
<% 
	
	String Cregno = request.getParameter("txtregno");
	String Cname = request.getParameter("txtcompname");
	String Cphone = request.getParameter("txtphoneNo");
	String Caccname = request.getParameter("txtaccname");
	String Cacc = request.getParameter("txtaccno");
	String Cemail = request.getParameter("emailcomp");
	String Cstreet = request.getParameter("txtstreet");
	String Cpostc = request.getParameter("txtpostcode");
	String Ccity = request.getParameter("txtCity");
	String Cstate = request.getParameter("txtState");
	String Ccountry = request.getParameter("txtCountry");
																																																		
	try
	{
		Class.forName("com.mysql.jdbc.Driver"); 
		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/financial","root","");
	
	Statement st = con.createStatement();
	int k = st.executeUpdate("insert into Contacts (contregNo,contName,contPhoneNo,conBankname,contAccNo,contEmail,contStreet,contPostcode,contCity,contState,contCountry) values ('"+Cregno+"','"+Cname+"','"+Cphone+"','"+Caccname+"','"+Cacc+"','"+Cemail+"','"+Cstreet+"','"+Cpostc+"','"+Ccity+"','"+Cstate+"','"+Ccountry+"')");
		
	out.println("<script type=\"text/javascript\">");
	out.println("alert(\"Success Add Contact\")");
	out.println("</script>");
		
	RequestDispatcher rd = request.getRequestDispatcher("CcontactView.jsp");
	rd.include(request, response);
	
	}
	catch(Exception e)
	{
	System.out.print(e);
	e.printStackTrace();
	}
%>
