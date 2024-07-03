package com.rms.invoice;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AdminPrintInvoice
 */
@WebServlet("/AdminPrintInvoice")
public class AdminPrintInvoice extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		InvoiceNewItems newItems = new InvoiceNewItems();
		InvoiceNewBean iBean = new InvoiceNewBean();

		ArrayList<InvoiceNewItems> iItems = null;
		ArrayList<InvoiceNewBean> iList = null;

		Integer order_id = Integer.parseInt(request.getParameter("oid"));
		String InvoiceNumber = request.getParameter("inumber");
		
		try {
			iItems = newItems.getNewItemsList(order_id, InvoiceNumber);
			iList = iBean.getOrdersData(order_id, InvoiceNumber);
		} catch (Exception e) {
			// TODO: handle exception
		}

		session.setAttribute("adminInvoice", iList);
		session.setAttribute("adminInvoiceItems", iItems);

		response.sendRedirect("AdminPrintInvoice.jsp");
	}

}
