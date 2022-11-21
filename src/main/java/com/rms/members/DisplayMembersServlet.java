package com.rms.members;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DisplayMembersServlet extends HttpServlet {
	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		MemberBean m = new MemberBean();
		ArrayList<MemberBean> mList = new ArrayList<>();
		
		try {
			mList = m.getMembers();
		} catch (Exception e) {
			response.sendRedirect(e.toString());
		}
		
		request.setAttribute("mlist", mList);
		
		RequestDispatcher rd = request.getRequestDispatcher("adminMembers.jsp");
		rd.forward(request, response);
	}
}
