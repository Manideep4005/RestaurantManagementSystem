package com.rms.customer;

import java.io.IOException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutCustomerServlet extends HttpServlet{
	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html");
		Cookie loginCookie = null;
		
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("customerId")) {
				loginCookie = cookie;
//					System.out.println(cookie.getValue());
				System.out.println(cookie.getValue() + " Logged out");
				break;
				}
			}
		}
		
//		HttpSession session = request.getSession(false);
//		System.out.println(session.getAttribute("customerId"));
//		if (session != null)
//			session.invalidate();
//		
		if (loginCookie != null) {
			loginCookie.setMaxAge(0);
			response.addCookie(loginCookie);
		}
		response.sendRedirect("rms.html");
	}
}
