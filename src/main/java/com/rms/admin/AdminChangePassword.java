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
 * Servlet implementation class AdminChangePassword
 */
@WebServlet("/AdminChangePassword")
public class AdminChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PreparedStatement pstmt = null;
		Connection con = null;
		
		HttpSession session = request.getSession();
		
		String userId = (String) session.getAttribute("adminId");
		
		String password = request.getParameter("password");
		
		try {
			
			con = DatabaseConnection.getConnection();
			pstmt = con.prepareStatement("update admin set password = ? where user_id = ?");
			pstmt.setString(1, password);
			pstmt.setString(2, userId);
			
			int n = pstmt.executeUpdate();
			
			if (n > 0) {
				session.setAttribute("adminPasswordChange", "Password Reset Successfull");
				response.sendRedirect("admindetails.jsp");
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
	}

}
