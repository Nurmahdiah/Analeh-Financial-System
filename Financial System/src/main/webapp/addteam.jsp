<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<jsp:useBean id="myTeam" class="FMS.com.Team" scope="request"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        
        <jsp:setProperty name="myTeam" property="*"/>
        <%
            int result;

           

    		Class.forName("com.mysql.jdbc.Driver"); 
    		java.sql.Connection myConnection = DriverManager.getConnection("jdbc:mysql://localhost:3307/financial","root","");

            String sInsertQry = "INSERT INTO team(staffid, fullname, ic , email, phone, roles) VALUES(?,?,?,?,?,?)";
            
            PreparedStatement myPS = myConnection.prepareStatement(sInsertQry);

            
            myPS.setString(1, myTeam.getstaffid());
            myPS.setString(2, myTeam.getfullname());
            myPS.setString(3, myTeam.getic());
            myPS.setString(4, myTeam.getemail());
            myPS.setString(5, myTeam.getphone());
            myPS.setString(6, myTeam.getroles());

            result = myPS.executeUpdate();
            
        	out.println("<script type=\"text/javascript\">");
        	out.println("alert(\"Success Add Team Members\")");
        	out.println("</script>");
        		
        	RequestDispatcher rd = request.getRequestDispatcher("teamView.jsp");
        	rd.include(request, response);


        %>

    </body>
</html>
