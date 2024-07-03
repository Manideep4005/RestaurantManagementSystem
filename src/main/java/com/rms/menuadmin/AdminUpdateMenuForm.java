package com.rms.menuadmin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AdminUpdateMenu
 */
@WebServlet("/AdminUpdateMenuForm")
public class AdminUpdateMenuForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Integer mid = Integer.parseInt(request.getParameter("mid"));
		
		ArrayList<AdminMenuBean> mUpdateList = null;
		AdminMenuBean mBean = new AdminMenuBean();
	
		try {
			mUpdateList = mBean.getMenuById(mid);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		HttpSession session = request.getSession();
		session.setAttribute("mUpdateList", mUpdateList);
		
		response.sendRedirect("AdminMenuUpdateForm.jsp");
	
	}

}
