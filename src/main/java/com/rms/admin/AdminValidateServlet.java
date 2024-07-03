package com.rms.admin;

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
import com.loginvalidate.*;

public class AdminValidateServlet extends HttpServlet {
	PrintWriter out = null;
	RequestDispatcher rd = null;

	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		out = response.getWriter();
		response.setContentType("text/html");

		HttpSession session = request.getSession();

		String userId = request.getParameter("userid");
		String passwrod = request.getParameter("password");

		String username = null;

		Connection con = DatabaseConnection.getConnection();
		ResultSet rs = null;

		try {
			PreparedStatement pstmt = con.prepareStatement("select * from admin where user_id = ?");
			pstmt.setString(1, userId);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				username = rs.getString("username");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (ValidateLogin.login(userId, passwrod)) {

			session.setAttribute("adminId", userId);
			session.setAttribute("adminName", username);
			session.setMaxInactiveInterval(-1);
			
			response.sendRedirect("adminmodule.jsp");
		} else {
			session.setAttribute("amdinLoginError", "Invalid userId/password");
			response.sendRedirect("adminlogin.jsp");
		}

	}
}
