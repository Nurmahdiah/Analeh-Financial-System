<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile Update</title>
<link rel="stylesheet" href="ContactEdit.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
</head>
<body>



	<%
		int profileId = Integer.parseInt(request.getParameter("hidid"));
		String role= request.getParameter("role");
		String uname= request.getParameter("username");
		String hp= request.getParameter("handphone");
		String icno= request.getParameter("icno");
		String email= request.getParameter("email");
		String password= request.getParameter("password");
		
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/financial","root","");
		
		String sql = "Update fProfile set role=?,username=?,phoneNo=?,icNo=?,emailAddress=?,password=? where id="+profileId;
		
		PreparedStatement sts = con.prepareStatement(sql);
		
		sts.setString(1,role);
		sts.setString(2,uname);
		sts.setString(3,hp);
		sts.setString(4,icno);
		sts.setString(5,email);
		sts.setString(6,password);
		
		if ((sts.executeUpdate() != 0 )){
			
		out.println("<script type=\"text/javascript\">");
		out.println("alert(\"Success Update Profile\")");
		out.println("</script>");
			
		RequestDispatcher rd = request.getRequestDispatcher("FvProfile.jsp");
		rd.include(request, response);
		
		}
		con.close();

	%>

</body>
</html>