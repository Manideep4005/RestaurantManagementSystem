package com.dbutil;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnection {
	public static Connection getConnection() {
		Connection con = null;
		try {
//			Class.forName("com.mysql.jdbc.Driver");
//			con =  DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "nakka", "nakka");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rms", "root", "root");
		} catch (Exception e) {
//			System.out.println(e);
			e.printStackTrace();
		}
		return con;
	}
}
