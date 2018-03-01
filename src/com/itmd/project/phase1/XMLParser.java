package com.itmd.project.phase1;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class XMLParser {
	
	public static void main(String[] args) 
	{

		DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
		DatabaseConnection databaseConnection = new DatabaseConnection();

		try 
		{
			DocumentBuilder builder = documentBuilderFactory.newDocumentBuilder();
			Document doc = builder.parse("DummyData.xml");
			NodeList personList = doc.getElementsByTagName("car");
			for(int i=0;i<personList.getLength();i++ ){
				Node p = personList.item(i);
				if(p.getNodeType()==Node.ELEMENT_NODE){
					Element person = (Element) p;
					String id = person.getAttribute("id");
					String carName = person.getAttribute("name");
					String carType = person.getAttribute("type");
					NodeList nameList =person.getChildNodes();
					System.out.println("Car" + id + ":" + "\n");
					for(int j=0;j<nameList.getLength();j++){
						Node n = nameList.item(j);
						if(n.getNodeType()==Node.ELEMENT_NODE)
						{
							Element element = (Element) n;
							
							if(element.getTagName().equalsIgnoreCase("name"))
							{
								carName = element.getTextContent();
								System.out.println("Name: "+carName);
							}
							
							if(element.getTagName().equalsIgnoreCase("type"))
							{
								carType = element.getTextContent();
								System.out.println("Type: "+carType);
							}
							
							databaseConnection.setCarDetail(id, carName, carType);
						}
					}
				}
			}
		} 
		
		catch (Exception ex) 
		{
			System.out.println("An exception occured while trying to get the car details from the xml file."+ex.getMessage());
		}
	}
}