package com.rms.sales;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.dbutil.DatabaseConnection;

public class SalesBean implements Serializable{
	private int customerid;
	private Date orderDate;
	private int productid;
	
	
	public int getCustomerid() {
		return customerid;
	}
	public void setCustomerid(int customerid) {
		this.customerid = customerid;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public int getProductid() {
		return productid;
	}
	public void setProductid(int productid) {
		this.productid = productid;
	}
	
	
	public ArrayList<SalesBean> getSales()	{
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<SalesBean> sList = null;
		SalesBean sBean = null;
		
		try {
			con = DatabaseConnection.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery("select * from sales");
			sList = new ArrayList<SalesBean>();
			
			while (rs.next()) {
				sBean = new SalesBean();
				
				sBean.setCustomerid(rs.getInt("customer_id"));
				sBean.setOrderDate(rs.getDate("order_date"));
				sBean.setProductid(rs.getInt("product_id"));
				
				sList.add(sBean);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if (rs != null) {
					rs.close();
				}
				
				if (stmt != null) {
					stmt.close();
				}
				
				if (con != null) {
					con.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return sList;
	}
}
