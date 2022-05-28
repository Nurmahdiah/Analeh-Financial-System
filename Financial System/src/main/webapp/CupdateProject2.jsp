<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Project</title>
<link rel="stylesheet" href="ProfileStyle.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
</head>
<body>

	<%
		int projectId = Integer.parseInt(request.getParameter("hidid"));
		String pName= request.getParameter("pname");
		String cName= request.getParameter("cname");
		String sDate= request.getParameter("dstart");
		String eDate= request.getParameter("dend");
		String Duration= request.getParameter("duration");
		String Location= request.getParameter("location");
		
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/financial","root","");
		
		String sql = "Update Projects set projectName=?,companyName=?,projStartDate=?,projEndDate=?,projectDuration=?,projectLocation=? where projectID="+projectId;
		
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1,pName);
		st.setString(2,cName);
		st.setString(3,sDate);
		st.setString(4,eDate);
		st.setString(5,Duration);
		st.setString(6,Location);
		
		if ((st.executeUpdate() != 0 )){
			
		out.println("<script type=\"text/javascript\">");
		out.println("alert(\"Success Update Project\")");
		out.println("</script>");
			
		RequestDispatcher rd = request.getRequestDispatcher("CProjectView.jsp");
		rd.include(request, response);
		
		}
		con.close();

	%>


</body>
</html>