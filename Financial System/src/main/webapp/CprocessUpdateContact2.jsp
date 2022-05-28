<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact Update</title>
<link rel="stylesheet" href="ContactEdit.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
</head>
<body>

	<%
		int contactId = Integer.parseInt(request.getParameter("hidid"));
		String cregno= request.getParameter("cregno");
		String cname= request.getParameter("cname");
		String chp= request.getParameter("chp");
		String caccname= request.getParameter("caccname");
		String caccno= request.getParameter("caccno");
		String cemail= request.getParameter("cemail");
		String cstreet= request.getParameter("cstreet");
		String cpostcode= request.getParameter("cpostcode");
		String ccity= request.getParameter("ccity");
		String cstate= request.getParameter("cstate");
		String ccountry= request.getParameter("ccountry");
		
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/financial","root","");
		
		String sql = "Update Contacts set contregNo=?,contName=?,contPhoneNo=?,conBankName=?,contAccNo=?,contEmail=?,contStreet=?,contPostcode=?,contCity=?,contState=?,contCountry=? where contID="+contactId;
		
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1,cregno);
		st.setString(2,cname);
		st.setString(3,chp);
		st.setString(4,caccname);
		st.setString(5,caccno);
		st.setString(6,cemail);
		st.setString(7,cstreet);
		st.setString(8,cpostcode);
		st.setString(9,ccity);
		st.setString(10,cstate);
		st.setString(11,ccountry);
		
		if ((st.executeUpdate() != 0 )){
			
		out.println("<script type=\"text/javascript\">");
		out.println("alert(\"Success Update Contact\")");
		out.println("</script>");
			
		RequestDispatcher rd = request.getRequestDispatcher("CcontactView.jsp");
		rd.include(request, response);
		
		}
		con.close();

	%>


</body>
</html>