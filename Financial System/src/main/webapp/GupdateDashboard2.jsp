<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int eventid = Integer.parseInt(request.getParameter("hidid"));
		String even= request.getParameter("event");
		String date= request.getParameter("date");
		String info= request.getParameter("info");
		
		
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/financial","root","");
		
		String sql = "Update event set evenName=?,date=?,information=? where eventID="+eventid;
		
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1,even);
		st.setString(2,date);
		st.setString(3,info);
		
		if ((st.executeUpdate() != 0 )){
			
		out.println("<script type=\"text/javascript\">");
		out.println("alert(\"Success Update Events\")");
		out.println("</script>");
			
		RequestDispatcher rd = request.getRequestDispatcher("Gdashboard.jsp");
		rd.include(request, response);
		
		}
		con.close();

	%>
</body>
</html>