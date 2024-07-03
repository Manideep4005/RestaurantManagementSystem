package com.rms.sales;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AdminNewSalesDisplay
 */
@WebServlet("/AdminNewSalesDisplay")
public class AdminNewSalesDisplay extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		SalesNewBean s = new SalesNewBean();
		ArrayList<SalesNewBean> sList = new ArrayList<>();
		
		try {
			sList = s.getSales();
		} catch (Exception e) {
			System.out.println(e);
		}
		
		HttpSession session =request.getSession();
		
		session.setAttribute("slist", sList);

		response.sendRedirect("adminSales.jsp");
		
	}
}
