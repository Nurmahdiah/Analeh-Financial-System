<!DOCTYPE html>
<html lang="en">
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
 
  <title>Profile</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
  body {
    font: 400 15px/1.8 Lato, sans-serif;
    color: #777;
  }
 
  th{
  width: 800px;;
  text-align: center;
  border-right : 1px solid grey;
  border-left : 1px solid grey;
  cell-spacing: 12px;
  padding: 15px;
  text-align: left;
  
  }
  table,td{
  width: 800px;;
  text-align: center;
  padding: 15px;
  text-align: left;
  
  }
  h3, h4 {
    margin: 10px 0 30px 0;
    letter-spacing: 10px;      
    font-size: 20px;
    color: #111;
  }
  .container {
    padding: 80px 100px;
  }
  .person {
    border: 10px solid transparent;
    margin-bottom: 25px;
    width: 80%;
    height: 80%;
    opacity: 0.7;
  }
  .person:hover {
    border-color: #f1f1f1;
  }
  .carousel-inner img {
    -webkit-filter: grayscale(90%);
    filter: grayscale(90%); /* make all photos black and white */ 
    width: 100%; /* Set width to 100% */
    margin: auto;
  }
  .carousel-caption h3 {
    color: #fff !important;
  }
  @media (max-width: 600px) {
    .carousel-caption {
      display: none; /* Hide the carousel text when the screen is less than 600 pixels wide */
    }
  }
  .bg-1 {
    background: #2d2d30;
    color: #bdbdbd;
  }
  .bg-1 h3 {color: #fff;}
  .bg-1 p {font-style: italic;}
  .list-group-item:first-child {
    border-top-right-radius: 0;
    border-top-left-radius: 0;
  }
  .list-group-item:last-child {
    border-bottom-right-radius: 0;
    border-bottom-left-radius: 0;
  }
  .thumbnail {
    padding: 0 0 15px 0;
    border: none;
    border-radius: 0;
  }
  .thumbnail p {
    margin-top: 15px;
    color: #555;
  }
  .btn {
    padding: 10px 20px;
    background-color: #333;
    color: #f1f1f1;
    border-radius: 0;
    transition: .2s;
  }
  .btn:hover, .btn:focus {
    border: 1px solid #333;
    background-color: #fff;
    color: #000;
  }
  .modal-header, h4, .close {
    background-color: #333;
    color: #fff !important;
    text-align: center;
    font-size: 30px;
  }
  .modal-header, .modal-body {
    padding: 40px 50px;
  }
  .nav-tabs li a {
    color: #777;
  }
  #googleMap {
    width: 100%;
    height: 400px;
    -webkit-filter: grayscale(100%);
    filter: grayscale(100%);
  }  
  .navbar {
    font-family: Montserrat, sans-serif;
    margin-bottom: 0;
    background-color: #2d2d30;
    border: 0;
    font-size: 11px !important;
    letter-spacing: 4px;
    opacity: 0.9;
  }
  .navbar li a, .navbar .navbar-brand { 
    color: #d5d5d5 !important;
  }
  .navbar-nav li a:hover {
    color: #fff !important;
  }
  .navbar-nav li.active a {
    color: #fff !important;
    background-color: #29292c !important;
  }
  .navbar-default .navbar-toggle {
    border-color: transparent;
  }
  .open .dropdown-toggle {
    color: #fff;
    background-color: #555 !important;
  }
  .dropdown-menu li a {
    color: #000 !important;
  }
  .dropdown-menu li a:hover {
    background-color: red !important;
  }
  footer {
    background-color: #2d2d30;
    color: #f5f5f5;
    padding: 32px;
  }
  footer a {
    color: #f5f5f5;
  }
  footer a:hover {
    color: #777;
    text-decoration: none;
  }  
  .form-control {
    border-radius: 0;
  }
  textarea {
    resize: none;
  }
  </style>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">

<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="Cdashboard.jsp">Analeh Financial System</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="CcontactView.jsp">Contact</a></li>
        <li><a href="CProjectView.jsp">Project</a></li>
        <li><a href="#tour">Estimation</a></li>
        <li><a href="#contact">Expenses</a></li>
        <li><a href="#myPage">Profit</a></li>
        <li><a href="#band">Invoice</a></li>
        <li><a href="#tour">Report</a></li>
        <li><a href="teamView.jsp">Team</a></li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">MORE
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="Cdashboard.jsp">Dashboard</a></li>
            <li><a href="CvProfile.jsp">Profile</a></li>
            <li><a href="mainPage.jsp">Logout</a></li>
          </ul>
        </li>
        <li><a href="#"><span class="glyphicon glyphicon-search"></span></a></li>
      </ul>
    </div>
  </div>
</nav>
	<%
		String profileId = request.getParameter("id");
		String role="";
		String uname="";
		String hp="";
		String icno="";
		String email="";
		String password="";
		
		
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/financial","root","");
		Statement st = con.createStatement();
		String sql = "Select * from cProfile where id="+profileId;
		
		ResultSet resultSet = st.executeQuery(sql);
		
		while(resultSet.next()){
			role = resultSet.getString(2);
			uname = resultSet.getString(3);
			hp = resultSet.getString(4);
			icno = resultSet.getString(5);
			email = resultSet.getString(6);
			password = resultSet.getString(7);
		}
		
		con.close();
	
%>
<!-- Container (The Band Section) -->
<br><br><br>
<div style="padding-left:5px;">
<p>/Profile/Update Profile</p></div>

  
  <div class="container text-center">
    <h3>Update Profile</h3>
      <div class="container">
        <form action="CprocessUpdateProfile2.jsp" method="post">
  		<input type="hidden" name="hidid" value="<%=profileId%>"/>
		<table>
    <tr>
		<th><label>Roles</label></th>
		<td><input  class="form-control" type="text" name="role" value="<%=role%>" readonly/> </td>
	</tr>
	<tr>
		<th><label>Username</label></th>
		<td><input  class="form-control" type="text" name="username" value="<%=uname%>" /> </td> 
	</tr>
	<tr>
		<th><label>Phone Number</label></th>
		<td><input   class="form-control" type="text" name="handphone" value="<%=hp%>"/> </td>
	</tr>
	<tr>
		<th><label>I/C Number</label></th>
		<td><input   class="form-control" type="text" name="icno" value="<%=icno%>"/> </td>
	</tr>
	<tr>
		<th><label>Email Address</label></th>
		<td><input   class="form-control" type="email" name="email" value="<%=email%>"readonly/> </td>
	</tr>
	<tr>
		<th><label>Password</label></th>
		<td><input  class="form-control" type="password" name="password" value="<%=password%>"readonly/> </td>
	</tr>
	</table>
	<div class="container text-left" style="padding-left:341px;">
	<input style="background-color:black; color:white;" type="submit" value="Update"> &nbsp;
	<input style="background-color:black; color:white;" type="button" value="Cancel"
				onclick="window.location.href='CvProfile.jsp'; return false;"/>
				</div>
</form>
</div>
      </div> 

<br><br><br><br><br><br>

<!-- Footer -->
<footer class="text-center">
<br><br>
  <p>Analeh Enterprise &copy; 2021</p> 
</footer>

<script>
$(document).ready(function(){
  // Initialize Tooltip
  $('[data-toggle="tooltip"]').tooltip(); 
  
  // Add smooth scrolling to all links in navbar + footer link
  $(".navbar a, footer a[href='#myPage']").on('click', function(event) {

    // Make sure this.hash has a value before overriding default behavior
    if (this.hash !== "") {

      // Prevent default anchor click behavior
      event.preventDefault();

      // Store hash
      var hash = this.hash;

      // Using jQuery's animate() method to add smooth page scroll
      // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
      $('html, body').animate({
        scrollTop: $(hash).offset().top
      }, 900, function(){
   
        // Add hash (#) to URL when done scrolling (default click behavior)
        window.location.hash = hash;
      });
    } // End if
  });
})
</script>

</body>
</html>

