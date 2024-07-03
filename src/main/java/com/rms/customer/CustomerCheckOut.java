package com.rms.customer;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dbutil.CurrentDate;
import com.dbutil.DatabaseConnection;
import com.rms.cartfunction.CartBean;
import com.rms.cartfunction.CustomerAddItem;

/**
 * Servlet implementation class CustomerCheckOut
 */
@WebServlet("/CustomerCheckOut")
public class CustomerCheckOut extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		// Customer Id from session
		Integer customerId = (Integer) session.getAttribute("customerId");

		// Customer name from session
		String customerName = (String) session.getAttribute("customername");

		CartBean cBean = new CartBean();

		ArrayList<CartBean> cList = cBean.getCartItems(customerId);

		String invoiceNumber = invoiceNumber();

		Date date = CurrentDate.getCurrentDate();

		Double subTotal = cartItemTotalPrice(customerId);

		Double tax = taxGenerator(subTotal);

		Double total = subTotal + (subTotal * tax / 100);

		// Inserting into invoice new
		int invoice = insertIntoInvoiceNew(customerId, date, customerName, invoiceNumber, subTotal, total, tax);

		Integer order_id = getOrderIdFromInvoiceNew(customerId, date, invoiceNumber);

		// Inserting into sales
		int sales = insertIntoSales(customerId, date);

		// inserting into invoice new list items
		insertIntoInvoiceItems(cList, invoiceNumber, customerId, date, order_id);

		if (invoice > 0 && sales > 0) {
			System.out
					.println("----------------------------------------------------\nInserted into sales and invoice\n");
		}

		System.out.println("Customer Id : " + customerId);
		System.out.println("Customer Name : " + customerName);
		System.out.println("Items : " + CustomerAddItem.countItems(customerId));
		System.out.println("Order Id : " + order_id);
		System.out.println("Order Date : " + date);
		System.out.println("Invoice Number : " + invoiceNumber);
		System.out.println("Sub Total : " + subTotal);
		System.out.println("Tax : " + tax);
		System.out.println("Total : " + total);

		int delete = deleteItemFromCart(customerId);

		if (delete > 0) {
			System.out.println("\nItems removed from cart where customer Id : " + customerId
					+ "\n----------------------------------------------------");
		}
		
		
		session.setAttribute("customerTax", tax);
		session.setAttribute("customerSubTotal", subTotal);
		session.setAttribute("customerTotal", total);
		session.setAttribute("customerInvoiceNumber", invoiceNumber);
		session.setAttribute("customerOrderId", order_id);

		response.sendRedirect("CustomerOrderSuccess");

	}

	/* Generating Invoice Number */
	public static String invoiceNumber() {
		String numbers = "1234567890";

		// combine all strings
		String alphaNumeric = numbers;

		// create random string builder
		StringBuilder sb = new StringBuilder();

		// create an object of Random class
		Random random = new Random();

		// specify length of random string
		int length = 5;

		for (int i = 0; i < length; i++) {

			// generate random index number
			int index = random.nextInt(alphaNumeric.length());

			// get character specified by index
			// from the string
			char randomChar = alphaNumeric.charAt(index);

			// append the character to string builder
			sb.append(randomChar);
		}

		String invoice = "M-" + sb.toString();

		return invoice;
	}

	/* Insert Into Sales new table */
	public static int insertIntoSales(Integer customerId, Date order_date) {

		Connection con = null;
		PreparedStatement pstmt = null;

		int n = 0;

		try {

			con = DatabaseConnection.getConnection();
			pstmt = con.prepareStatement("insert into sales_new values(?, ?)");
			pstmt.setInt(1, customerId);
			pstmt.setDate(2, order_date);

			n = pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("\nException from insert into Sales new " + e);
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

	/* Insert into invoice new */
	public static int insertIntoInvoiceNew(Integer customerId, Date order_date, String customerName,
			String invoiceNumber, Double subtotal, Double total, double tax) {

		Connection con = null;
		PreparedStatement pstmt = null;

		int n = 0;

		try {

			con = DatabaseConnection.getConnection();
			pstmt = con.prepareStatement(
					"insert into invoice_new(customer_id, customer_name, sub_total, tax, total, order_date, invoice_number) values(?, ?, ?, ?, ?, ?, ?)");
			pstmt.setInt(1, customerId);
			pstmt.setString(2, customerName);
			pstmt.setDouble(3, subtotal);
			pstmt.setDouble(4, tax);
			pstmt.setDouble(5, total);
			pstmt.setDate(6, order_date);
			pstmt.setString(7, invoiceNumber);

			n = pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("\nException from insert into invoice new " + e);
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

	/* Insert Into invoice_items */
	public static void insertIntoInvoiceItems(ArrayList<CartBean> cList, String invoice_number, Integer customerId,
			Date order_date, Integer order_id) {

		Connection con = null;
		PreparedStatement pstmt = null;

		boolean falg = false;

		try {

			con = DatabaseConnection.getConnection();

			con.setAutoCommit(false);

			pstmt = con.prepareStatement(
					"insert into invoice_new_items(order_date, invoice_number, customer_id, product_id, product_name, price, order_id) values(?, ?, ?, ?, ?, ?, ?)");

			for (CartBean c : cList) {

				pstmt.setDate(1, order_date);
				pstmt.setString(2, invoice_number);
				pstmt.setInt(3, customerId);
				pstmt.setInt(4, c.getItemId());
				pstmt.setString(5, c.getItemName());
				pstmt.setDouble(6, c.getPrice());
				pstmt.setInt(7, order_id);

				pstmt.addBatch();
			}

			pstmt.executeBatch();

			falg = true;
		} catch (Exception e) {
			System.out.println("\nException from insert into invoice new items " + e);
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}

				if (con != null) {

					if (falg)
						con.commit();
					else
						con.rollback();

					con.close();
				}

			} catch (Exception e2) {

			}
		}

	}

	/* Getting order id from inovice_new */
	public static Integer getOrderIdFromInvoiceNew(Integer customerId, Date order_date, String InvoiceNumber) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Integer order_Id = null;

		try {

			con = DatabaseConnection.getConnection();
			pstmt = con.prepareStatement(
					"select * from invoice_new where customer_id = ? and order_date = ? and invoice_number = ?");
			pstmt.setInt(1, customerId);
			pstmt.setDate(2, order_date);
			pstmt.setString(3, InvoiceNumber);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				order_Id = rs.getInt("order_id");
			}

		} catch (Exception e) {
			System.out.println("\nException from get order Id from invoice new " + e);
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

		return order_Id;

	}

	/* Tax rate generator based on price */
	public static Double taxGenerator(Double price) {

		double tax = 0.0;

		if (price >= 500 && price <= 1000) {
			tax = 1;
		} else if (price > 1000 && price <= 4000) {
			tax = 1.5;
		} else if (price > 4000) {
			tax = 2;
		} else if (price >= 1 && price < 500) {
			tax = 0;
		}

		return tax;
	}

	/* Adding the items prices in cart */
	public static double cartItemTotalPrice(Integer customerId) {
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

		} finally {
			try {
				if (con != null) {
					con.close();
				}

				if (pstmt != null) {
					con.close();
				}

				if (rs != null) {
					rs.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}

		return totalPrice;
	}

	/* Deleting Items from cart after checkout */
	public static int deleteItemFromCart(Integer customerId) {
		PreparedStatement pstmt = null;
		Connection con = null;
		ResultSet rs = null;

		int n = 0;

		try {

			con = DatabaseConnection.getConnection();
			pstmt = con.prepareStatement("delete from cart where user_id = ?");
			pstmt.setInt(1, customerId);

			n = pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("FROM DELETE FROM CART " + e);
		} finally {
			try {
				if (con != null) {
					con.close();
				}

				if (pstmt != null) {
					con.close();
				}

				if (rs != null) {
					rs.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}

		return n;
	}

}
