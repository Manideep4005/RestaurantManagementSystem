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
 * Servlet implementation class AdminDisplayInvoice
 */
@WebServlet("/AdminDisplayInvoice")
public class AdminDisplayInvoice extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		ArrayList<InvoiceNewBean> iList = null;
		InvoiceNewBean iBean = new InvoiceNewBean();
		
		try {
			iList = iBean.getInvoiceList();
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		session.setAttribute("invoiceList", iList);
		response.sendRedirect("adminViewInvoice.jsp");
	}

}
