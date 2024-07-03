package com.rms.invoice;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.dbutil.DatabaseConnection;

public class InvoiceNewBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer customerId;
	private String customerName;
	private Double subTotal;
	private Double tax;
	private Double total;
	private Date order_date;
	private String invoice_number;
	private Integer orderId;

	public Integer getCustomerId() {
		return customerId;
	}

	public void setCustomerId(Integer customerId) {
		this.customerId = customerId;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public Double getSubTotal() {
		return subTotal;
	}

	public void setSubTotal(Double subTotal) {
		this.subTotal = subTotal;
	}

	public Double getTax() {
		return tax;
	}

	public void setTax(Double tax) {
		this.tax = tax;
	}

	public Double getTotal() {
		return total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}

	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}

	public String getInvoice_number() {
		return invoice_number;
	}

	public void setInvoice_number(String invoice_number) {
		this.invoice_number = invoice_number;
	}

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	
	
	public ArrayList<InvoiceNewBean> getInvoiceList() {

		Connection con = null;
		Statement pstmt = null;
		ResultSet rs = null;

		InvoiceNewBean Ibean = null;

		ArrayList<InvoiceNewBean> iBean = new ArrayList<>();

		try {

			con = DatabaseConnection.getConnection();
			pstmt = con.createStatement();
			
			rs = pstmt.executeQuery("select * from invoice_new order by order_date desc");

			while (rs.next()) {
				Ibean = new InvoiceNewBean();
				
				Ibean.setCustomerId(rs.getInt("customer_id"));
				Ibean.setCustomerName(rs.getString("customer_name"));
				Ibean.setOrderId(rs.getInt("order_id"));
				Ibean.setSubTotal(rs.getDouble("sub_total"));
				Ibean.setTax(rs.getDouble("tax"));
				Ibean.setTotal(rs.getDouble("total"));
				Ibean.setOrder_date(rs.getDate("order_date"));
				Ibean.setInvoice_number(rs.getString("invoice_number"));

				iBean.add(Ibean);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}

				if (con != null) {
					pstmt.close();
				}

				if (rs != null) {
					pstmt.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}

		return iBean;

	}
	
	
	public ArrayList<InvoiceNewBean> getOrdersList(Integer userId) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		InvoiceNewBean Ibean = null;

		ArrayList<InvoiceNewBean> iBean = new ArrayList<>();

		try {

			con = DatabaseConnection.getConnection();
			pstmt = con.prepareStatement("select * from invoice_new where customer_id = ?");
			pstmt.setInt(1, userId);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				Ibean = new InvoiceNewBean();

				Ibean.setOrderId(rs.getInt("order_id"));
				Ibean.setSubTotal(rs.getDouble("sub_total"));
				Ibean.setTax(rs.getDouble("tax"));
				Ibean.setTotal(rs.getDouble("total"));
				Ibean.setOrder_date(rs.getDate("order_date"));
				Ibean.setInvoice_number(rs.getString("invoice_number"));

				iBean.add(Ibean);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}

				if (con != null) {
					pstmt.close();
				}

				if (rs != null) {
					pstmt.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}

		return iBean;

	}
	
	
	public ArrayList<InvoiceNewBean> getOrdersData(Integer order_id, String invoiceNumber) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		InvoiceNewBean Ibean = null;

		ArrayList<InvoiceNewBean> iBean = new ArrayList<>();

		try {

			con = DatabaseConnection.getConnection();
			pstmt = con.prepareStatement("select * from invoice_new where order_id = ? and invoice_number = ?");
			pstmt.setInt(1, order_id);
			pstmt.setString(2, invoiceNumber);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				Ibean = new InvoiceNewBean();
				
				Ibean.setCustomerId(rs.getInt("customer_id"));
				Ibean.setCustomerName(rs.getString("customer_name"));
				Ibean.setOrderId(rs.getInt("order_id"));
				Ibean.setSubTotal(rs.getDouble("sub_total"));
				Ibean.setTax(rs.getDouble("tax"));
				Ibean.setTotal(rs.getDouble("total"));
				Ibean.setOrder_date(rs.getDate("order_date"));
				Ibean.setInvoice_number(rs.getString("invoice_number"));

				iBean.add(Ibean);
			}

		} catch (Exception e) {
			System.out.println("EXCEPTION FROM GET ORDER DATE FROM INVOICENEW BEAN " + e);
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}

				if (con != null) {
					pstmt.close();
				}

				if (rs != null) {
					pstmt.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}

		return iBean;

	}

}
