package com.rms.cartfunction;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dbutil.DatabaseConnection;

/**
 * Servlet implementation class CustomerAddItem
 */
@WebServlet("/CustomerAddItem")
public class CustomerAddItem extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@SuppressWarnings("resource")
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		Integer customerId = (Integer) session.getAttribute("customerId");

		String itemId = request.getParameter("item");

		System.out.println(itemId);
		System.out.println("Customer ID " + customerId);

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = DatabaseConnection.getConnection();
			pstmt = con.prepareStatement("select * from menu where product_id = ?");
			pstmt.setString(1, itemId);

			rs = pstmt.executeQuery();

			Integer pId = null;
			String pName = null;
			Double price = null;

			while (rs.next()) {
				pId = rs.getInt("product_id");
				pName = rs.getString("product_name");
				price = rs.getDouble("price");
			}
			
			
			// Inserting into cart
			int n = insertIntoCart(pId, pName, price, customerId);
			
			
			if (n > 0) {
				System.out.println("Inserted into cart");
			}
			
			
			// Count of items in cart
			Integer itemCount = countItems(customerId);
			
			System.out.println("Items in cart : " + itemCount + "\n");
			
			session.setAttribute("customerCartItems", itemCount);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}

				if (con != null) {
					con.close();
				}

				if (rs != null) {
					rs.close();
				}
			} catch (Exception e2) {

			}
		}

	String category = 	(String)session.getAttribute("customercategory");
		
		response.sendRedirect("CustomerViewMenu?category="+category);
	}

	
	
	
	// Helper method to insert rows in table
	public static int insertIntoCart(Integer pId, String pName, Double price, Integer customerId) {

		Connection con = null;
		PreparedStatement pstmt = null;
		int n = 0;

		try {
			con = DatabaseConnection.getConnection();
			pstmt = con
					.prepareStatement("insert into cart(product_id, product_name, price, user_id) values (?, ?, ?, ?)");
			pstmt.setInt(1, pId);
			pstmt.setString(2, pName);
			pstmt.setDouble(3, price);
			pstmt.setInt(4, customerId);

			n = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}

				if (con != null) {
					con.close();
				}

			} catch (Exception e2) {

			}
		}

		return n;
	}
	
	
	
	
	// helper method to count items in cart
	public static int countItems(Integer customerId) {
		
		PreparedStatement pstmt = null;
		Connection con = null;
		ResultSet rs = null;
		
		int count = 0;
		
		try {
			
			con = DatabaseConnection.getConnection();
			pstmt = con.prepareStatement("select count(*) from cart where user_id = ?");
			pstmt.setInt(1, customerId);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			count = rs.getInt(1);
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return count;
	}
	
	
	public static double sumPrices(Integer customerId) {
		PreparedStatement pstmt = null;
		Connection con = null;
		ResultSet rs = null;
		
		double totalPrice = 0;
		
		try {
			
			con = DatabaseConnection.getConnection();
			pstmt = con.prepareStatement("select sum(price) from cart where user_id = ?");
			pstmt.setInt(1, customerId);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			totalPrice = rs.getInt(1);
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return totalPrice;
	}
}
