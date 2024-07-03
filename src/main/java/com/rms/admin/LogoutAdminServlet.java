package com.rms.admin;

import java.io.IOException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutAdminServlet extends HttpServlet{
	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html");
		 
		
		HttpSession session = request.getSession(false);
		session.removeAttribute("adminId");
		if (session != null)
			session.invalidate();
		
		 
		response.sendRedirect("adminlogin.jsp");
	}
}
