package com.rms.members;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rms.customer.CustomerBean;

public class DisplayMemberCustomer extends HttpServlet{
	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		CustomerBean cust = new CustomerBean();
		ArrayList<CustomerBean> cList = new ArrayList<CustomerBean>();
		
		try {
			cList = cust.getCustomers();
		} catch (Exception e) {
			response.sendError(456, e.toString());
		}
		
		request.setAttribute("clist", cList);
		
		RequestDispatcher rd = request.getRequestDispatcher("AdminCustomerToMemberAdd.jsp");
		rd.forward(request, response);
		
	}
}
