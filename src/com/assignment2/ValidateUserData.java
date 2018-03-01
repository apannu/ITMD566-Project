package com.assignment2;

/**
 * @author Anirudh Pannu
 *
 */
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathFactory;
import org.w3c.dom.Document;

public class ValidateUserData {

	//code to validate zip code
    public boolean validateZipCode(String zipCode) {
    	
    	String zipCodeRegex = "^[0-9]{5}(?:-[0-9]{4})?$";
    	Pattern pattern = Pattern.compile(zipCodeRegex);
    	Matcher matcher = pattern.matcher(zipCode);
    	
        boolean zipCodeFlag = false;
        
        if(matcher.matches())
        	zipCodeFlag = true;
        
        return zipCodeFlag;
    }
    
 public boolean validateEmailAddress(String emailAddress) {
    	
    	String emailAddressRegex = "^[_A-Za-z0-9-]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
    	Pattern pattern = Pattern.compile(emailAddressRegex);
    	Matcher matcher = pattern.matcher(emailAddress);
    	
        boolean emailIdFlag = false;
        
        if(matcher.matches())
        	emailIdFlag = true;
        
        return emailIdFlag;
    }
 
 public String[] getLatLongPositions(String address) throws Exception
 {
   int responseCode = 0;
   String api = "http://maps.googleapis.com/maps/api/geocode/xml?address=" + URLEncoder.encode(address, "UTF-8") + "&sensor=true";
   URL url = new URL(api);
   HttpURLConnection httpConnection = (HttpURLConnection)url.openConnection();
   httpConnection.connect();
   responseCode = httpConnection.getResponseCode();
   if(responseCode == 200)
   {
     DocumentBuilder builder = DocumentBuilderFactory.newInstance().newDocumentBuilder();;
     Document document = builder.parse(httpConnection.getInputStream());
     XPathFactory xPathfactory = XPathFactory.newInstance();
     XPath xpath = xPathfactory.newXPath();
     XPathExpression expr = xpath.compile("/GeocodeResponse/status");
     String status = (String)expr.evaluate(document, XPathConstants.STRING);
     if(status.equals("OK"))
     {
        expr = xpath.compile("//geometry/location/lat");
        String latitude = (String)expr.evaluate(document, XPathConstants.STRING);
        expr = xpath.compile("//geometry/location/lng");
        String longitude = (String)expr.evaluate(document, XPathConstants.STRING);
        return new String[] {latitude, longitude};
     }
     else
     {
        throw new Exception("Error from the API - response status: "+status);
     }
   }
   return null;
 }
}