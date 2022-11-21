package com.rms.customer;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DisplayCustomer extends HttpServlet{
	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		CustomerBean cust = new CustomerBean();
		ArrayList<CustomerBean> cList = new ArrayList<CustomerBean>();
		
		try {
			cList = cust.getCustomers();
		} catch (Exception e) {
			response.sendError(456, e.toString());
		}
		
		request.setAttribute("clist", cList);
		
		RequestDispatcher rd = request.getRequestDispatcher("adminViewCustomer.jsp");
		rd.forward(request, response);
		
	}
}
