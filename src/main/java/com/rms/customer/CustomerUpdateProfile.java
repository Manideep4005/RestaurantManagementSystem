package com.rms.customer;

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
 * Servlet implementation class CustomerUpdateProfile
 */
@WebServlet("/CustomerUpdateProfile")
public class CustomerUpdateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		Integer customerId = (Integer) session.getAttribute("customerId");

		
		String username = request.getParameter("username");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		Long mobile = Long.parseLong(request.getParameter("mobile"));
		String address = request.getParameter("address");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		Timestamp stamp = Timestamp.from(Instant.now());
		System.out.println(stamp);
		
		try {
			con = DatabaseConnection.getConnection();
			pstmt = con.prepareStatement("update customer set customer_name = ?, gender = ?, email = ?, mobile_number = ?, address = ? where customer_id = ?");
			pstmt.setString(1, username);
			pstmt.setString(2, gender);
			pstmt.setString(3, email);
			pstmt.setLong(4, mobile);
			pstmt.setString(5, address);
			pstmt.setInt(6, customerId);
			
			
			
			
			int n = pstmt.executeUpdate();
			
			if (n > 0) {
				System.out.println("CUSTOMER PROFILE UPDATED");
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		
		
		response.sendRedirect("CustomerViewDetails");
	}


}
