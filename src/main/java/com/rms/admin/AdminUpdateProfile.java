package com.rms.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dbutil.DatabaseConnection;

/**
 * Servlet implementation class AdminUpdateProfile
 */
@WebServlet("/AdminUpdateProfile")
public class AdminUpdateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PreparedStatement pstmt = null;
		Connection con = null;
		
		HttpSession session = request.getSession();
		
		String userId = (String) session.getAttribute("adminId");
		
		String name = request.getParameter("adminName");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		Long mobile = Long.parseLong(request.getParameter("mobile"));
		
		try {
			
			con = DatabaseConnection.getConnection();
			pstmt = con.prepareStatement("update admin set username = ?, email = ?, address = ?, contact = ? where user_id = ?");
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			pstmt.setString(3, address);
			pstmt.setLong(4, mobile);
			pstmt.setString(5, userId);
			
			int n = pstmt.executeUpdate();
			
			if (n > 0) {
				response.sendRedirect("AdminDetailsServlet");
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
	}

}
