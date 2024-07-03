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
 * Servlet implementation class AdminInsertIntoMenu
 */
@WebServlet("/AdminInsertIntoMenu")
public class AdminInsertIntoMenu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PreparedStatement pstmt = null;
		Connection con = null;
		
		String itemName = request.getParameter("itemName");
		Double price = Double.parseDouble(request.getParameter("price"));
		String category = request.getParameter("category");
		
		try {
			
			con = DatabaseConnection.getConnection();
			pstmt = con.prepareStatement("insert into menu(product_name, price, category) values(?, ?, ?)");
			pstmt.setString(1, itemName);
			pstmt.setDouble(2, price);
			pstmt.setString(3, category);
			
			int n = pstmt.executeUpdate();
			
			if (n > 0) {
				response.sendRedirect("/RMS/displayadminmenu");
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		finally {
			try {
				if (pstmt != null) 
				{
					pstmt.close();
				}
				
				if (con != null) {
					con.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
	}

}
