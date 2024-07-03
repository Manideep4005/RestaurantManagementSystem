package com.rms.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AdminDetailsServlet
 */
@WebServlet("/AdminDetailsServlet")
public class AdminDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		String adminId = (String) session.getAttribute("adminId");
		
		
		ArrayList<AdminBean> aList = null;
		AdminBean aBean = new AdminBean();
		
		try {
			aList = aBean.getAdminById(adminId);
		} catch (Exception e) {
			System.out.println(e);
		}
		

		
		session.setAttribute("aList", aList);
		
		response.sendRedirect("admindetails.jsp");
	}

}
