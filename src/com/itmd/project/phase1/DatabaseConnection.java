package com.itmd.project.phase1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class DatabaseConnection {
	
	PreparedStatement preparedStatement = null;
	Connection connection = null;
	
	public DatabaseConnection()
	{
		try
		{
			connection = DriverManager.getConnection("jdbc:mysql://localhost/testing","root","admin");;
			preparedStatement = connection.prepareStatement("INSERT INTO CAR_DETAILS (CAR_ID, CAR_NAME, CAR_TYPE) VALUES (?, ?, ?)");
		}
		catch (Exception e)
		{
			System.out.println("An exception occured while trying to get the database connection: "+e.getMessage());
		}
	}
	
	public int setCarDetail(String carId, String carName, String carType)
	{
		int result = 0;
		try
		{
			preparedStatement.setString (1, carId);
			preparedStatement.setString(2,carName);
			preparedStatement.setString(3,carType);
			result = preparedStatement.executeUpdate();
		}
		catch (Exception e)
		{
			System.out.println("An exception occured while trying to get the database connection: "+e.getMessage());
		}
		return result;
	}
}