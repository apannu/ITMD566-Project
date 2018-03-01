<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>JavaScript Validation</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900" rel="stylesheet">
    
    <link href="${pageContext.request.contextPath}/bootstrap-course/new1/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  
    <link href="${pageContext.request.contextPath}/bootstrap-course/new1/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/bootstrap-course/new1/lib/owlcarousel/owl.carousel.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/bootstrap-course/new1/lib/owlcarousel/owl.theme.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/bootstrap-course/new1/lib/owlcarousel/owl.transitions.min.css" rel="stylesheet">
    
    <link href="${pageContext.request.contextPath}/bootstrap-course/new1/css/style.css" rel="stylesheet">
    
  		<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-course/new1/lib/bootstrap/css/bootstrapValidator.min.css"/>
  		
		<script src="${pageContext.request.contextPath}/bootstrap-course/new1/lib/bootstrap/js/bootstrap.min.js"></script>
		
		<script src="https://cdnjs.cloudflare.com/ajax/libs/1000hz-bootstrap-validator/0.11.5/validator.min.js"></script>
		
	    <script src="${pageContext.request.contextPath}/bootstrap-course/new1/lib/bootstrap/js/bootstrap.min.js"></script>
	    
	<style>
	.overlay {
    opacity: 0.3;
}

ul.ui-autocomplete.ui-menu{width:520px}
.ui-menu-item{border-bottom: 2px solid #e9e9e9; text-decoration:none;}

.ui-autocomplete 
{
    max-height: 400px;
    overflow-y: auto;
    overflow-x: hidden;
}
 .ui-corner-all {
    -moz-border-radius: 0;
    -webkit-border-radius: 0;
    border-radius: 0;
}
.ui-menu {
    font-family: Verdana, Arial, Helvetica, sans-serif;
    font-size: 14px;
    text-decoration: none;
}
.ui-menu .ui-menu-item a {
	text-decoration:none;
    color: #888;
}
.ui-menu .ui-menu-item:hover {
    display: block;
     color: white;
    cursor: pointer;
    background-color: lightgray;
    background-image: none;
border: 1px solid lightgray;
}
.ui-widget-content .ui-state-hover, .ui-widget-content .ui-state-focus {
border: 1px solid lightgray;
    background-image: none;
     background-color: lightgray;
    text-decoration: none;
    font-weight: bold;
    color: white;
}
.ui-state-active, .ui-widget-content .ui-state-active, .ui-widget-header .ui-state-active, a.ui-button:active, .ui-button:active, .ui-state-active.ui-button:hover 
{
 border: 0px solid #000;
  background: lightgray;
  text-decoration: none;
}
a, u{
	text-decoration: none;
}
	</style>
    
  </head>
  
  <body class="page-index has-hero">
    <div id="background-wrapper" class="buildings" data-stellar-background-ratio="0.1">
	      
      <div id="navigation" class="wrapper">
        <div class="header">
          <div class="header-inner container">
            <div class="row">
              <div class="col-md-8">
                <div class="navbar-slogan">
                  <h4 style="font-weight: bold">Form Validation</h4>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <div id="content">
      <!-- Mission Statement -->
      <div class="mission text-center block block-pd-sm block-bg-noise">
        <div class="container">
          <h2 class="text-shadow-white">
          		Validate your form details with the help of javascript.
          </h2>
        </div>
      </div>
      
      <div class="testimonials block-contained">
        <div id="main-content" class="row">
          <div id="login-content" class="col-md-6 m-b-lg">
            <h3 class="block-title">
              Please verify your data:
            </h3>
             <div class="form" id="validateContent">
             
             	 <%
                    HttpSession httpSession = request.getSession();
                	String customerNameValue= request.getParameter("customerName");
            		String ssnValue= request.getParameter("ssn");
            		String zipCodeValue= request.getParameter("zipCode");
               		String customerEmailAddressValue= request.getParameter("customerEmailAddress");
               		String streetAddressValue= request.getParameter("streetAddress");
               		String cityValue= request.getParameter("city");
               		String stateValue= request.getParameter("state");
               		String lattitudeValue= (String)httpSession.getAttribute("lattitudeValue");
               		String longitudeValue= (String)httpSession.getAttribute("longitudeValue");

                    out.println("<table><h3> <tr><td><b>Customer Name    :</b>   </td><td>" + customerNameValue + "</td></tr></h3>");
                    out.println("<table><h3> <tr><td><b>SSN    :</b> </td><td>" + ssnValue + "</td></tr></h3>");
                    out.println("<table><h3> <tr><td><b>Zip Code    :</b> </td><td>" + zipCodeValue + "</td></tr></h3>");
                    out.println("<table><h3> <tr><td><b>Customer Email Address    :</b> </td><td>" + customerEmailAddressValue + "</td></tr></h3>");
                    out.println("<table><h3> <tr><td><b>Street Address    :</b> </td><td>" + streetAddressValue + "</td></tr></h3>");
                    out.println("<table><h3> <tr><td><b>City    :</b> </td><td>" + cityValue + "</td></tr></h3>");
                    out.println("<table><h3> <tr><td><b>State    :</b> </td><td>" + stateValue + "</td></tr></h3>");
                    out.println("<table><h3> <tr><td><b>Lattitude    :</b> </td><td>" + lattitudeValue + "</td></tr></h3>");
                    out.println("<table><h3> <tr><td><b>Longitude    :</b> </td><td>" + longitudeValue + "</td></tr></h3>");
                %>
             
            </div>
          </div>
        </div>
      </div>
    </div>
    
  </body>
</html>