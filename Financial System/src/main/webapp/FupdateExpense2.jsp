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
		int id = Integer.parseInt(request.getParameter("id"));
		String pn= request.getParameter("projname");
		String d= request.getParameter("date");
		String m= request.getParameter("month");
		String y= request.getParameter("year");
		String i= request.getParameter("item");
		String ds= request.getParameter("desc");
		String amt= request.getParameter("amount");
		
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/financial","root","");
		
		String sql = "Update expense set projectname=?,date=?,month=?,year=?,item=?,description=?,espAmount=? where id="+id;
		
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1,pn);
		st.setString(2,d);
		st.setString(3,m);
		st.setString(4,y);
		st.setString(5,i);
		st.setString(6,ds);
		st.setString(7,amt);
		
		if ((st.executeUpdate() != 0 )){
			
		out.println("<script type=\"text/javascript\">");
		out.println("alert(\"Success Update Expenses\")");
		out.println("</script>");
			
		RequestDispatcher rd = request.getRequestDispatcher("FexpenseView.jsp");
		rd.include(request, response);
		
		}
		con.close();

	%>
</body>
</html>