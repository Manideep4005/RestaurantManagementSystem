package com.rms.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dbutil.*;

public class RegisterAdminServlet extends HttpServlet{
	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
		
		
		PreparedStatement pstmt = null;
		RequestDispatcher rd = null;
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		long mobile = Long.parseLong(request.getParameter("mobile number"));
		String address = request.getParameter("address");
		
		try {
			pstmt = DatabaseConnection.getConnection().prepareStatement("insert into admin values(?, ?, ?, ?, ?)");
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			pstmt.setString(3, email);
			pstmt.setLong(4, mobile);
			pstmt.setString(5, address);
			
			
			int n = pstmt.executeUpdate();
			
			if (n > 0) {
				out.print("<h1>You are successfully registered!</h1>");
//				rd = request.getRequestDispatcher("adminRedirect.jsp");
//				rd.forward(request, response);
//				rd.include(request, response);
				response.sendRedirect("adminRedirect.jsp");
			} 
			else { 
				out.print("<h2 font=\"red\" align=center>username unavailable or alredy exits</h2>");
				rd = request.getRequestDispatcher("registeradmin.html");
				rd.include(request, response);
			}
			
		} catch (Exception e) {
			out.print("<h2  align=center>username unavailable or alredy exits</h2>");
			rd = request.getRequestDispatcher("registeradmin.html");
			rd.include(request, response);
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
