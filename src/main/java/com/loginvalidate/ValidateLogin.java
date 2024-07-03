package com.loginvalidate;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.dbutil.*;

public class ValidateLogin {
	
	static Connection con = null;
	static PreparedStatement pstmt = null;
	static ResultSet rs = null;
	public static boolean login(String userId, String password) {
		boolean status = false;
		try {
			pstmt = DatabaseConnection.getConnection().prepareStatement("select * from admin where user_id = ? and password = ?");
			
			pstmt.setString(1, userId);
			pstmt.setString(2, password);
			
			rs = pstmt.executeQuery();
			status = rs.next();
			
		}
		catch (Exception e) {
			System.out.println(e);
		}
		finally {
			try {
				if (con != null) {
					con.close();
					
				}
				
				if (pstmt != null) {
					pstmt.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return status;
	}
	
	public static boolean loginCustomer(Integer customerId, String password) {
		boolean status = false;
		try {
			pstmt = DatabaseConnection.getConnection().prepareStatement("select * from customer where customer_id = ? and password = ?");
			
			pstmt.setInt(1, customerId);
			pstmt.setString(2, password);
			
			rs = pstmt.executeQuery();
			status = rs.next();
			
		}
		catch (Exception e) {
			System.out.println(e);
		}
		finally {
			try {
				if (con != null) {
					con.close();
					
				}
				
				if (pstmt != null) {
					pstmt.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return status;
	}
}
