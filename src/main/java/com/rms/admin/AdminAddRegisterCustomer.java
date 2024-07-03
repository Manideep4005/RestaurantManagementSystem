package com.rms.admin;

import java.io.IOException;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dbutil.DatabaseConnection;

/**
 * Servlet implementation class AdminAddRegisterCustomer
 */
@WebServlet("/AdminAddRegisterCustomer")
public class AdminAddRegisterCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PreparedStatement pstmt = null;
		String name = request.getParameter("customer name");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		long mobile = Long.parseLong(request.getParameter("mobile number"));
		String password = request.getParameter("password");

		try {
			pstmt = DatabaseConnection.getConnection().prepareStatement(
					"insert into customer(customer_name,gender,email,address,mobile_number, password) values(?,?,?,?,?,?)");
			pstmt.setString(1, name);
			pstmt.setString(2, gender);
			pstmt.setString(3, email);
			pstmt.setString(4, address);
			pstmt.setLong(5, mobile);
			pstmt.setString(6, password);
			int n = pstmt.executeUpdate();

			if (n > 0) {
				response.sendRedirect("/RMS/displaycustomer");
			}

		} catch (Exception e) {
			System.out.println(e);
		}

	}
}