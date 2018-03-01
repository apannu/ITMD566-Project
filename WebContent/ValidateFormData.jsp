<%@page import="com.assignment2.ValidateUserData"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JavaScript Validation</title>
    </head>
    <body>
        <h1>Javascript Validation through Validator Beans</h1>
        <jsp:scriptlet>
        	HttpSession httpSession = request.getSession();
        	
        	String customerNameValue= request.getParameter("customerName");
        	String ssnValue= request.getParameter("ssn");
        	String zipCodeValue= request.getParameter("zipCode");
           String customerEmailAddressValue= request.getParameter("customerEmailAddress");
           String streetAddressValue= request.getParameter("streetAddress");
           String cityValue= request.getParameter("city");
           String stateValue= request.getParameter("state");
           String latLongs[];
           
           boolean flag=true;
           
           ValidateUserData validateUserData=new ValidateUserData();
          
            if(!validateUserData.validateZipCode(zipCodeValue)){
               request.setAttribute("zipCodeStatus", "Please enter the zip code in a correct format.");
               request.setAttribute("zipCodeValue", zipCodeValue);
               flag=false;
           }
           
           if(!validateUserData.validateEmailAddress(customerEmailAddressValue)){
               request.setAttribute("customerEmailAddressStatus", "Please enter the email address in a correct format.");
               request.setAttribute("customerEmailAddressValue", customerEmailAddressValue);
               flag=false;
           }
           
            if(!flag){
            	
            	request.setAttribute("customerNameValue", customerNameValue);
            	request.setAttribute("ssnValue", ssnValue);
            	request.setAttribute("zipCodeValue", zipCodeValue);
            	request.setAttribute("customerEmailAddressValue", customerEmailAddressValue);
            	request.setAttribute("streetAddressValue", streetAddressValue);
            	request.setAttribute("cityValue", cityValue);
            	request.setAttribute("stateValue", stateValue);
            	
                request.getRequestDispatcher("/GetFormData.jsp").forward(request, response);
            }
           
           else {
               httpSession.setAttribute("zipCodeValue", zipCodeValue);
               latLongs = validateUserData.getLatLongPositions(streetAddressValue);
               System.out.println(latLongs[0]);
               System.out.println(latLongs[1]);
               httpSession.setAttribute("lattitudeValue", latLongs[0]);
               httpSession.setAttribute("longitudeValue", latLongs[1]);
               request.getRequestDispatcher("/ProcessCustomerDataRequest.jsp").forward(request, response);
           }
        </jsp:scriptlet>
    </body>
</html>
