<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ITeam</title>
</head>
<body>
         <%
		int teamId = Integer.parseInt(request.getParameter("hidid"));
		String fullname = request.getParameter("fullname");
		String ic = request.getParameter("ic");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String roles = request.getParameter("roles");
                
		Class.forName("com.mysql.jdbc.Driver"); 
		java.sql.Connection myConnection = DriverManager.getConnection("jdbc:mysql://localhost:3307/financial","root","");
	
                
                String mySqlQuery = "update team set fullname=?,ic=?,email=?,phone=?,roles=? where staffid="+teamId;
                PreparedStatement myPs =myConnection.prepareStatement (mySqlQuery);
                
                myPs.setString(1,fullname);
                myPs.setString(2,ic);
                myPs.setString(3,email);
                myPs.setString(4,phone);
                myPs.setString(5,roles);
                
               if( (myPs.executeUpdate()!=0)){
               
               out.println("<script type=\"text/javascript\">");
               out.println("alert(\"Success Update Team\")");
               out.println("</script >");
               
               RequestDispatcher rd = request.getRequestDispatcher("teamView.jsp");
               rd.include(request,response);
               
             
         }
         
         myConnection.close();
    %>
</body>
</html>