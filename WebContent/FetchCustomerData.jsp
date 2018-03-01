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
    <script>
    
 	function submitForm()
 	{
 		if(!validateForm())
 		{
 			document.getElementById("validationForm").submit();
 		}
 	}
 	
 	function validateForm()
 	{
		var customerNameFlag = false;
		var ssnFlag = false;
		var zipCodeFlag = false;
		var customerEmailAddressFlag = false;
		var streetAddressFlag = false;
		var cityFlag = false;
		
		//empty all the validation divs
		document.getElementById("validationCustomerName").innerHTML = "";
		document.getElementById("validationssn").innerHTML = "";
		document.getElementById("validationZipCode").innerHTML = "";
		document.getElementById("validationCustomerEmailAddress").innerHTML = "";
		document.getElementById("validationStreetAddress").innerHTML = "";
		document.getElementById("validationCity").innerHTML = "";

		//define variables to get the field values
		var customerNameValue = document.getElementById("customerName").value;
		var ssnValue = document.getElementById("ssn").value;
		var zipCodeValue = document.getElementById("zipCode").value;
		var customerEmailAddressValue = document.getElementById("customerEmailAddress").value;
		var streetAddressValue = document.getElementById("streetAddress").value;
		var cityValue = document.getElementById("city").value;
		
		//code for customer name validation
		if(customerNameValue.length == 0){
			
			document.getElementById("validationCustomerName").innerHTML = "<li>Please enter a customer name.</li>";
			$("#customerName").prop('required',true);
			customerNameFlag = true;
		}
		else if(!customerNameValue.length == 0)
		{
			if (!customerNameValue.match(/^[a-zA-Z ]+$/))
			{
				document.getElementById("validationCustomerName").innerHTML += "<li>Please enter the cutomer name in a correct format.</li>";
				customerNameFlag = true;
			}
			if(customerNameValue.length < 4 || customerNameValue.length > 50 )
			{
				document.getElementById("validationCustomerName").innerHTML += "<li>Customer Name must contain at least 4 and at most 50 characters.</li>";
				customerNameFlag = true;
			}
		}
		else
		{
			document.getElementById("validationCustomerName").innerHTML = "";
			customerNameFlag = false;
		}
		
		console.log("1 "+customerNameFlag);		
		
		//code for customer social security number validation
		if(ssnValue.length == 0){
			
			document.getElementById("validationssn").innerHTML = "<li>Please enter a valid ssn.</li>";
			$("#ssn").prop('required',true);
			ssnFlag = true;
		}
		else if(!ssnValue.length == 0)
		{
			if (!ssnValue.match(/^\d{3}-\d{2}-\d{4}$/))
			{
				document.getElementById("validationssn").innerHTML += "<li>Please enter the ssn in a correct format.</li>";
				ssnFlag = true;
			}
		}
		else
		{
			document.getElementById("validationssn").innerHTML = "";
			ssnFlag = false;
		}
		
		console.log("2 "+ssnFlag);
		
		//code for zip code validation
		if(zipCodeValue.length == 0){
			
			document.getElementById("validationZipCode").innerHTML = "<li>Please enter a zip code.</li>";
			$("#zipCode").prop('required',true);
			zipCodeFlag = true;
		}
		else
		{
			document.getElementById("validationZipCode").innerHTML = "";
			zipCodeFlag = false;
		}
		
		console.log("3 "+zipCodeFlag);
		
		//code for customer email address validation
		if(customerEmailAddressValue.length == 0){
			
			document.getElementById("validationCustomerEmailAddress").innerHTML = "<li>Please enter a email id.</li>";
			$("#customerEmailAddress").prop('required',true);
			customerEmailAddressFlag = true;
		}
		else
		{
			document.getElementById("validationCustomerEmailAddress").innerHTML = "";
			customerEmailAddressFlag = false;
		}
		
		console.log("4 "+customerEmailAddressFlag);
		
		//code for street address validation
		if(streetAddressValue.length == 0){
			
			document.getElementById("validationStreetAddress").innerHTML = "<li>Please enter a street address.</li>";
			$("#streetAddress").prop('required',true);
			streetAddressFlag = true;
		}
		else if(!streetAddressValue.length == 0)
		{
			if (!streetAddressValue.match(/^[A-Za-z0-9 ]+$/))
			{
				document.getElementById("validationStreetAddress").innerHTML += "<li>Please enter the street address in a correct format.</li>";
				streetAddressFlag = true;
			}
			if(streetAddressValue.length < 4 || streetAddressValue.length > 50 )
			{
				document.getElementById("validationStreetAddress").innerHTML += "<li>First name must contain at least 4 characters and at most 50 characters.</li>";
				streetAddressFlag = true;
			}
		}
		else
		{
			document.getElementById("validationStreetAddress").innerHTML = "";
			streetAddressFlag = false;
		}
		
		console.log("5 "+streetAddressFlag);
		
		//code for city name validation
		if(cityValue.length == 0){
			
			document.getElementById("validationCity").innerHTML = "<li>Please enter a city name.</li>";
			$("#city").prop('required',true);
			cityFlag = true;
		}
		else if(!cityValue.length == 0)
		{
			if (!cityValue.match(/^[a-zA-Z ]+$/))
			{
				document.getElementById("validationCity").innerHTML += "<li>Please enter the city name in a correct format.</li>";
				cityFlag = true;
			}
			if(cityValue.length < 3 || cityValue.length > 50)
			{
				document.getElementById("validationCity").innerHTML += "<li>Last name must contain at least 3 characters and at most 50 characters.</li>";
				cityFlag = true;
			}
		}
		else
		{
			document.getElementById("validationCity").innerHTML = "";
			cityFlag = false;
		}
		
		console.log("6 "+cityFlag);
		
		if(customerNameFlag  || ssnFlag || zipCodeFlag || customerEmailAddressFlag || streetAddressFlag || cityFlag){
			   return true;
		   }else{
			   return false;
		   }
 	}
 	
 	function submitSearchForm()
 	{
 		var value = document.getElementById("searchData").value;
 		if(value.length==0)
 			{}
 		else if(value.length!=0)
 		{
 			document.getElementById("searchForm").action = "search";
 			document.getElementById("searchForm").submit();
 		}
 	}
 	
  </script>
    
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
              Please enter your data to validate the form
            </h3>
             <div class="form" id="validateContent">
             <form id="validationForm" name="validationForm" action="ValidateFormData.jsp">
                  <div class="form-group">
                  	<label class="control-label" for="customerName">Customer Name</label>
                  	<input type="text" class="form-control" name="customerName" id="customerName"  value = '${requestScope["customerNameValue"]}' placeholder="Customer Name"/>
                    <div id="validationCustomerName" style="color:#A52A2A"></div>
                  </div>
                  <div class="form-group">
                  <label class="control-label" for="ssn">Customer Social Security Number</label>
                    <input type="text" class="form-control" name="ssn" id="ssn" value = '${requestScope["ssnValue"]}' placeholder="Customer Social Security Number"/>
                    <div id="validationssn" style="color:#A52A2A"></div>
                  </div>
                    <div class="form-group">
                    <label class="control-label" for="zipCode">Zip Code</label>
                    <input type="text" class="form-control" name="zipCode" id="zipCode" value = '${requestScope["zipCodeValue"]}' placeholder="Zip Code"/>
                  	<div id="validationZipCode" style="color:#A52A2A">${requestScope["zipCodeStatus"]}</div>
                  </div>
                  <div class="form-group">
                  	<label class="control-label" for="customerEmailAddress">Customer Email Address</label>
                    <input type="text" class="form-control" name="customerEmailAddress" id="customerEmailAddress" value = '${requestScope["customerEmailAddressValue"]}' 
                    placeholder="Customer Email Address"/>
                  	<div id="validationCustomerEmailAddress" style="color:#A52A2A">${requestScope["customerEmailAddressStatus"]}</div>
                  </div>
                    <div class="form-group">
                    <label class="control-label" for="streetAddress">Street Address</label>
                    <textarea class="form-control" name="streetAddress" id="streetAddress" placeholder="Street Address" rows = "1">${requestScope["streetAddressValue"]}</textarea>
                    <div id="validationStreetAddress" style="color:#A52A2A"></div>
                  </div>
                  <div class="form-group">
                  <label class="control-label" for="city">City</label>
                    <input type="email" class="form-control" name="city" id="city" value = '${requestScope["cityValue"]}' placeholder="City"/>
                    <div id="validationCity" style="color:#A52A2A"></div>
                  </div>
                      <div class="form-group">
                      <label class="control-label" for="state">State</label>
                      <select class = "form-control" id="state" name="state">
                      	<option value="AL">AL</option>
							<option value="AK">AK</option>
							<option value="AR">AR</option>	
							<option value="AZ">AZ</option>
							<option value="CA">CA</option>
							<option value="CO">CO</option>
							<option value="CT">CT</option>
							<option value="DC">DC</option>
							<option value="DE">DE</option>
							<option value="FL">FL</option>
							<option value="GA">GA</option>
							<option value="HI">HI</option>
							<option value="IA">IA</option>	
							<option value="ID">ID</option>
							<option value="IL">IL</option>
							<option value="IN">IN</option>
							<option value="KS">KS</option>
							<option value="KY">KY</option>
							<option value="LA">LA</option>
							<option value="MA">MA</option>
							<option value="MD">MD</option>
							<option value="ME">ME</option>
							<option value="MI">MI</option>
							<option value="MN">MN</option>
							<option value="MO">MO</option>	
							<option value="MS">MS</option>
							<option value="MT">MT</option>
							<option value="NC">NC</option>	
							<option value="NE">NE</option>
							<option value="NH">NH</option>
							<option value="NJ">NJ</option>
							<option value="NM">NM</option>			
							<option value="NV">NV</option>
							<option value="NY">NY</option>
							<option value="ND">ND</option>
							<option value="OH">OH</option>
							<option value="OK">OK</option>
							<option value="OR">OR</option>
							<option value="PA">PA</option>
							<option value="RI">RI</option>
							<option value="SC">SC</option>
							<option value="SD">SD</option>
							<option value="TN">TN</option>
							<option value="TX">TX</option>
							<option value="UT">UT</option>
							<option value="VT">VT</option>
							<option value="VA">VA</option>
							<option value="WA">WA</option>
							<option value="WI">WI</option>	
							<option value="WV">WV</option>
							<option value="WY">WY</option>
                      </select>
                  </div>
                  <div><button type="button" class="btn" onClick="submitForm()">Submit</button></div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
    
  </body>
</html>