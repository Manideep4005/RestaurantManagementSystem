package com.rms.customer;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.loginvalidate.ValidateLogin;

public class CustomerValidateServlet extends HttpServlet{
	PrintWriter out = null;
	RequestDispatcher rd = null;
	
	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		out = response.getWriter();
		response.setContentType("html/text");
		
		String customerId = request.getParameter("customerid");
		String email = request.getParameter("email");
		
		
		if (ValidateLogin.loginCustomer(customerId, email)) {
			//HttpSession session = request.getSession();
			//session.setAttribute("customerId", customerId);
			//session.setMaxInactiveInterval(30*60);
			
			
			Cookie loginCookie = new Cookie("customerId", customerId);
			// setting cookie to expire in 30 minutes
			loginCookie.setMaxAge(30*60);
			response.addCookie(loginCookie);
//			rd = request.getRequestDispatcher("customermenu.jsp");
//			rd.forward(request, response);
			response.sendRedirect("customermenu.jsp");
		} else {
			response.sendRedirect("custError.jsp");
		}
	}
}
