package com.rms.cartfunction;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dbutil.DatabaseConnection;

/**
 * Servlet implementation class CustomerCartItemRemove
 */
@WebServlet("/CustomerCartItemRemove")
public class CustomerCartItemRemove extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		Integer customerId = (Integer) session.getAttribute("customerId");
		
		String item = request.getParameter("item");
		String cartItemId = request.getParameter("cart_item_id");
		
		PreparedStatement pstmt = null;
		Connection con = null;
		
		try {
			
			con = DatabaseConnection.getConnection();
			pstmt = con.prepareStatement("delete from cart where product_id = ? and user_id = ? and cart_item_id = ?");
			pstmt.setString(1, item);
			pstmt.setInt(2, customerId);
			pstmt.setString(3, cartItemId);
			
			int n = pstmt.executeUpdate();
			
			if (n > 0) {
				System.out.println("Item deleted from cart.");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				
				if (con != null) {
					pstmt.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
		response.sendRedirect("CustomerViewCartItems");
	
	}

}
