package com.rms.sales;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DisplaySalesServlet  extends HttpServlet{
	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		SalesBean s = new SalesBean();
		ArrayList<SalesBean> sList = new ArrayList<>();
		
		try {
			sList = s.getSales();
		} catch (Exception e) {
			// TODO: handle exception
			response.sendRedirect(e.toString());
		}
		
		request.setAttribute("slist", sList);
		
		RequestDispatcher rd = request.getRequestDispatcher("adminSales.jsp");
		rd.forward(request, response);
	}
}
