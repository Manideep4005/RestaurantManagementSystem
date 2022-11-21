package com.rms.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.loginvalidate.*;

public class AdminValidateServlet extends HttpServlet{
	PrintWriter out = null;
	RequestDispatcher rd = null;
	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		out = response.getWriter();
		response.setContentType("text/html");
		
		String username = request.getParameter("username");
		String passwrod = request.getParameter("password");
		
		if(ValidateLogin.login(username, passwrod)) {
//			HttpSession session = request.getSession();
//			session.setAttribute("username", username);
//			session.setMaxInactiveInterval(30*60);
			
			Cookie loginCookie = new Cookie("username", username);
			loginCookie.setMaxAge(30*60);
			response.addCookie(loginCookie);
//			rd = request.getRequestDispatcher("adminmodule.jsp");
//			rd.forward(request, response);
			response.sendRedirect("adminmodule.jsp");
		}
		else {
//			rd = request.getRequestDispatcher("loginError.jsp");
//			rd.forward(request, response);
			response.sendRedirect("loginError.jsp");
		}
		
	}
}
