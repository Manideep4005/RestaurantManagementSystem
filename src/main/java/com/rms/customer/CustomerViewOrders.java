package com.rms.customer;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rms.invoice.InvoiceNewBean;

/**
 * Servlet implementation class CustomerViewOrders
 */
@WebServlet("/CustomerViewOrders")
public class CustomerViewOrders extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*  This is for old Invoice table
		
			ArrayList<InvoiceBean> iList = new ArrayList<>();
			InvoiceBean iBean = new InvoiceBean();
			iList = iBean.getOrdersList(customerId);
		*/
		
		HttpSession session = request.getSession();
		
		Integer customerId = (Integer) session.getAttribute("customerId");
		
		ArrayList<InvoiceNewBean> iList = new ArrayList<>();
		
		InvoiceNewBean iBean = new InvoiceNewBean();
		
		try {
			iList = iBean.getOrdersList(customerId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		session.setAttribute("customerOrdersList", iList);
	
		response.sendRedirect("customersalesview.jsp");
	}
 
	 

}
