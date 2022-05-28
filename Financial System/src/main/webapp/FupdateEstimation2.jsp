<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Estimation</title>
</head>
<body>

<%
		int id = Integer.parseInt(request.getParameter("id"));
		String pn= request.getParameter("projectname");
		String d= request.getParameter("date");
		String m= request.getParameter("month");
		String y= request.getParameter("year");
		String amt= request.getParameter("amount");
		
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/financial","root","");
		
		String sql = "Update estimation set projectName=?,date=?,year=?,month=?,estAmount=? where id="+id;
		
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1,pn);
		st.setString(2,d);
		st.setString(3,y);
		st.setString(4,m);
		st.setString(5,amt);
		
		if ((st.executeUpdate() != 0 )){
			
		out.println("<script type=\"text/javascript\">");
		out.println("alert(\"Success Update Estimation\")");
		out.println("</script>");
			
		RequestDispatcher rd = request.getRequestDispatcher("FestimationView.jsp");
		rd.include(request, response);
		
		}
		con.close();

	%>
</body>
</html>