package com.rms.members;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.time.Instant;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dbutil.DatabaseConnection;

/**
 * Servlet implementation class AdminRemoveCustomerMemeber
 */
@WebServlet("/AdminRemoveCustomerMemeber")
public class AdminRemoveCustomerMemeber extends HttpServlet {
protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String cid = request.getParameter("cid");
		
		
		PreparedStatement pstmt = null;
		Connection con = null;
		
		try {
			con = DatabaseConnection.getConnection();
			pstmt = con.prepareStatement("delete from members where customer_id = ?");
			pstmt.setString(1, cid);
			
			int n = pstmt.executeUpdate();
			
			if (n > 0) {
				System.out.println("Deleted From members");
			}
			
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		response.sendRedirect("/RMS/displaymember");
	}

}
