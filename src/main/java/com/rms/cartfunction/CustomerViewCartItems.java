package com.rms.cartfunction;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CustomerViewCartItems
 */
@WebServlet("/CustomerViewCartItems")
public class CustomerViewCartItems extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		Integer customerId = (Integer) session.getAttribute("customerId");
		
		Double totalPrice = null;
		
		ArrayList<CartBean> cList = new ArrayList<>();
		CartBean cBean = new CartBean();
		
		try {
			cList = cBean.getCartItems(customerId);
			totalPrice = CustomerAddItem.sumPrices(customerId);
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		session.setAttribute("totalCartValue", totalPrice);
		session.setAttribute("customerViewCartItems", cList);
		response.sendRedirect("customerviewcartitems.jsp");
	}

}
