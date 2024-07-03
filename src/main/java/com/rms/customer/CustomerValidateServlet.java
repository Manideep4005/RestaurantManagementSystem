package com.rms.customer;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dbutil.DatabaseConnection;
import com.loginvalidate.ValidateLogin;
import com.mysql.cj.protocol.Resultset;
import com.rms.cartfunction.CustomerAddItem;

public class CustomerValidateServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	PrintWriter out = null;
	RequestDispatcher rd = null;
	
	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		out = response.getWriter();
		response.setContentType("html/text");
		
		Integer customerId = Integer.parseInt(request.getParameter("customerid"));
		String email = request.getParameter("password");
		
		HttpSession session = request.getSession();
		
		String username = null;
		
		Connection con = DatabaseConnection.getConnection();
		ResultSet rs = null;
		
		try {
			PreparedStatement pstmt = con.prepareStatement("select * from customer where customer_id = ?");
			pstmt.setInt(1, customerId);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				username = rs.getString("customer_name");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		if (ValidateLogin.loginCustomer(customerId, email)) {
			
			
			session.setAttribute("customerId", customerId);
			session.setAttribute("customername", username);
			session.setMaxInactiveInterval(-1);
			
			
			
			
			
			response.sendRedirect("customer.jsp");
		} else {
			session.setAttribute("customerLoginError", "Invalid User id/password");
			response.sendRedirect("rms.jsp");
		}
	}
}
