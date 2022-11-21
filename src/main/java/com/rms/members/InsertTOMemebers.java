package com.rms.members;

import java.sql.PreparedStatement;
import java.sql.Timestamp;

import com.dbutil.DatabaseConnection;


public class InsertTOMemebers {
	
	public static boolean insertMembers(int customerId, Timestamp joinDate) {
		PreparedStatement pstmt = null;
//		boolean m = false;
		
		try {
			pstmt = DatabaseConnection.getConnection().prepareStatement("insert into members values(?, ?)");
			pstmt.setInt(1, customerId);
			pstmt.setTimestamp(2, joinDate);
			
			int n = pstmt.executeUpdate();
			
			if (n > 0) {
				return true;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return false;
	}
}
