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
import com.rms.invoice.InvoiceNewItems;

/**
 * Servlet implementation class CustomerOrderSuccess
 */
@WebServlet("/CustomerOrderSuccess")
public class CustomerOrderSuccess extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		InvoiceNewItems newItems = new InvoiceNewItems();
		InvoiceNewBean iBean = new InvoiceNewBean();
		
		ArrayList<InvoiceNewItems> iItems = null;
		ArrayList<InvoiceNewBean> iList = null;
		
		
		Integer order_id = (Integer) session.getAttribute("customerOrderId");
		String InvoiceNumber = (String) session.getAttribute("customerInvoiceNumber");
		
		 
		
		try {
			iItems = newItems.getNewItemsList(order_id, InvoiceNumber);
			iList = iBean.getOrdersData(order_id, InvoiceNumber);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		session.setAttribute("customerInvoice", iList);
		session.setAttribute("customerInvoiceItems", iItems);
		
		response.sendRedirect("customerorder.jsp");
		
	}

}
