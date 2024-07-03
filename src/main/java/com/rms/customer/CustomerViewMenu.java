package com.rms.customer;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rms.cartfunction.CustomerAddItem;
import com.rms.menuadmin.AdminMenuBean;

/**
 * Servlet implementation class CustomerViewMenu
 */
@WebServlet("/CustomerViewMenu")
public class CustomerViewMenu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<AdminMenuBean> aBean = new ArrayList<>();
	
		String category = request.getParameter("category");
		
		AdminMenuBean bean = new AdminMenuBean();
		
		HttpSession session = request.getSession();
		
		Integer customerId = (Integer) session.getAttribute("customerId");
		
		try {
			aBean = bean.getMenuByCategory(category);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		Integer itemCount = CustomerAddItem.countItems(customerId);
		
		
		session.setAttribute("customercategory", category);
		session.setAttribute("customermenu", aBean);
		session.setAttribute("customerCartItems", itemCount);
		
		response.sendRedirect("customermenu.jsp");
		
	}

}
