package com.rms.customer;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.time.Instant;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dbutil.DatabaseConnection;
import com.rms.members.InsertTOMemebers;


public class RegisterCustomerServlet extends HttpServlet{
	
	
	CustomerBean b = new CustomerBean();
	
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	RequestDispatcher rd = null;
	PrintWriter out = null;
	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html");
		out = response.getWriter();
		
		String name = request.getParameter("customer name");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		long mobile = Long.parseLong(request.getParameter("mobile number"));
		try {
			pstmt = DatabaseConnection.getConnection().prepareStatement("insert into customer(customer_name, gender, email, address, mobile_number)"
					+ "values(?, ?, ?, ?,?)");
			
			pstmt.setString(1, name);
			pstmt.setString(2, gender);
			pstmt.setString(3, email);
			pstmt.setString(4, address);
			pstmt.setLong(5, mobile);
			
			int n = pstmt.executeUpdate();
			
			pstmt = DatabaseConnection.getConnection().prepareStatement("select customer_id from customer where customer_name = ? and email = ?");
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			
			rs = pstmt.executeQuery();
			
			Integer customerId = 0;
			
			while (rs.next()) {
				customerId = rs.getInt("customer_id");
			}
			
			ArrayList<Integer> a =  new ArrayList<>();
			a.add(customerId);
			
			request.setAttribute("id", a);
			
			
			if (n > 0) {
//				out.println("<h2>Your are sucessfully registered and ID is "+ customerId + "</h2>");
				rd = request.getRequestDispatcher("customerRedirect.jsp");
				
				rd.include(request, response);
//				rd.forward(request, response);
				
			}
			else {
				
			}
			
		} catch (Exception e) {
			response.sendError(404, e.getLocalizedMessage());
		}
		finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				
				
			} catch (Exception e2) {
				out.print(e2.toString());
			}
		}
		out.close();
	}
}
