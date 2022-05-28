<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*, java.util.*"%> 
<!DOCTYPE html>
<html>
<head>
<title>Invoice</title>
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
    margin: 0%;
  }
  h3{
    margin: 10px 0 30px 0;
    letter-spacing: 2px;      
    font-size: 20px;
    color: #111;
  }
  table{
  cell-spacing: 10px;
  
  }
  .th{
   text-align: left;
   width : 550px;
  }
  .color{
  text-align: center;
  background-color: yellow;
  }
  td{
   text-align: right;
   width : 550px;
   
  }
  .td{
   text-align: right;
   width : 550px;
    height: 50px;
   
  }
  .container {
    padding-top: 40px;
    padding-bottom: 300px;
  }
   .containers {
    padding-top: 20px;
    padding-bottom: 90px;
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
  .form-controlss {
    border: 0px white solid;
    text-align: left;
    width: 400px;
  }  
  .form-control {
    border: 0px white solid;
    text-align: left;

  }
  .form-controls {
    border: 0px white solid;
    text-align: right;
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
      <a class="navbar-brand" href="Fdashboard.jsp">Analeh Financial System</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="FcontactView.jsp">Contact</a></li>
        <li><a href="FProjectView.jsp">Project</a></li>
        <li><a href="FestimationView.jsp">Estimation</a></li>
        <li><a href="FexpenseView.jsp">Expenses</a></li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">Profit
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="FprofitViews.jsp">All Monthly Profit</a></li>
            <li><a href="Fprofit.jsp">Calculate Monthly Profit</a></li>
          </ul>
        </li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">Invoice
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="invoiceNew.jsp">Create New Invoice</a></li>
            <li><a href="invoiceView.jsp">Generate Invoice</a></li>
          </ul>
        </li>
        <li><a href="#tour">Report</a></li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">MORE
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="Fdashboard.jsp">Dashboard</a></li>
            <li><a href="FvProfile.jsp">Profile</a></li>
            <li><a href="mainPage.jsp">Logout</a></li>
          </ul>
        </li>
        <li><a href="#"><span class="glyphicon glyphicon-search"></span></a></li>
      </ul>
    </div>
  </div>
</nav>
<!-- Container (The Band Section) -->
<div  class="container" style="background-color:white; color:black;">
  <p><em></em></p>
 <br>
	<h2 style="text-align:center; font-size: 14px;"> Analeh Enterprise <br>No 5, Pt 2317, Jalan Persatuan, 35500 Bidor, Perak <br> No Tel : 05-43257890 </h2>
    <p>__________________________________________________________________________________________________________________________________________________________________________________________</p>
    <div>
    <table>
  	<tr>
  	<%

		Class.forName("com.mysql.jdbc.Driver"); 
		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/financial","root","");
		
		String month = request.getParameter("month");
		String year = request.getParameter("year");
		String invNo = request.getParameter("ivno");
		String pjn = request.getParameter("pjname");
		Statement st = con.createStatement();
		String k = "Select * from invoice where invoiceNo='"+invNo+"' and projectname='"+pjn+"'";

			ResultSet rs = st.executeQuery(k);
			while(rs.next()){%>

  	<td class="th"><input type="text" class="form-controlss" size="400" readonly value="Kepada : <%=rs.getString(2)%>"/></td><td><input type="text" class="form-controls" size="40" readonly value="Nombor Invois : <%=rs.getString(6)%>"/> </td>
  	</tr>
  	<tr>
  	<td class="th"><input type="text" class="form-controlss" readonly value=" <%=rs.getString(3)%>"/></td><td><input type="text" class="form-controls" readonly value="Tarikh : <%=rs.getString(7)%>"/></td>
  	</tr>
  
    </table>
    </div>
    <div class="containers">

</div>
    <div class="text-center">
    <table border="1">
  	<tr>
  	<td class="color"> Perkara  </td><td class="color"> Jumlah</td>
  	</tr>

  	<tr>
  	<td class="th"><textarea style="text-align:center;" class="form-control" rows="10" cols="50" readonly ><%=rs.getString(4)%></textarea></td>
  	 	<%}%> 	<% 
	Statement st2 = con.createStatement();
	String l = "select * from estimation where month='"+month+"' and year='"+year+"'"; 
		
	ResultSet rs2 = st2.executeQuery(l);
	while(rs2.next()){%>

  	
  	
  	<td><textarea style="text-align:center;" class="form-control" rows="10" cols="50" readonly ><%=rs2.getDouble(6)%></textarea></td>
  	</tr>
  	<%}%>
    </table>
    

    </div>
  <br><br><br><br><br><br><br><br>
    <p>Yang benar, <br><br> &nbsp;________________________<br>(________________________)</p>
</div>
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