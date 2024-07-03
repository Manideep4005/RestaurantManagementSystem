package com.rms.customer;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.dbutil.DatabaseConnection;

public class InvoiceBean implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer customerId;
	private String customerName;
	private Integer itemId;
	private String itemName;
	private Double price;
	private Double tax;
	private Double total;
	private Date order_date;
	private String invoice_number;
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
	public Integer getItemId() {
		return itemId;
	}
	public void setItemId(Integer itemId) {
		this.itemId = itemId;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
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
	
	
	public ArrayList<InvoiceBean> getOrdersList(Integer userId) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		InvoiceBean Ibean = null;
		
		ArrayList<InvoiceBean> iBean = new ArrayList<>();
		
		try {
			
			con = DatabaseConnection.getConnection();
			pstmt = con.prepareStatement("select * from invoice where customer_id = ?");
			pstmt.setInt(1, userId);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Ibean = new InvoiceBean();
				
				Ibean.setItemId(rs.getInt("item_id"));
				Ibean.setItemName(rs.getString("item_name"));
				Ibean.setPrice(rs.getDouble("price"));
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
	
}
