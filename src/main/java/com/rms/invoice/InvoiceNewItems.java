package com.rms.invoice;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.dbutil.DatabaseConnection;

@SuppressWarnings("serial")
public class InvoiceNewItems implements Serializable {
	
	private Integer product_id;
	private String product_name;
	private Double price;
	private Date order_date;
	private String InvoiceNumber;
	private Integer customerId;
	private Integer order_id;
	
	
	public Integer getProduct_id() {
		return product_id;
	}
	public void setProduct_id(Integer product_id) {
		this.product_id = product_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	public String getInvoiceNumber() {
		return InvoiceNumber;
	}
	public void setInvoiceNumber(String invoiceNumber) {
		InvoiceNumber = invoiceNumber;
	}
	public Integer getCustomerId() {
		return customerId;
	}
	public void setCustomerId(Integer customerId) {
		this.customerId = customerId;
	}
	public Integer getOrder_id() {
		return order_id;
	}
	public void setOrder_id(Integer order_id) {
		this.order_id = order_id;
	}
	
	
	public ArrayList<InvoiceNewItems> getNewItemsList(Integer order_id, String invoice_number) {
		
		PreparedStatement pstmt = null;
		Connection con = null;
		ResultSet rs = null;
		
		ArrayList<InvoiceNewItems> iList = new ArrayList<>();
		
		InvoiceNewItems item = null;
		
		try {
			con = DatabaseConnection.getConnection();
			pstmt = con.prepareStatement("select * from invoice_new_items where order_id = ? and invoice_number = ?");
			pstmt.setInt(1, order_id);
			pstmt.setString(2, invoice_number);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				item = new InvoiceNewItems();
				
				item.setProduct_id(rs.getInt("product_id"));
				item.setProduct_name(rs.getString("product_name"));
				item.setPrice(rs.getDouble("price"));
				item.setOrder_date(rs.getDate("order_date"));
				item.setInvoiceNumber(rs.getString("invoice_number"));
				item.setCustomerId(rs.getInt("customer_id"));
				item.setOrder_id(rs.getInt("order_id"));
				
				
				iList.add(item);
				
			}
			
		} catch (Exception e) {
			System.out.println("FROM INVOICE ITEMS NEW BEAN EXCEPTION " + e );
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
		
		return iList;
	}
	
}
