package com.rms.customer;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CustomerViewDetails
 */
@WebServlet("/CustomerViewDetails")
public class CustomerViewDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		Integer cId = (Integer) session.getAttribute("customerId");
		
		ArrayList<CustomerBean> cList = new ArrayList<>();
		
		CustomerBean cBean = new CustomerBean();
		
		try {
			cList = cBean.getCustomerById(cId);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		session.setAttribute("customerDetails", cList);
		
		response.sendRedirect("customerdetails.jsp");
		
	}

	 

}
