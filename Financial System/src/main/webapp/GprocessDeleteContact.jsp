<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact</title>
</head>
<body>
	<%
		try{
			
			String Id = request.getParameter("contID");
			int contactId = Integer.parseInt(Id);
			Class.forName("com.mysql.jdbc.Driver"); 
			java.sql.Connection myConnection = DriverManager.getConnection("jdbc:mysql://localhost:3307/financial","root","");
			
			String mySqlQuery = "delete from Contacts where contID=?";
			
			PreparedStatement myPs = myConnection.prepareStatement(mySqlQuery);
			
			myPs.setInt(1, contactId);
			
			if(myPs.executeUpdate() != 0){
				
				out.println("<script type=\"text/javascript\">");
				out.println("alert(\"Success Delete the Contact Record\")");
				out.println("</script>");
					
				RequestDispatcher rd = request.getRequestDispatcher("GcontactView.jsp");
				rd.include(request, response);
			}
		
		}
		catch (Exception e) {
		e.printStackTrace();
		}
	%>
</body>
</html>