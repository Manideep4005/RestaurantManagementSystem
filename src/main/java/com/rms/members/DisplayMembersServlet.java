package com.rms.members;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DisplayMembersServlet extends HttpServlet {
	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		MemberBean m = new MemberBean();
		ArrayList<MemberBean> mList = new ArrayList<>();
		
		HttpSession session = request.getSession();
		
		try {
			mList = m.getMembers();
		} catch (Exception e) {
			response.sendRedirect(e.toString());
		}
		
		session.setAttribute("mList", mList);
		
		response.sendRedirect("adminMembers.jsp");
	}
}
