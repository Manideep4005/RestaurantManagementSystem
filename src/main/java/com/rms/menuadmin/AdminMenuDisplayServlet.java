package com.rms.menuadmin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminMenuDisplayServlet extends HttpServlet {
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<AdminMenuBean> aList = new ArrayList<>();
		AdminMenuBean aBean = new AdminMenuBean();
		
		try {
			aList = aBean.getMenu();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("alist", aList);
		
		RequestDispatcher rd = request.getRequestDispatcher("adminMenu.jsp");
		rd.forward(request, response);
	}
}
