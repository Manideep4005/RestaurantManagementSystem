package com.rms.menuadmin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dbutil.DatabaseConnection;

/**
 * Servlet implementation class AdminMenuUpdate
 */
@WebServlet("/AdminMenuUpdate")
public class AdminMenuUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Integer mid = Integer.parseInt(request.getParameter("itemId"));
		String productName = request.getParameter("itemName");
		String category = request.getParameter("category");
		Double price = Double.parseDouble(request.getParameter("price"));
		
		PreparedStatement pstmt = null;
		Connection con = null;
		
	
		try {
			
			con = DatabaseConnection.getConnection();
			pstmt = con.prepareStatement("update menu set product_name = ?, price = ?, category = ? where product_id = ?");
			pstmt.setString(1, productName);
			pstmt.setDouble(2, price);
			pstmt.setString(3, category);
			pstmt.setInt(4, mid);
			
			
			int n = pstmt.executeUpdate();
			
			if (n > 0) {
				response.sendRedirect("/RMS/displayadminmenu");
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		
	
	}
}
