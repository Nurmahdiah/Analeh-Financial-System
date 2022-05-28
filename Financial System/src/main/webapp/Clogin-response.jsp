<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*, java.util.*"%>
<title>Login</title>
<%
String email=request.getParameter("emailUser"); 

session.putValue("email",email); 

String password=request.getParameter("passwordUser"); 
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/financial","root","");
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from userLogin where email='"+email+"' and password='"+password+"'"); 
try{
rs.next();
if(rs.getString("password").equals(password)&&rs.getString("email").equals(email)) 
{ 

out.println("<script type=\"text/javascript\">");
out.println("alert(\"Login Success, Welcome !"+email+"\")");
out.println("</script>");

RequestDispatcher rd = request.getRequestDispatcher("Cdashboard.jsp");
rd.include(request, response);

} 
else{
	out.println("<script type=\"text/javascript\">");
	out.println("alert(\"Incorrect Email or Password\")");
	out.println("</script>");

}
}
catch (Exception e) {
e.printStackTrace();
}
%>