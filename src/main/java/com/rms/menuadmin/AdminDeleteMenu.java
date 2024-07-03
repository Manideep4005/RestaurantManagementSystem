package com.rms.menuadmin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dbutil.DatabaseConnection;

/**
 * Servlet implementation class AdminDeleteMenu
 */
@WebServlet("/AdminDeleteMenu")
public class AdminDeleteMenu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Integer mid = Integer.parseInt(request.getParameter("mid"));
		
		PreparedStatement pstmt = null;
		Connection con = null;
		
	
		try {
			
			con = DatabaseConnection.getConnection();
			pstmt = con.prepareStatement("delete from menu where product_id = ?");
			pstmt.setInt(1, mid);
			
			
			int n = pstmt.executeUpdate();
			
			if (n > 0) {
				response.sendRedirect("/RMS/displayadminmenu");
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		
	
	}
}
