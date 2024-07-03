package com.rms.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rms.customer.CustomerBean;

public class DisplayCustomer extends HttpServlet{
	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		CustomerBean cust = new CustomerBean();
		ArrayList<CustomerBean> cList = new ArrayList<CustomerBean>();
		
		HttpSession session = request.getSession();
		
		try {
			cList = cust.getCustomers();
		} catch (Exception e) {
			response.sendError(456, e.toString());
		}
		
		session.setAttribute("clist", cList);
		
		response.sendRedirect("adminViewCustomer.jsp");
		
	}
}
