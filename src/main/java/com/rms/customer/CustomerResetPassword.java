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
 * Servlet implementation class CustomerResetPassword
 */
@WebServlet("/CustomerResetPassword")
public class CustomerResetPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		Integer customerId = (Integer) session.getAttribute("customerId");

		String password = request.getParameter("password");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		Timestamp stamp = Timestamp.from(Instant.now());
		System.out.println(stamp);
		
		try {
			con = DatabaseConnection.getConnection();
			pstmt = con.prepareStatement("update customer set password = ? where customer_id = ?");
			pstmt.setString(1, password);
			pstmt.setInt(2, customerId);
			
			int n = pstmt.executeUpdate();
			
			if (n > 0) {
				session.setAttribute("customerPasswordChange", "Password changed Successfully on " + stamp);
				System.out.println("CUSTOMER PASSWORD UPDATED");
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		
		
		response.sendRedirect("CustomerViewDetails");
	}

}
