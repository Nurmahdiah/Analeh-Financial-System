<%-- 
    Document   : deleteteam
    Created on : 1 Jun 2021, 3:35:39 PM
    Author     : HP 840G
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Team</title>
    </head>
    <body>
        <%
        
        try{
        
            String Id= request.getParameter ("staffid");
            int staffId =Integer.parseInt(Id);
            Class.forName("com.mysql.jdbc.Driver");

            java.sql.Connection myConnection = DriverManager.getConnection("jdbc:mysql://localhost:3307/financial","root","");
        	
            String mySqlQuery= "delete from team where staffid=?";
            PreparedStatement myPs=myConnection.prepareStatement(mySqlQuery);
            
            myPs.setInt(1, staffId);
            
            if (myPs.executeUpdate()!=0){
            
            out.println("<script type=\"text/javascript\">");
            out.println("alert(\"Success delete Team\")");
            out.println("</script >");
            
            RequestDispatcher rd= request.getRequestDispatcher("teamView.jsp");
            rd.include(request, response);
            
            }
            
        }
        
        catch (Exception e) {
		e.printStackTrace();
		}
       %>
        
                
            
    </body>
</html>
